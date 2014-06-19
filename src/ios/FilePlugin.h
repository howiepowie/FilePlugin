var FilePlugin = {
createFile: function(data, filepath, successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'writefile',
                 [data, filepath]
                 );
},
openFile: function(filepath, content_type, successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'openfile',
                 [content_type, filepath]
                 );
},
deleteFile: function(filepath, successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'deletefile',
                 [filepath]
                 );
},
createDirectory: function(filepath, successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'createdirectory',
                 [filepath]
                 );
},
deleteDirectory: function(filepath, successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'deletedirectory',
                 [filepath]
                 );
},
externalDirectory: function(successCallback, errorCallback) {
    cordova.exec(
                 successCallback,
                 errorCallback,
                 'FilePlugin',
                 'externaldirectory',
                 []
                 );
}
}
module.exports = FilePlugin;
