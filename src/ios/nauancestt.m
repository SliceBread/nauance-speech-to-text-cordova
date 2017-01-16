// 


#import "nauancestt.h"


@implementation nauancestt

- (void)initialize : (CDVInvokedUrlCommand*)command
{
    NSDictionary* arguments = [command.arguments objectAtIndex:0]; 
    //Server Credentials
    NSString *SKServerUrl = arguments[@"serverUrl"]; 
    NSString *SKSAppKey = arguments[@"appKey"]; 
    self.api = [[SKSession alloc] initWithURL:[NSURL URLWithString:SKServerUrl] appToken:SKSAppKey];
}

- (void)stopListening : (CDVInvokedUrlCommand*)command
{
    if(self.transaction)
    {
        [self.transaction stopRecording];
    }
}

- (void)speechToText : (CDVInvokedUrlCommand*)command
{
    if(self.requestInProgress && self.transaction)
    { 
        return;
    }
    self.transaction = [_api recognizeWithType:SKTransactionSpeechTypeDictation detection:SKTransactionEndOfSpeechDetectionNone language:@"eng-USA" delegate:(id)self];
    self.finalTranscriptionCallback = command;
}

- (void)transactionDidBeginRecording : (SKTransaction *)transaction
{
    [self listening_started];
    self.requestInProgress = YES;
}

- (void)transactionDidFinishRecording : (SKTransaction *)transaction
{ 
    self.resultInProgress = YES;
    [self listening_stopped];
}

- (void)transaction : (SKTransaction *)transaction didReceiveRecognition:(SKRecognition *)recognition
{
    NSString* topRecognitionText = [recognition text];
    self.resultInProgress = NO;
    self.requestInProgress = NO;
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:topRecognitionText];
    pluginResult.keepCallback = @(YES);
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.finalTranscriptionCallback.callbackId];
}

- (void)transaction : (SKTransaction *)transaction didFinishWithSuggestion:(NSString *)suggestion
{
    self.resultInProgress = NO;
    self.requestInProgress = NO;
}

- (void)transaction : (SKTransaction *)transaction didFailWithError:(NSError *)error suggestion:(NSString *)suggestion 
{
    self.resultInProgress = NO;
    self.requestInProgress = NO;
}

/** 
 * Save the cordova callback in a property
 * {status : listening_started, value : ""}
 * {status : listening_stopped, value : ""}
 */

- (void)listeningStatusCallback : (CDVInvokedUrlCommand*)command
{
    self.listeningStatusCallback = command;
};

/**
 
 */
- (void)voiceLevelCallback : (CDVInvokedUrlCommand*)command
{
    self.voiceLevelCallback = command;
};

/**
 Trigger cordova callback methods
 */
-(void)listening_started
{
    if(self.listeningStatusCallback)
    {
        NSDictionary *message = @{@"status":@"listening_started",@"value": @""};
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:message];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.listeningStatusCallback.callbackId];
    }
}

- (void)listening_stopped
{
    if(self.listeningStatusCallback)
    {
        NSDictionary *message = @{@"status":@"listening_stopped",@"value": @""};
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:message];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.listeningStatusCallback.callbackId];
    }
}

- (void)voice_level : (float)power
{
    if(self.voiceLevelCallback)
    {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:power];
        result.keepCallback = @(YES);
        [self.commandDelegate sendPluginResult:result
                                    callbackId:self.voiceLevelCallback.callbackId];
    }
}

@end
