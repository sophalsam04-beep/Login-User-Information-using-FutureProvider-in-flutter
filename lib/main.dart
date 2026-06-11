import 'package:self_learning3/model/user_service.dart';
import 'package:self_learning3/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    FutureProvider<UserModel?>(
      create: (_) => UserService().getuser(),
      initialData: null,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login User Informations", style: TextStyle(fontSize: 25)),
      ),

      body: Center(
        child: user == null
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Text("${user.id}"),
                  Text("${user.name}"),
                  Text("${user.email}"),
                ],
              ),
      ),
    );
  }
}
