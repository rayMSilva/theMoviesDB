import 'package:flutter/widgets.dart';
import 'package:revisao/models/post_model.dart';
import 'package:revisao/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async{
    posts.value = await _homeRepository.getList();
  }
}