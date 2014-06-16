var FileWriterFromBase64 = {
    createFile: function(data, filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'writefile',
 			[{
 				"data" : data,
 				"filepath" : filepath
 			}]
 		);
    }
    openFile: function(filepath, content_type, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'openfile',
 			[{
				"content_type" : content_type,
 				"filepath" : filepath
 			}]
 		);
    }
    deleteFile: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'deletefile',
 			[{
 				"filepath" : filepath
 			}]
 		);
    }
    createDirectory: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'createdirectory',
 			[{
 				"filepath" : filepath
 			}]
 		);
    }
    deleteDirectory: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'deletedirectory',
 			[{
 				"filepath" : filepath
 			}]
 		);
    }
    deleteFile: function(successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'externaldirectory',
 			[{}]
 		);
    }
}
module.exports = FileWriterFromBase64;