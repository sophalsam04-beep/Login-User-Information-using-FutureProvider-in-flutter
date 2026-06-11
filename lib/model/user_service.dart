import 'dart:convert';

import 'package:self_learning3/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserService{
    Future<UserModel> getuser() async{
        final respone = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));

        if(respone.statusCode == 200){
              return UserModel.fromJson(
                jsonDecode(respone.body),
              );
        }else{
            throw Exception("Load the error...!");
        }




    }
}