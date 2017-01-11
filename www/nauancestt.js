var exec = require('cordova/exec');

exports.init = function(arg, success, error) 
{ 
    if(!arg)
    {
        return error(new Error('Empty credentials'));
    }

    if(!(arg['serverUrl'] && arg['appKey']))
    {
        return error(new Error('Empty credentials'));
    }

     exec(success, error, "nauancestt", "initialize", [arg]);
};

exports.speechToText = function(arg, success, error)
{
    exec(success, error, "nauancestt", "speechToText", [arg]);
};

exports.setListeningStatusCallback = function(success, error)
{
    exec(success, null, "nauancestt", "listeningStatusCallback", [null]);
};

exports.setVoiceLevelCallback = function(success, error)
{
    exec(success, null, "nauancestt", "voiceLevelCallback", [null]);
};

exports.stopListening = function(arg, callback)
{
    exec(null, null, "nauancestt", "stopListening", [arg]);
};