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
    NSString * filepath =[command argumentAtIndex:0];
    NSString * content_type =[command argumentAtIndex:1];
    NSURL *resourceToOpen = [NSURL fileURLWithPath:filepath];
    
    UIDocumentInteractionController *controller = [UIDocumentInteractionController  interactionControllerWithURL:resourceToOpen];
    controller.delegate = self;
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, CFBridgingRetain(content_type), NULL);
    NSString *UTIString = (__bridge_transfer NSString *)UTI;    CDVViewController* cont = (CDVViewController*)[ super viewController ];
    controller.UTI = UTIString;
    CGRect rect = CGRectMake(0, 0, cont.view.bounds.size.width, cont.view.bounds.size.height);
    [controller presentOpenInMenuFromRect:rect inView:cont.view animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
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

- (void) documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    //NSLog(@"documentInteractionControllerDidDismissOpenInMenu");
    
}

- (void) documentInteractionController: (UIDocumentInteractionController *) controller didEndSendingToApplication: (NSString *) application {
    //NSLog(@"didEndSendingToApplication: %@", application);
    
}

@end
