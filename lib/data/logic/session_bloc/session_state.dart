part of 'session_bloc.dart';

class SessionState extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool _loggedIn = false;
  late String _token;
  SessionState(this.sharedPreferences) {
    loggedIn = sharedPreferences.getBool(loggedInKey) ?? false;
    debugPrint(_loggedIn.toString());
  }
  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    sharedPreferences.setBool(loggedInKey, value);
    notifyListeners();
  }

  String get token => _token;
  set token(String keyy) {
    debugPrint('key:: $keyy');
    _token = keyy;
    sharedPreferences.setString(token, keyy);
    notifyListeners();
  }

  void checkToken() {
    token = sharedPreferences.getString(AppConstant.TOKEN) ?? '';
    debugPrint('TOKEN:: $token');
  }

  void checkLoggedIn() {
    loggedIn = sharedPreferences.getBool(loggedInKey) ?? false;
  }

  void clearTOken() {
    sharedPreferences.clear();
  }
}
