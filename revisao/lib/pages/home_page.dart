import 'package:flutter/material.dart';
import 'package:revisao/controllers/home_controller.dart';
import 'package:revisao/models/post_model.dart';
import 'package:revisao/repositories/home_repository_mock.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _controller = HomeController(HomeRepositoryMock());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(title: Text(list[idx].title)),

          );
        },
      ),
    );
  }
}
