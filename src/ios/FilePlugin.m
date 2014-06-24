//
//  FilePlugin.m
//  FilePlugin
//
//  Created by howiepowie on 19/06/14.
//  Copyright (c) 2014 howiepowie. All rights reserved.
//
#if TARGET_OS_IPHONE
#import <MobileCoreServices/MobileCoreServices.h>
#else
#import <CoreServices/CoreServices.h>
#endif
#import "FilePlugin.h"
#import "TTOpenInAppActivity.h"

@implementation FilePlugin

- (void)writefile:(CDVInvokedUrlCommand*)command
{
    NSData * data = [NSData dataFromBase64String:[command argumentAtIndex:0]];
    CDVPluginResult* pluginResult;
    
    if([data writeToFile:[command argumentAtIndex:1] atomically:YES])
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[command argumentAtIndex:0]];
    else
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error while writing the file"];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)openfile:(CDVInvokedUrlCommand*)command
{
    NSString * filepath =[command argumentAtIndex:0];
    NSURL *resourceToOpen = [NSURL fileURLWithPath:filepath];
    
    CDVViewController* cont = (CDVViewController*)[ super viewController ];
    CGRect rect = CGRectMake(0, 0, cont.view.bounds.size.width, cont.view.bounds.size.height);
    
    TTOpenInAppActivity *openInAppActivity = [[TTOpenInAppActivity alloc] initWithView:cont.view andRect:rect];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[resourceToOpen] applicationActivities:@[openInAppActivity]];
    CDVPluginResult* pluginResult;
    openInAppActivity.superViewController = activityViewController;
    [cont presentViewController:activityViewController animated:YES completion:NULL];
    
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)deletefile:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not implemented"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)createdirectory:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not implemented"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)deletedirectory:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not implemented"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)externaldirectory:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
