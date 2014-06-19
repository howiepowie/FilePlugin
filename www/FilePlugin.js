var FilePlugin = {
    createFile: function(data, filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'writefile',
 			[{
 				"data" : data,
 				"filepath" : filepath
 			}]
 		);
    },
    openFile: function(filepath, content_type, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'openfile',
 			[{
				"content_type" : content_type,
 				"filepath" : filepath
 			}]
 		);
    },
    deleteFile: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'deletefile',
 			[{
 				"filepath" : filepath
 			}]
 		);
    },
    createDirectory: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'createdirectory',
 			[{
 				"filepath" : filepath
 			}]
 		);
    },
    deleteDirectory: function(filepath, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'deletedirectory',
 			[{
 				"filepath" : filepath
 			}]
 		);
    },
    externalDirectory: function(successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FilePlugin',
 			'externaldirectory',
 			[{}]
 		);
    }
}
module.exports = FilePlugin;