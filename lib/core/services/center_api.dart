import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CenterApi {
  getDataDecode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }

  Future<dynamic> get({required String urlSpecific}) async {
    try {
      final response = await http.get(Uri.parse(urlSpecific));

      final dataDecode =
          response.body != "" ? getDataDecode(response.bodyBytes) : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return dataDecode;
      } else if (response.statusCode == 401) {
        return [];
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<dynamic> post(
      {required Map<String, dynamic> data, required String urlSpecific}) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.post(
        Uri.parse(urlSpecific),
        body: dataParse,
      );

      final dataDecode = getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return dataDecode;
      } else if (response.statusCode == 401) {
        return [];
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<dynamic> update({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = json.encode(data);
      final response = await http.patch(
        Uri.parse(urlSpecific),
        body: dataParse,
      );

      final dataDecode = getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return dataDecode;
      } else if (response.statusCode == 401) {
        return [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
