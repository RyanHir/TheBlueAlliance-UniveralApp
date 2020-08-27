import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as decode;
import 'package:tba/constants.dart';

const _baseURL = "https://www.thebluealliance.com/api/v3";
const _baseHeader = {
  "X-TBA-Auth-Key": "$kAPIKey",
  "Connection": "keep-alive",
  "Accept": "application/json"
};

Future<Map<String, dynamic>> fetch(
    String endpoint, Map<String, String> extra) async {
  var header = _baseHeader;
  var url = "$_baseURL/$endpoint";
  extra.forEach((k, v) => header[k] = v);
  print(url);
  http.Response response = await http.get(url, headers: header);
  if (response.statusCode != 200) {
    throw UnimplementedError();
  }
  return decode.jsonDecode(response.body);
}
