import 'dart:io';

import 'package:empco/Core/models/token_model/token_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const isRegistered = 'isRegistered';
const isLogin = 'isLogin';
const isFirstTime = 'isFirstTime';
const isLicenceUploaded = 'isLicenceUploaded';
const role = 'role';
const userRole = ['freelancer', 'owner', 'seeker'];
const freelancer = 'freelancer';
const owner = 'owner';
const seeker = 'seeker';

@singleton
class UserRepo {
  @factoryMethod
  factory UserRepo() {
    return _instance;
  }

  UserRepo._() : properties = <String, dynamic>{};

  @factoryMethod
  static final UserRepo _instance = UserRepo._();

  final flutterSecureStorage = const FlutterSecureStorage();

  Map<String, dynamic> properties;

  TokenModel? _user;

  TokenModel? get user => _user;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await _checkIfFirstRunForIOS();
    await getUser();
  }

  Future<void> _checkIfFirstRunForIOS() async {
    if (!Platform.isIOS) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
      prefs.setBool('first_run', false);
    }
  }

  Future<TokenModel?> getUser() async {
    try {
      final json = await flutterSecureStorage.read(key: _userKey);
      if (json != null) {
        _user = TokenModel.fromJsonStr(json);
      }
      return _user;
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrint(stackTrace.toString());
      throw Exception("Can't get the user");
    }
  }

  Future<bool> setUser(TokenModel user) async {
    try {
      await flutterSecureStorage.write(
        key: _userKey,
        value: user.toJsonStr(),
      );
      _user = user;
      return true;
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrint(stackTrace.toString());
      throw Exception("Can't set the user");
    }
  }

  Future<bool> deleteUser() async {
    try {
      await flutterSecureStorage.delete(key: _userKey);
      _user = null;
      return true;
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrint(stackTrace.toString());
      throw Exception("Can't delete the user");
    }
  }

  bool get isSignedIn {
    return _user != null;
  }

  void registerUserAuthListener(ValueChanged<String?> newListener) {
    flutterSecureStorage.registerListener(
      key: _userKey,
      listener: newListener,
    );
  }

  void unregisterUserAuthListener(ValueChanged<String?> listener) {
    flutterSecureStorage.unregisterListener(
      key: _userKey,
      listener: listener,
    );
  }

  Future<bool> setKey<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    if (value != null) {
      if (value is bool) {
        result = await prefs.setBool(key, value);
      } else if (value is double) {
        result = await prefs.setDouble(key, value);
      } else if (value is int) {
        result = await prefs.setInt(key, value);
      } else if (value is String) {
        result = await prefs.setString(key, value);
      } else if (value is List<String>) {
        result = await prefs.setStringList(key, value);
      } else {
        throw Exception(
          'The value type is not supported in SharedPreferences.',
        );
      }
    } else {
      throw Exception("Value can't be null.");
    }

    if (result) properties[key] = value;
    return result;
  }

  Future<T> getKey<T>(String key, {T? defaultValue}) async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(key) && defaultValue == null) {
      throw Exception(
        "The $key key isn't found in SharedPreferences, so default value can't be null.",
      );
    } else if (!prefs.containsKey(key)) {
      final result = await setKey<T>(key, defaultValue as T);
      if (!result) throw Exception("Default value can't be set.");
      return defaultValue;
    } else {
      if (defaultValue is bool) {
        properties[key] = prefs.getBool(key);
      } else if (defaultValue is double) {
        properties[key] = prefs.getDouble(key);
      } else if (defaultValue is int) {
        properties[key] = prefs.getInt(key);
      } else if (defaultValue is String) {
        properties[key] = prefs.getString(key);
      } else if (defaultValue is List<String>) {
        properties[key] = prefs.getStringList(key);
      } else {
        properties[key] = prefs.get(key);
      }
      return properties[key] as T;
    }
  }

  Future<bool> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

const String _userKey = 'USER_KEY';
const String firstTimeKey = 'FIRST_TIME_KEY';
