//
//  CheckDevice.m
//  BluetoothLight
//
//  Created by Consmart on 14-8-5.
//  Copyright (c) 2014年 Henry. All rights reserved.
//

#import "CheckDevice.h"

#define IPHONE4 CGSizeMake(320, 480)
#define IPHONE5 CGSizeMake(320, 568)
#define IPHONE6 CGSizeMake(375, 667)
#define IPHONE6PLU CGSizeMake(414, 736)
#define IPA CGSizeMake(768, 1024)

@implementation CheckDevice

+(NSString *)selectNibNameWithClass:(NSObject *)object
{
    
    return [self selectNibNameWithClassName:[NSString stringWithUTF8String:object_getClassName(object)]];
}

+(NSString *)selectNibNameWithClassName:(NSString *)className
{
    NSMutableString * nibName =[NSMutableString stringWithString:className];
    
    DeviceScreenBound screenBound = [CheckDevice checkDeviceScreenBound];
    
    switch (screenBound) {
        case iPhone4Screen:
            [nibName appendString:@"_iPhone4"];
            break;
        case iPhone5Screen:
            [nibName appendString:@"_iPhone5"];
            break;
        case iPhone6Screen:
            [nibName appendString:@"_iPhone6"];
            break;
        case iPhone6PluScreen:
            [nibName appendString:@"_iPhone6Plu"];
            break;
        case iPadScreen:
            [nibName appendString:@"_iPad"];
            break;
        default:
            break;
    }
    
    return nibName;
}

+(DeviceScreenBound)checkDeviceScreenBound
{
    CGSize screenBound = [UIScreen mainScreen].bounds.size;
    if (CGSizeEqualToSize(screenBound, IPHONE4)) {
        return iPhone4Screen;
    }
    if (CGSizeEqualToSize(screenBound, IPHONE5)) {
        return iPhone5Screen;
    }
    if (CGSizeEqualToSize(screenBound, IPHONE6)) {
        return iPhone6Screen;
    }
    if (CGSizeEqualToSize(screenBound, IPHONE6PLU)) {
        return iPhone6PluScreen;
    }
    if (CGSizeEqualToSize(screenBound, IPA)) {
        return iPadScreen;
    }
    return otheScreen;
}

+(DeviceType)checkDeviceType
{
    
#if TARGET_IPHONE_SIMULATOR
    return OtheDevice;
#else
    size_t size;
    
//    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
//    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) {
        
        return OtheDevice;
        
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        
        return OtheDevice;
        
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        
        return OtheDevice;
        
    } else if ([platform isEqualToString:@"iPhone3,1"]||[platform isEqualToString:@"iPhone3,2"]||[platform isEqualToString:@"iPhone3,3"]) {
        
        return iPhone4;
        
    } else if ([platform isEqualToString:@"iPhone4,1"]) {
        
        return iPhone4s;
        
    } else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]) {
        
        return iPhone5;
        
    }else if ([platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]) {
        
        return iPhone5c;
        
    }else if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        
        return iPhone5s;
        
    }else if ([platform isEqualToString:@"iPod4,1"]) {
        
        return iPod;
        
    }else if ([platform isEqualToString:@"iPod5,1"]) {
        
        return iPod;
        
    }else if ([platform isEqualToString:@"iPod3,1"]) {
        
        return iPod;
        
    }else if ([platform isEqualToString:@"iPod2,1"]) {
        
        return iPod;
        
    }else if ([platform isEqualToString:@"iPod1,1"]) {
        
        return iPod;
        
    } else if ([platform isEqualToString:@"iPad3,2"]||[platform isEqualToString:@"iPad3,1"]) {
        
        return iPad;
        
    } else if ([platform isEqualToString:@"iPad2,2"]||[platform isEqualToString:@"iPad2,1"]||[platform isEqualToString:@"iPad2,3"]||[platform isEqualToString:@"iPad2,4"]) {
        
        return iPad;
        
    }else if ([platform isEqualToString:@"iPad1,1"]) {
        
        return iPad;
        
    }else if ([platform isEqualToString:@"iPad2,5"]||[platform isEqualToString:@"iPad2,6"]||[platform isEqualToString:@"iPad2,7"]) {
        
        return iPad;
        
    } else if ([platform isEqualToString:@"iPad3,3"]||[platform isEqualToString:@"iPad3,4"]||[platform isEqualToString:@"iPad3,5"]||[platform isEqualToString:@"iPad3,6"]) {
        
        return iPad;
        
    }
    
    return OtheDevice;
#endif
    
}

+(BOOL)checkDeviceIsiPad
{
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceIsiPhone4
{
    if ([self checkDeviceType] == iPhone4) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceIsiPhone4s
{
    if ([self checkDeviceType] == iPhone4s) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceIsiPhone5
{
    if ([self checkDeviceType] == iPhone5) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceIsiPhone5c
{
    if ([self checkDeviceType] == iPhone5c) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceIsiPhone5s
{
    if ([self checkDeviceType] == iPhone5s) {
        return YES;
    }
    return NO;
}


+(BOOL)checkDeviceIsiPod
{
    if ([self checkDeviceType] == iPod) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceScreenIs3Point5Inches
{
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        return YES;
    }
    return NO;
}

+(BOOL)checkDeviceScreenIs4Inches
{
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        return YES;
    }
    return NO;
}

+(NSString*) doDevicePlatform
{
#if TARGET_IPHONE_SIMULATOR
    return @"othe";
#else
    size_t size;
//    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
//    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) {
        
        platform = @"iPhone";
        
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        
        platform = @"iPhone 3G";
        
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        
        platform = @"iPhone 3GS";
        
    } else if ([platform isEqualToString:@"iPhone3,1"]||[platform isEqualToString:@"iPhone3,2"]||[platform isEqualToString:@"iPhone3,3"]) {
        
        platform = @"iPhone 4";
        
    } else if ([platform isEqualToString:@"iPhone4,1"]) {
        
        platform = @"iPhone 4S";
        
    } else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]) {
        
        platform = @"iPhone 5";
        
    }else if ([platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]) {
        
        platform = @"iPhone 5C";
        
    }else if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        
        platform = @"iPhone 5S";
        
    }else if ([platform isEqualToString:@"iPod4,1"]) {
        
        platform = @"iPod touch 4";
        
    }else if ([platform isEqualToString:@"iPod5,1"]) {
        
        platform = @"iPod touch 5";
        
    }else if ([platform isEqualToString:@"iPod3,1"]) {
        
        platform = @"iPod touch 3";
        
    }else if ([platform isEqualToString:@"iPod2,1"]) {
        
        platform = @"iPod touch 2";
        
    }else if ([platform isEqualToString:@"iPod1,1"]) {
        
        platform = @"iPod touch";
        
    } else if ([platform isEqualToString:@"iPad3,2"]||[platform isEqualToString:@"iPad3,1"]) {
        
        platform = @"iPad 3";
        
    } else if ([platform isEqualToString:@"iPad2,2"]||[platform isEqualToString:@"iPad2,1"]||[platform isEqualToString:@"iPad2,3"]||[platform isEqualToString:@"iPad2,4"]) {
        
        platform = @"iPad 2";
        
    }else if ([platform isEqualToString:@"iPad1,1"]) {
        
        platform = @"iPad 1";
        
    }else if ([platform isEqualToString:@"iPad2,5"]||[platform isEqualToString:@"iPad2,6"]||[platform isEqualToString:@"iPad2,7"]) {
        
        platform = @"ipad mini";
        
    } else if ([platform isEqualToString:@"iPad3,3"]||[platform isEqualToString:@"iPad3,4"]||[platform isEqualToString:@"iPad3,5"]||[platform isEqualToString:@"iPad3,6"]) {
        
        platform = @"ipad 3";
        
    }
    
    return platform;
#endif
    
}
@end
