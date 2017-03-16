//
//  Macro.h
//  live
//
//  Created by kenneth on 15-7-9.
//  Copyright (c) 2015年 kenneth. All rights reserved.
//

#ifndef IwalaChat_Macro_h
#define IwalaChat_Macro_h

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_SCALEIPhone6 ([UIScreen mainScreen].bounds.size.height/667)
#define SCALE ([UIScreen mainScreen].scale)
#define STATUS_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)
#define NAVIGATIONBAR_HEIGHT (self.navigationController.navigationBar.frame.size.height)
#define TABBAR_HEIGHT (self.tabBarController.tabBar.frame.size.height)


#define ALD(x)      (x * SCREEN_WIDTH/375.0)
#define ALDHeight(y)      (y * SCREEN_HEIGHT/667.0)
#define FCFont(size) [UIFont systemFontOfSize:ALD(size)]
#define FCBoldFont(size) [UIFont boldSystemFontOfSize:ALD(size)]
#define FCSystemFont(size) [UIFont systemFontOfSize:size]

#define FCMainColor         UIColorHex(0xff4a84)
#define FCBackgroundColor   UIColorHex(0xf2f2f2)    //  背景色
#define FCWhiteColor   UIColorHex(0xfdfdfd)    //  背景白色色
#define FCLineColor         UIColorHex(0xeeeeee)   //分割线
#define FCWhiteTabColor     UIColorHex(0xf9f9f9)   //分割线
#define FCLineNavColor      UIColorHex(0xdddddd)
#define FCRedRemindColor    UIColorHex(0xfe3824)
#define FCTextMainColor    UIColorHex(0x444444)
#define FCTextSubColor    UIColorHex(0x686868)
#define FCTextSubSubColor    UIColorHex(0x999999)
#define FCTextBlueColor    UIColorHex(0x258bea)
#define FCTextOrangeColor    UIColorHex(0xffcf3a)

#define fontName_American kiOS9Later? @"PingFangSC-Light":@"AppleSDGothicNeo-Light"


//agora
#if LIAOPA
#define instVendorKey @"0927d1c4bb914c658b4a1a8ba7a88a96"
#else
#define instVendorKey @"edbfe06e96ec4bb0b4271adffa068031"
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;   //  weak self

#define kLPAWhiteTextColor [UIColor colorWithHexString:@"fdfdfd"]

#define kGeTuiClientId @"GeTuiClientId"
#define kDeviceToken @"DeviceToken"
#define kDefaultAvatarImage [UIImage imageNamed:@"user160"]    //  默认头像

#define FCToString(x)  [NSString stringWithFormat:@"%@",(((!x) || [x isKindOfClass:[NSNull class]]) ? @""  : x)]    //  ToString
#define kFCMessageTypeKey @"messageTypeKey" //  消息类型Key
#define kFCMessageSenderIdKey @"messageSenderIdKey" //  消息发送者Key
#define kFCModifyUserInfoSuccessNotification    @"FCModifyUserInfoSuccessNotification"  //  个人资料修改成功

#define kPageSize 20

//keychain关键字
#define KeychainService         @"com.heydo.papa"
#define KeychainAccount         @"uuid"

//测试http://123.206.73.195:8090/
//测试服务器地址 @"http://123.206.73.195"  正式服务器地址 @"https://api.mobile.iwala.cn" liaopa  @"https://api.v1.iwala.cn"
#define FCBaseURL @"https://api.v1.iwala.cn"

typedef void(^FCGeneralBlock)(id object);

typedef NS_ENUM(NSUInteger, FCUserEditType) {
    FCUserEditTypeDesc = 0, //  描述
    FCUserEditTypePhone,    //  手机
    FCUserEditTypeEmail,    //  电子邮件
    FCUserEditTypeGender,   //  性别  1男，2女
    FCUserEditTypeNickName,   //  昵称
    FCUserEditTypeLogo,      //  logo
    FCUserEditTypeArea,   //  地区
    FCUserEditTypeoccupation, //职业
    FCUserEditTypebloodType,   //  血型
    FCUserEditTypeBrithDate,   //  生日
    FCUserEditTypeBrithEmotional   //  情感状态
};

typedef NS_ENUM(NSUInteger, FCSharePlatformType) {
    FCSharePlatformTypeWeiXin = 0, //  微信好友
    FCSharePlatformTypeWeiXinPYQ,    //  朋友圈
    FCSharePlatformTypeQQ,   //  QQ好友
    FCSharePlatformTypeQQZone,    //  Q-zone
    FCSharePlatformTypeWeiBo,      //  微博
    
    FCSharePlatformTypeCopy = 99//复制链接
};

typedef NS_ENUM(NSUInteger, FCMessageType) {
    FCMessageTypeDefault = 0, //  文字信息
    FCMessageTypeLike,    //  赞
    FCMessageTypeGift,    //  礼物
    FCMessageTypeNotice,   //  通知
    FCMessageTypeAddUser,   //  加人
    FCMessageTypeDeleteUser,   //    移除人
    FCMessageTypeUserUnSpeak,   //   禁言
    FCMessageTypeUserSetAdmin,   //   设为管理员
    FCMessageTypeUserUnSetAdmin,   //   取消管理员
    FCMessageTypeFlower,    //  花
    FCMessageTypeFollow,    // 关注消息
    FCMessageTypeUserSpeak,   //   取消禁言
    FCMessageTypeSuperAdminRecord,
    FCMessageTypeSuperAdminStopRecord,
    FCMessageTypeSuperAdminSendMessage,
    //新增
    FCMessageTypeSystem = 99,//系统消息
    FCMessageTypeFirstEnter//用户第一次进去
};

typedef NS_ENUM(NSUInteger, FCUserFollowerContentType) {
    FCUserFollowerContentTypeSearch = 0, //  搜索
    FCUserFollowerContentTypeFollowees,    //  粉丝
    FCUserFollowerContentTypeFollowers,    //  关注
    FCUserFollowerContentTypeFriend     //  好友
};

typedef NS_ENUM(NSUInteger, AWLAudioMessageType) {
    AWLAudioMessageTypeCancel = 200, //  取消通话，主动挂断（包括无人接听）
    AWLAudioMessageTypeSelfCancel,
    AWLAudioMessageTypeRefuse,    // 对方已拒绝
    AWLAudioMessageTypeComplete,    //通话完成
    LPAUserSendGiftMessageType,
    
    LPADriftFloatTextMessageType = 300,
    LPADriftFloatSoundMessageType,
    
    AWLVideoMessageTypeCancel = 400,
    AWLVideoMessageTypeSelfCancel,
    AWLVideoMessageTypeRefuse,
    AWLVideoMessageTypeComplete,
    
    AWLChatSystemMessageType = 500,
    LPASendGiftMessage = 800, //
};


#endif

