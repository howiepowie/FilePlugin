//
//  FilePlugin.m
//  FilePlugin
//
//  Created by howiepowie on 19/06/14.
//  Copyright (c) 2014 howiepowie. All rights reserved.
//

#import "FilePlugin.h"
//#import "NSData+Base64.h"

@implementation FilePlugin

- (void)writefile:(CDVInvokedUrlCommand*)command
{

    NSData * data = [NSData dataFromBase64String:[command argumentAtIndex:0]];
    CDVPluginResult* pluginResult;
    if([data writeToFile:[command argumentAtIndex:1] atomically:YES])
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    else
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error while writing the file"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)openfile:(CDVInvokedUrlCommand*)command
{
    NSURL *resourceToOpen = [NSURL fileURLWithPath:[command argumentAtIndex:0]];
    CDVPluginResult* pluginResult;
    if([[UIApplication sharedApplication] canOpenURL:resourceToOpen]) {
        [[UIApplication sharedApplication] openURL:resourceToOpen];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    else
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't open file"];
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
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



@end
