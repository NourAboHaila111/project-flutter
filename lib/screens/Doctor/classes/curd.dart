import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:http/http.dart" as http;

import '../Cubit/functions/statuesRequest.dart';



class Curd  {
  // ignore: non_constant_identifier_names
  Future<Either<StatuesRequest, List<Map<String, dynamic>>>> postdata(
      String linkURL, Map<String, dynamic> data) async {
    try {
      if (true) {
        var response = await http.post(Uri.parse(linkURL), body: data);
        print(response.statusCode.toString());
        if (response.statusCode < 300) {
          dynamic responsebody = jsonDecode(response.body);
          List<Map<String, dynamic>> body = [];
          responsebody.forEach((element) {
            body.add(element);
          });
          //print(body.first['id']);
          return Right(body);
        } else {
          return const Left(StatuesRequest.serverfailure);
        }
        // ignore: empty_statements
      } else {
        return const Left(StatuesRequest.offlinefailuaer);
      }
    } catch (error) {
      print(error.toString());
      return const Left(StatuesRequest.serverfailure);
    }
  }

  Future<Either<StatuesRequest, List<Map<String, dynamic>>>> getdata(
      String linkURL, Map data) async {
    try {
      if (true) {
        var response = await http.get(Uri.parse(linkURL));
        if (response.statusCode < 300) {
          List<dynamic> responsebody = jsonDecode(response.body);
          List<Map<String, dynamic>> body = [];
          responsebody.forEach((element) {
            body.add(element);
          });
          //print(body.first['id']);
          return Right(body);
        } else {
          return const Left(StatuesRequest.serverfailure);
        }
        // ignore: empty_statements
      } else {
        return const Left(StatuesRequest.offlinefailuaer);
      }
    } catch (error) {
      print(error.toString());
      return const Left(StatuesRequest.serverfailure);
    }
  }

  Future<Either<StatuesRequest, Map>> deletdata(
      String linkURL, Map data) async {
    try {
      if (true) {
        var response = await http.delete(Uri.parse(linkURL), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatuesRequest.serverfailure);
        }
        // ignore: empty_statements
      } else {
        return const Left(StatuesRequest.offlinefailuaer);
      }
    } catch (_) {
      return const Left(StatuesRequest.serverfailure);
    }
  }

  Future<Either<StatuesRequest, Map>> postlogin(
      String linkURL, Map data) async {
    try {
      if (true) {
        var response = await http.post(Uri.parse(linkURL), body: data);
        print(response.statusCode.toString());
        if (response.statusCode < 300) {
          Map responsebody = jsonDecode(response.body);

          //print(body.first['id']);
          return Right(responsebody);
        } else {
          return const Left(StatuesRequest.serverfailure);
        }
        // ignore: empty_statements
      } else {
        return const Left(StatuesRequest.offlinefailuaer);
      }
    } catch (error) {
      print(error.toString());
      return const Left(StatuesRequest.serverfailure);
    }
  }

  Future<Either<StatuesRequest, Map>> getlogin(String linkURL, Map data) async {
    try {
      if (true) {
        var response = await http.get(Uri.parse(linkURL));

        print(response.statusCode.toString());
        if (response.statusCode < 300) {
          Map responsebody = jsonDecode(response.body);
          print(
              'ttttttttttttt..........................................rrrrrrrrrrrrrrrrrrrrrrrrrrrr');
          //print(body.first['id']);
          return Right(responsebody);
        } else {
          return const Left(StatuesRequest.serverfailure);
        }
        // ignore: empty_statements
      } else {
        return const Left(StatuesRequest.offlinefailuaer);
      }
    } catch (error) {
      print(error.toString());
      return const Left(StatuesRequest.serverfailure);
    }
  }
}
