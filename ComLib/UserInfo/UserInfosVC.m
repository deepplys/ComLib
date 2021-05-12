//
//  UserInfosVC.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "UserInfosVC.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/AFNetworking.h>
#import "UserInfoDataSource.h"
#import "UserInfosEditView.h"
#import "NSObjectGetStatus.h"
#import "UserLoginVC.h"
#import <BmobSDK/Bmob.h>

@interface UserInfosVC ()<HeadCellDelegate, UserInfosEditViewDelegate, UIImagePickerControllerDelegate, UserLoginVCDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UserInfosEditView *editView; //个人资料展开面板

@end

@implementation UserInfosVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.editView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(statusBarH));
        make.bottom.left.right.equalTo(self.view);
    }];
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_bottom);
    }];
    [super updateViewConstraints];
}

- (void)refreshData {
    [self.dataSources updateInfos];
}

- (void)jumpLogin {
    UserLoginVC *vc = [[UserLoginVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:nil];
}

- (void)jumpDetail {
    UserLoginVC *vc = [[UserLoginVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:nil];
}

- (void)backToVC {
    [self.navigationController popViewControllerAnimated:nil];
}

- (void)updateModel:(NSString *)loginId {
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"_User"];
    [bquery whereKey:@"username" equalTo:loginId];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            //处理查询结果
            for (BmobObject *obj in array) {
                if ([obj objectForKey:@"U_NickName"]) {
                    self.dataSources.userInfosModel.user.name = [obj objectForKey:@"U_NickName"];
                }
                if ([obj objectForKey:@"userIntro"]) {
                    self.dataSources.userInfosModel.user.detail  = [obj objectForKey:@"userIntro"];
                }
            }
            self.dataSources.isLogin = @"1";
            [self backToVC];
            [self.collectionView reloadData];
        }];
    
}

- (void)dispalyEditView {
    NSLog(@"todo  ....");
    self.editView.nameField.text = self.dataSources.userInfosModel.user.name;
    self.editView.detailField.text = self.dataSources.userInfosModel.user.detail;
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [UIView animateWithDuration:1 animations:^{
        [self.editView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(statusBarH));
        }];
        [self.view layoutSubviews];
    } completion:^(BOOL finished) {
        [super updateViewConstraints];
    }];
}

- (void)closeEditVC {
    if (self.editView.avtarImageView.image) {
        // todo updata avtar image
    }
    self.dataSources.userInfosModel.user.name = self.editView.nameField.text;
    self.dataSources.userInfosModel.user.detail = self.editView.detailField.text;
    [self.dataSources.collection reloadData];
    CGFloat height = self.view.frame.size.height;
    [UIView animateWithDuration:1 animations:^{
        [self.editView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(height));
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [super updateViewConstraints];
    }];
}

- (void)openAlert {
    UIAlertController *userIconActionSheet = [UIAlertController alertControllerWithTitle:@"请选择上传类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;            //协议
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
               UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //取消
    }];
    [userIconActionSheet addAction:albumAction];
    [userIconActionSheet addAction:photoAction];
    [userIconActionSheet addAction:cancelAction];
    [self presentViewController:userIconActionSheet animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];//获取到所选择的照片
    self.editView.avtarImageView.image = img;
    //UIImage *compressImg = [self imageWithImageSimple:img scaledToSize:CGSizeMake(60, 60)];//对选取的图片进行大小上的压缩
    //[self transportImgToServerWithImg:compressImg]; //将裁剪后的图片上传至服务器
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//上传图片至服务器后台
- (void)transportImgToServerWithImg:(UIImage *)img{
    NSData *imageData;
    NSString *mimetype;
  //判断下图片是什么格式
    if (UIImagePNGRepresentation(img) != nil) {
        mimetype = @"image/png";
        imageData = UIImagePNGRepresentation(img);
    }else{
        mimetype = @"image/jpeg";
        imageData = UIImageJPEGRepresentation(img, 1.0);
    }
    NSString *urlString = @"http:///XXXXXX";
    NSDictionary *params = @{@"login_token":@"220"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /*[manager POST:urlString parameters:paramsconstructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString *str = @"avatar";
        NSString *fileName = [[NSString alloc] init];
        if (UIImagePNGRepresentation(img) != nil) {
            fileName = [NSString stringWithFormat:@"%@.png", str];
        }else{
            fileName = [NSString stringWithFormat:@"%@.jpg", str];
        }
        // 上传图片，以文件流的格式
        
         *filedata : 图片的data
         *name     : 后台的提供的字段
         *mimeType : 类型
         */
    /*    [formData appendPartWithFileData:imageData name:str fileName:fileName mimeType:mimetype];
    } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //打印看下返回的是什么东西
        //WKLog(@"上传凭证成功:%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //WKLog(@"上传图片失败，失败原因是:%@", error);
    }];*/
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 4.0;
        flowLayout.minimumInteritemSpacing = 4.0;
        //ui
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsZero;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.scrollEnabled = YES;
        //delegate
        _dataSources = [[UserInfoDataSource alloc] init];
        _dataSources.collection = _collectionView;
        _dataSources.isLogin = @"0";
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

- (UserInfosEditView *)editView {
    if (!_editView) {
        _editView = [[UserInfosEditView alloc] initWithFrame:CGRectZero];
        _editView.userInteractionEnabled = YES;
        _editView.delegate = self;
    }
    return _editView;
}
@end
