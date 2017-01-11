 
#import <Cordova/CDV.h>
#import <SpeechKit/SpeechKit.h>

 
@interface nauancestt : CDVPlugin  

- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)speechToText:(CDVInvokedUrlCommand*)command;
- (void)listeningStatusCallback:(CDVInvokedUrlCommand*)command;
- (void)voiceLevelCallback:(CDVInvokedUrlCommand*)command; 
- (void)listening_started;
- (void)listening_stopped;
- (void)voice_level : (float)power;
- (void)stopListening;

@end

