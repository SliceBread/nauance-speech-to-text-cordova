 
#import <Cordova/CDV.h>
#import <SpeechKit/SpeechKit.h>

 
@interface nauancestt : CDVPlugin  

@property BOOL requestInProgress;
@property BOOL resultInProgress; 

@property(nonatomic, strong) CDVInvokedUrlCommand *finalTranscriptionCallback;
@property(nonatomic, strong) CDVInvokedUrlCommand *listeningStatusCallback;
@property(nonatomic, strong) CDVInvokedUrlCommand *voiceLevelCallback;
@property(nonatomic, strong) SKSession *api;
@property(nonatomic, strong) SKTransaction* transaction;

- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)speechToText:(CDVInvokedUrlCommand*)command;
- (void)listeningStatusCallback:(CDVInvokedUrlCommand*)command;
- (void)voiceLevelCallback:(CDVInvokedUrlCommand*)command; 
- (void)listening_started;
- (void)listening_stopped;
- (void)voice_level : (float)power;
- (void)stopListening:(CDVInvokedUrlCommand*)command;

@end

