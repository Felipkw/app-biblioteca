import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<SharedPreferences> get _getIntance => SharedPreferences.getInstance();

  setUser(bool status) async {
    SharedPreferences instance = await _getIntance;
    instance.setBool("USUARIOS", status);
  }

  getUser() async {

    SharedPreferences instance = await _getIntance;

    bool userStatus = instance.getBool("USUARIOS") ?? false;
    return userStatus;
  }
}