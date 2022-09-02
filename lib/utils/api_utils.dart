class ApiUtils {
  static Uri buildUri({String? path, Map<String, dynamic>? queryParameters}) {
    queryParameters =
        queryParameters?.map((key, value) => MapEntry(key, value.toString()));

    return Uri(
        scheme: "https",
        host: "api.news-feed.ml",
        path: path,
        queryParameters: queryParameters);
  }
}
