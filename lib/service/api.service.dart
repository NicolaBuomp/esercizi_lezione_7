import 'package:dio/dio.dart';
import 'package:esercizi_lezione_7/models/post.model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('/posts');
      List<dynamic> data = response.data;
      return data.map((post) => Post.fromJson(post)).toList();
    } catch (e) {
      throw Exception('Errore nel caricamento dei post: $e');
    }
  }
}
