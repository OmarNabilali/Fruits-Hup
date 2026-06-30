import 'dart:convert';

import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/utils/constant.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';

UserEntitis getUser() {
  var user = Prefs.getString(ksaveUserData);
  var userEntity = UserModel.fromJson(jsonDecode(user));

  return userEntity;
}
