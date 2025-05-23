 import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


 class MyPrefs {

   SharedPreferences? prefs;

  Future<void> setUp() async{
     prefs = await SharedPreferences.getInstance();
   }

   Future<bool> tryBool(Future<bool> future) async{
    try {
      return future;
    } catch (error) {
      debugPrint(error.toString());
      return Future(() => false);
    }
  }

  Future<bool> remove(String key) async {
     final SharedPreferences prefs = this.prefs ??= await SharedPreferences.getInstance();
   return tryBool(prefs.remove(key));
  }

  /// Cẩn trọng khi sử dụng clear, nó xóa toàn bộ prefs hiện có
  Future<bool> clear() async{
    final SharedPreferences prefs = this.prefs ??= await SharedPreferences.getInstance();
    return tryBool(prefs.clear());
  }

  Future<bool> write(String key, dynamic value) async {
     final SharedPreferences prefs = this.prefs ??= await SharedPreferences.getInstance();
     if(value.runtimeType == String) {
      return tryBool(prefs.setString(key, value as String));
    } else if(value.runtimeType == int){
      return tryBool(prefs.setInt(key, value as int));
    } else if(value.runtimeType == bool){
      return tryBool(prefs.setBool(key, value as bool));
    } else if(value.runtimeType == double){
      return tryBool(prefs.setDouble(key, value as double));
    } else if(value.runtimeType == List<String>){
      return tryBool(prefs.setStringList(key, value as List<String>));
    } else if(value.runtimeType.toString() == "_Map<String, dynamic>"){
      return tryBool(prefs.setString(key, convert.jsonEncode(value as Map<String, dynamic>)));
    } else if(value.runtimeType == DateTime){
      return tryBool(prefs.setString(key, value.toString()));
    } else {
      return Future(() => false);
    }
  }

  Future<T?> readSave<T>(String key) async {
    final SharedPreferences prefs = this.prefs ??= await SharedPreferences.getInstance();
    try {
       if(T == String) {
         return prefs.getString(key) as T;
       } else if(T == int){
         return prefs.getInt(key) as T;
       } else if(T == bool){
         return prefs.getBool(key) as T;
       } else if(T == double){
         return prefs.getDouble(key) as T;
       } else if(T == List<String>){
         return prefs.getStringList(key) as T;
       } else if(T == Map<String, dynamic>){
         return prefs.getString(key) == null ? null  : convert.jsonDecode(prefs.getString(key)!) as T;
       } else if(T == DateTime){
         return prefs.getString(key) == null ? null  : DateTime.parse(prefs.getString(key)!) as T;
       } else {
         return null;
       }
     } catch (error) {
      debugPrint("readSave<T>: $error");
       return null;
     }
   }

   /// Đảm bảo rằng đã chạy setUp()
   Future<T?> read<T>(String key) async {
     try {
       final SharedPreferences prefs = this.prefs!;
       if(T == String) {
         return prefs.getString(key) as T;
       } else if(T == int){
         return prefs.getInt(key) as T;
       } else if(T == bool){
         return prefs.getBool(key) as T;
       } else if(T == double){
         return prefs.getDouble(key) as T;
       } else if(T == List<String>){
         return prefs.getStringList(key) as T;
       } else if(T == Map<String, dynamic>){
         return prefs.getString(key) == null ? null  : convert.jsonDecode(prefs.getString(key)!) as T;
       } else if(T == DateTime){
         return prefs.getString(key) == null ? null  : DateTime.parse(prefs.getString(key)!) as T;
       } else {
         return null;
       }
     } catch (error) {
       debugPrint("read<T>: $error");
       return null;
     }
   }

 }
