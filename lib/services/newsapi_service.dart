import 'package:categoryapp/model/newsapi_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get_storage/get_storage.dart';

var box = GetStorage();

class NewsApiServices {
  static const String url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=b7f8a45263a047baa07a4aebda2dd6d2";
  static geturl() async {
    try {
      Dio dio = Dio();
      dio.interceptors.add(DioCacheManager(
        CacheConfig(baseUrl: "https://newsapi.org/v2/"),
      ).interceptor);
      final response = await dio.get(url,
          options: buildCacheOptions(const Duration(days: 1)));
      if (response.statusCode == 200) {
        final news = NewsApi.fromJson(response.data);
        box.write("localStorage", news);

        return news;
      } else {
        return <NewsApi>[];
      }
    } catch (e) {
      return <NewsApi>[];
    }
  }
}
