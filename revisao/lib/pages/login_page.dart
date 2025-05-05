import 'package:flutter/material.dart';
import 'package:revisao/components/login/custom_login_buttom_component.dart';
import 'package:revisao/controllers/login_controller.dart';
import 'package:revisao/widgets/custom_text_field_widget.dart';

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
            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              labelDecoration: 'Login',
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setSenha,
              labelDecoration: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomLoginButtonComponent(controller: _controller,),
          ],
        ),
      ),
    );
  }
}
