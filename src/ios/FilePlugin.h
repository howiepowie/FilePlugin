#import <Cordova/CDV.h>

@interface FilePlugin : CDVPlugin

- (void)writefile:(CDVInvokedUrlCommand*)command;

- (void)openfile:(CDVInvokedUrlCommand*)command;

- (void)deletefile:(CDVInvokedUrlCommand*)command;

- (void)createdirectory:(CDVInvokedUrlCommand*)command;

- (void)deletedirectory:(CDVInvokedUrlCommand*)command;

- (void)externaldirectory:(CDVInvokedUrlCommand*)command;

@end