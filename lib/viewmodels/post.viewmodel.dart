import 'package:esercizi_lezione_7/models/post.model.dart';
import 'package:esercizi_lezione_7/service/api.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, AsyncValue<List<Post>>>(
  (ref) => PostViewModel(ref.watch(apiServiceProvider)),
);

class PostViewModel extends StateNotifier<AsyncValue<List<Post>>> {
  final ApiService _apiService;

  PostViewModel(this._apiService) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      state = const AsyncValue.loading();
      final posts = await _apiService.fetchPosts();
      state = AsyncValue.data(posts);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
