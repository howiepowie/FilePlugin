package com.howiepowie.cordova.filePlugin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.util.Base64;

public class FileWriterFromBase64 extends CordovaPlugin {
	public static final String ACTION_WRITE_FILE="fileWrite";
	
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackcontext) throws JSONException {
		if(ACTION_WRITE_FILE.equals(action))
		{
			JSONObject arg = args.getJSONObject(0);
			byte[] data = Base64.decode(arg.getString("data"), 0);
			
			File filePath = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + '/' + arg.getString("filename"));
			FileOutputStream os;
			try {
				os = new FileOutputStream(filePath);
				os.write(data);
				os.flush();
				os.close();
				
				Intent intent = new Intent(Intent.ACTION_VIEW);
				intent.setDataAndType(Uri.fromFile(filePath), arg.getString("content_type"));
				this.cordova.getActivity().startActivity(intent);
				
				callbackcontext.success();
				return true;
			} catch (Exception e) {
				callbackcontext.error("Error while writing file");
				return false;
			}
		}
		callbackcontext.error("Invalid action");
		return false;
	}
}
