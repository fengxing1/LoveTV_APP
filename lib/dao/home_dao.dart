import 'dart:convert';
import 'dart:io';
import 'package:lovetv_app/net/api.dart';
import 'package:lovetv_app/net/address.dart';
import 'package:lovetv_app/dao/dao_result.dart';
import 'dart:convert';

class HomeDao {
  static getTVList() async {
    String url = Address.getTVList();
    var res = await httpManager.netFecth(url, null, {"Accept": 'text/html; charset=utf-8'}, null);
    if(res != null) {
      return new DataResult(json.decode(res), true);
    } else {
      return new DataResult(json.decode(res), false);
    }
  }

  static getTVDetail(String tvCode) async{
    String url = Address.getTVDetail(tvCode);
    var res = await httpManager.netFecth(url, null, {"Accept": 'text/html; charset=utf-8'}, null);
    if(res != null) {
      return new DataResult(json.decode(res), true);
    } else {
      return new DataResult(json.decode(res), false);
    }

  }


}