import 'package:flutter/material.dart';
import 'package:revisao/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  CustomLoginButtonComponent({super.key, required this.controller});
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.inLoader,
      builder:
          (_, inLoader, __) =>
              inLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      controller.auth().then((result) {
                        if (result) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Falha ao realizar Login!'),
                              duration: const Duration(seconds: 5),
                            ),
                          );
                        }
                      });
                    },
                    child: Text('Login'),
                  ),
    );
  }
}
