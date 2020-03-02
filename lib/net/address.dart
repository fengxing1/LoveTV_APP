import 'package:lovetv_app/config/config.dart';

class Address {
  static const String host = "http://app.beijingboli.com/";

  static getTVList(){
    return '${host}mahuadaquan/mahua.html';
  }

  static getTVDetail(String tvCode){
    return '${host}mahuadaquanxiangxi/${tvCode}.html';

  }

}