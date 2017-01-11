

#cordova-plugin-watsonstt

This plugin is a wrapper of a [Naunce SpeechKit 2.x](https://developer.nuance.com/public/Help/DragonMobileSDKReference_iOS_1.4.21/SpeechKit_Guide/Introduction.html)

----------

* [Installation](#installation) 
* [Usage](#Usage)
* [API](#api) 
* [Supported Languages](#supported-languages) 

#Installation

```shell
cordova plugin add https://github.com/SliceBread/nauance-speech-to-text-cordova
```

#Credentails
You can get a sandbox credentails from https://developer.nuance.com/

#Usage
Add the below code to your index.js file inside onDeviceReady function to initialise 
```javascript
 NauanceSTT.init({
         serverUrl : '', //Insert your serverurl
         appKey : '' //Insert your appkey
       });
``` 

Start audio transcription
```
 NauanceSTT.speechToText(null, function(result){
      //result = transcription text
 }, function(error){
 
 }); 
 ```

#Api
```
NauanceSTT.init 
```
Init method example :

```javascript
/**
 * Init method
 * @param (Object) {serverUrl : '', appKey : ''}
 * @param (Function) Success Callback
 * @param (Function) Error Callback
 */
 NauanceSTT.init({serverUrl : '', appKey: ''}, success, error);
```
----------
```
NauanceSTT.speechToText
```
SpeechToText method example : 

```javascript
/**
 * SpeechToText method
 * @param {Object} - Reserved for the future development 	
 * @param (Function)- callback for success `function (context) {}` 
 * @param (Function)- callback for error `function (error) {}` 
 */
 NauanceSTT.speechToText({}, function(context){
	 //context
 }, error);
```
----------
```
NauanceSTT.setListeningStatusCallback
```
SetListeningStatusCallback method example :

```javascript
/**
 * SetListeningStatusCallback method
 * events : listening_started, listening_ended
 * @param (Function)- callback on success`
 */
 NauanceSTT.setListeningStatusCallback(function(param){

 //{status : 'listening_started', value : '',
 //status : 'listening_stopped', value : '',} 

 });
```
----------

```
NauanceSTT.setVoiceLevelCallback
```
```javascript
/**
 * setVoiceLevelCallback method 
 * @param (Function)- callback to get voice level`
 */
 NauanceSTT.setVoiceLevelCallback(function(voiceLevel){

 });
```
**Please note**, that callbacks must be called before NauanceSTT.speechToText call.
#Supported Platforms

- iOS 

   