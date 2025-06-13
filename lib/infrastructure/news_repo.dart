import 'package:dio/dio.dart';
import 'package:uiwidgets/domain/news_model.dart';

class NewsRepo {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://newsapi.org/v2/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  final String _apiKey = '2867b9967cd44b5da9a549fb929d7147';

  Future<List<NewsModel>> fetchPosts() async {
    try {
      Response response = await _dio.get(
        'top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['articles'];
        return data.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Veri alınamadı. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }
}
