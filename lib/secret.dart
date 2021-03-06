import 'package:jwt_decode/jwt_decode.dart';

class Secret {
  static String _REV_AUTH = "http://34.64.245.232:8760/";
  static String _TY_IP = "http://111.171.6.164:8760/";
  static String _HACKERS = "http://192.168.0.201:8760/";

  static String get path => _REV_AUTH;

  static var jwt;

  static String _token = "";
  static String get token => _token;

  static String _nickname="";
  static get nickname =>_nickname;

  static void setToken(String token, String nickname) {
    _token = token;
    jwt = Jwt.parseJwt(_token);
    print(jwt);
    print(_token);
    _nickname=nickname;
  }

  static get getExp =>
      DateTime.fromMillisecondsSinceEpoch(0).add(Duration(seconds: jwt["exp"]));

  static get getSub => jwt['sub'];

  static get getIat =>
      DateTime.fromMillisecondsSinceEpoch(0).add(Duration(seconds: jwt["iat"]));

  static bool get getExpired => Jwt.isExpired(_token);

  static dynamic _profileInfo;
  static get profileInfo => _profileInfo;
  static initProfileInfo(data) {
    _profileInfo=data;
  }
  static dynamic _pointInfo;
  static get pointInfo => _pointInfo;
  static initPointInfo(data) {
    _pointInfo=data;
  }
}