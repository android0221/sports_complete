import '../../../services/server_api.dart';
import '../entities/entities.dart';

class NewsRepository {
  final ServerApi serverApi;

  NewsRepository({required this.serverApi});

  Future<List<News>> fetch({required DateTime date}) async {
    final dtos = await serverApi.fetchNews(date: date);
    return dtos.map((e) => e.toEntity()).toList();
  }
}
