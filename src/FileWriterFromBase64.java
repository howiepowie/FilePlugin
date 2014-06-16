package com.howiepowie.cordova.filePlugin;

import java.io.File;
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
	
	//File operation
	private final static String WRITE_FILE = "writefile"; 
	private final static String OPEN_FILE = "openfile"; 
	private final static String DELETE_FILE = "deletefile"; 

	//Directory operation
	private final static String CREATE_DIRECTORY = "createdirectory"; 
	private final static String DELETE_DIRECTORY = "deletedirectory";
	
	//Other operation
	private final static String GET_EXTERNAL_DIRECTORY = "externaldirectory";
	
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackcontext) throws JSONException {
		JSONObject arg = args.getJSONObject(0);
		
		switch (action) {
		case WRITE_FILE:
			return writefile(arg.getString("data"), arg.getString("filepath"), callbackcontext);
		case OPEN_FILE:
			return openfile(arg.getString("filepath"),arg.getString("content_type") , callbackcontext);
		case DELETE_FILE:
			return deletefile(arg.getString("filepath"), callbackcontext);
		case CREATE_DIRECTORY:
			return createdirectory(arg.getString("filepath"), callbackcontext);
		case DELETE_DIRECTORY:
			return deletedirectory(arg.getString("filepath"), arg.getBoolean("recursif"), callbackcontext);
		case GET_EXTERNAL_DIRECTORY:
			return getExternalPath(callbackcontext);
		default:
			callbackcontext.error("Unknown action");
			return false;
		}
	}
	

	private boolean deleteRec(File f) {
		if(f.isDirectory())
		{
			for(File fic: f.listFiles()){
				deleteRec(fic);
			}
			return f.delete();
		}
		else
		{
			return f.delete();
		}
	}
	
	private boolean deletedirectory(String filepath,boolean recursif,
			CallbackContext callbackcontext) {
		File filePath = new File(filepath);
		if(recursif)
		{
			if(deleteRec(filePath)){
				callbackcontext.success();
				return true;
			}
			else {
				callbackcontext.error("Error while deleting :" + filePath.getName());
				return false;
			}
		}
		else
		{
			if(filePath.delete()){
				callbackcontext.success();
				return true;
			}
			else {
				callbackcontext.error("Error while deleting :" + filePath.getName());
				return false;
			}
		}
	}


	private boolean createdirectory(String filepath,
			CallbackContext callbackcontext) {
		File filePath = new File(filepath);
		if(filePath.mkdir()){
			callbackcontext.success(filePath.getAbsolutePath());
			return true;
		}
		else{
			callbackcontext.error("Error while creation directory");
			return false;
		}
	}


	private boolean deletefile(String filepath, CallbackContext callbackcontext) {
		try{
			File filePath = new File(filepath);
			if(filePath.delete()){
				callbackcontext.success();
				return true;							
			}
			else {
				callbackcontext.error("File not deleting");
				return false;
			}
		}
		catch (Exception e){
			callbackcontext.error("Error while deleting file");
			return false;
		}
	}


	private boolean writefile(String b64data, String filepath, CallbackContext callbackcontext) {
		byte[] data = Base64.decode(b64data, Base64.DEFAULT);
		
		File filePath = new File(filepath);
		FileOutputStream os;
		try {
			os = new FileOutputStream(filePath);
			os.write(data);
			os.flush();
			os.close();
			
			callbackcontext.success(filePath.getAbsolutePath());
			return true;
		} catch (Exception e) {
			callbackcontext.error("Error while writing file");
			return false;
		}
		
	}
	
	private boolean openfile(String filepath, String content_type, CallbackContext callbackContext) {
		try{
			Intent intent = new Intent(Intent.ACTION_VIEW);
			File filePath = new File(filepath);
			intent.setDataAndType(Uri.fromFile(filePath), content_type);
			this.cordova.getActivity().startActivity(intent);
			callbackContext.success();
			return true;			
		}
		catch (Exception e){
			callbackContext.error("Error while opening file");
			return false;
		}
	}
	
	private boolean getExternalPath(CallbackContext callbackContext) {
		callbackContext.success(Environment.getExternalStorageDirectory().getAbsolutePath());
		return true;
	}
	
}
