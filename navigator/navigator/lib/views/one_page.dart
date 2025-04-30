import 'package:flutter/material.dart';
import 'package:navigator/controllers/posts_controller.dart';
//import 'package:navigator/two_page.dart';
import 'package:navigator/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge([_controller.posts, _controller.inLoader]),
                builder:
                    (_, __) =>
                         _controller.inLoader.value
                            ? CircularProgressIndicator()
                            : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:  _controller.posts.value.length,
                              itemBuilder:
                                  (_, idx) => ListTile(
                                    title: Text( _controller.posts.value[idx].title),
                                  ),
                            ),
              ),
              SizedBox(height: 10),
              CustomButtonWidget(
                onPressed: () =>  _controller.callAPI(),
                //{
                //  Navigator.of(context)
                //      .pushNamed('/twoPage', arguments: 'Teste')
                //      .then((value) => print(value));
                //}
                //title:'Ir paga a Segunda Page',
                title: 'Custom BTN',
                disabled: false,
                titleSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
