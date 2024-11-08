import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:post_flow/domain/entities/post.dart'; 

class SavedPostsController extends GetxController {
  var savedPosts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedPosts(); 
  }

  Future<void> savePost(Post post) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPostsList = prefs.getStringList('saved_posts') ?? [];

    if (!savedPostsList.any((postJson) => json.decode(postJson)['id'] == post.id)) {
      savedPostsList.add(json.encode(post.toJson())); 
      await prefs.setStringList('saved_posts', savedPostsList);
      savedPosts.add(post);
    }
  }

  Future<void> removeSavedPost(Post post) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPostsList = prefs.getStringList('saved_posts') ?? [];

    savedPostsList.removeWhere((postJson) => json.decode(postJson)['id'] == post.id);
    await prefs.setStringList('saved_posts', savedPostsList);
    savedPosts.remove(post); 
  }

  Future<void> _loadSavedPosts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPostsList = prefs.getStringList('saved_posts') ?? [];

    savedPosts.value = savedPostsList
        .map((postJson) => Post.fromJson(json.decode(postJson)))
        .toList();
  }
}
