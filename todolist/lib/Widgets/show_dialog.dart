import 'package:flutter/material.dart';

class Acao {
  final Function() acao;
  final String actionText;

  Acao({required this.acao, required this.actionText});
}

class MyDialog extends StatelessWidget {
  final String title;
  final List<Acao>? actions;
  final dynamic dialogContent;

  const MyDialog({
    super.key,
    required this.title,
    this.actions,
    required this.dialogContent,
  });

  static Future<void> show({
    required String title,
    required List<Acao> actions,
    required dynamic dialogContent,
    required dynamic context,
    required bool dissmissable,
  }) async 
  
  
  {
    showDialog(
      context: context,
      barrierDismissible: dissmissable,
      builder: (BuildContext content) {
        return MyDialog(
          title: title,
          dialogContent: dialogContent,
          actions: actions,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: dialogContent,
      actions: actions?.map((acao) => _buildAcao(acao)).toList(),
    );
  }

  Widget _buildAcao(Acao acao) {
    return TextButton(onPressed: acao.acao, child: Text(acao.actionText));
  }
}
