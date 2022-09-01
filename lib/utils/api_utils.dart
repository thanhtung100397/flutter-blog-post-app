class ApiUtils {
  static Uri buildUri({String? path}) {
    return Uri(scheme: "https", host: "api.news-feed.ml", path: path);
  }
}
