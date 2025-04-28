import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
//import 'package:navigator/two_page.dart';
import 'package:navigator/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 3));
    } finally {
      client.close();
      inLoader.value = false;
    }
  }

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
                animation: Listenable.merge([posts, inLoader]),
                builder:
                    (_, __) =>
                        inLoader.value
                            ? CircularProgressIndicator()
                            : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: posts.value.length,
                              itemBuilder:
                                  (_, idx) => ListTile(
                                    title: Text(posts.value[idx].title),
                                  ),
                            ),
              ),
              SizedBox(height: 10),
              CustomButtonWidget(
                onPressed: () => callAPI(),
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

class Post {
  //"userId": 1,
  //  "id": 1,
  //  "title": "sunt aut facere repellat provident
  // occaecati excepturi optio reprehenderit",
  //  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  //}

  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  @override
  String toString() {
    return 'id: $id';
  }
}
