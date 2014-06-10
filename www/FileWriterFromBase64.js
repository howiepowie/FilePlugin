var FileWriterFromBase64 = {
    createEvent: function(data, content_type, filename, successCallback, errorCallback) {
 		cordova.exec(
 			successCallback,
 			errorCallback,
 			'FileWriterFromBase64',
 			'fileWrite',
 			[{
 				"data" : data,
 				"content_type" : content_type,
 				"filename" : filename
 			}]
 		);
    }
}
module.exports = FileWriterFromBase64;