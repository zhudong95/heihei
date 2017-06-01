//
//  CheckDevice.h
//  BluetoothLight
//
//  Created by Consmart on 14-8-5.
//  Copyright (c) 2014年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceScreenBound)
{
    otheScreen  = 0,
    iPhone4Screen = 1 ,//3.5 inches screen
    iPhone5Screen = 2 ,//4 inches screen
    iPhone6Screen = 3 ,//4.7 inches screen
    iPhone6PluScreen = 4 ,//5.5 inches screen
    iPadScreen = 5//
};

typedef NS_ENUM(NSInteger, DeviceType) {
    iPhone4 =1 ,
    iPhone4s = 2,
    iPhone5 = 3,
    iPhone5s = 4,
    iPhone5c = 5,
    iPad = 6,
    iPod = 7,
    OtheDevice = 8
};

@interface CheckDevice : NSObject

/**
 * @brief selectNibNameWithClass 根据类选择nib文件
 **/
+(NSString *)selectNibNameWithClass:(NSObject *)object;

/**
 * @brief selectNibNameWithClass 根据类选择nib文件
 **/
+(NSString *)selectNibNameWithClassName:(NSString *)className;

/**
 * @brief checkDeviceScreenBound 检查设备屏幕大小
 **/
+(DeviceScreenBound)checkDeviceScreenBound;

/**
 * @brief checkDeviceType 检查设备类型
 **/
+(DeviceType)checkDeviceType;

/**
 * @brief checkDeviceIsiPad 检查是否是iPad
 **/
+(BOOL)checkDeviceIsiPad;

/**
 * @brief checkDeviceIsiPhone4s 检查是否是iPhone4s
 **/
+(BOOL)checkDeviceIsiPhone4s;

/**
 * @brief checkDeviceIsiPhone4 检查是否是iPhone4
 **/
+(BOOL)checkDeviceIsiPhone4;

/**
 * @brief checkDeviceIsiPhone5 检查是否是iPhone5
 **/
+(BOOL)checkDeviceIsiPhone5;

/**
 * @brief checkDeviceIsiPhone5c 检查是否是iPhone5c
 **/
+(BOOL)checkDeviceIsiPhone5c;

/**
 * @brief checkDeviceIsiPhone5s 检查是否是iPhone5s
 **/
+(BOOL)checkDeviceIsiPhone5s;

/**
 * @brief checkDeviceIsiPod 检查是否是iPod
 **/
+(BOOL)checkDeviceIsiPod;

/**
 * @brief checkDeviceScreenIs4Inches 检查是否是4英寸屏幕
 **/
+(BOOL)checkDeviceScreenIs4Inches;

/**
 * @brief checkDeviceScreenIs3Point5Inches 检查是否是3.5英寸屏幕
 **/
+(BOOL)checkDeviceScreenIs3Point5Inches;

/**
 * @brief doDevicePlatform 检查设备返回字符串
 * @return iPhone,iPhone 3G,iPhone 3GS,iPhone 4,iPhone 4S,iPhone 5...
 **/
+(NSString*) doDevicePlatform;
@end
