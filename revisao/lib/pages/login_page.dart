import 'package:flutter/material.dart';
import 'package:revisao/components/login/custom_login_buttom_component.dart';
import 'package:revisao/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.3),
            TextField(
              decoration: InputDecoration(label: Text('Login')),
              onChanged: _controller.setlogin,
            ),
            TextField(
              decoration: InputDecoration(label: Text('Senha')),
              onChanged: _controller.setSenha,
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomLoginButtonComponent(),
          ],
        ),
      ),
    );
  }
}
