import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/utils/api_utils.dart';
import 'package:http/http.dart' as http;

class Notification {
  String? _id;
  String? content;
  DateTime? createdDate;
  String? imageUrl;
  bool? markAsRead;

  Notification.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdDate = DateTime.parse(json['createdDate']).toLocal();
    imageUrl = json['imageUrl'];
    markAsRead = json['markAsRead'];
    _id = json['_id'];
  }
}

class AppNotificationPage extends StatefulWidget {
  const AppNotificationPage({Key? key}) : super(key: key);

  @override
  State<AppNotificationPage> createState() => _AppNotificationPageState();
}

class _AppNotificationPageState extends State<AppNotificationPage> {
  late Future<List<Notification>> futureNotifications;

  static const pageSize = 50;

  final PagingController<int, Notification> pagingController =
      PagingController(firstPageKey: 1);

  Future<List<Notification>> listNotifications(int pageNum) async {
    final response = await http.get(
        ApiUtils.buildUri(
            path: "/notifications/",
            queryParameters: {"pageNum": pageNum, "pageSize": pageSize}),
        headers: {
          'authorization': await FirebaseAuth.instance.currentUser!.getIdToken()
        });

    if (response.statusCode == 200) {
      var bodyJson = json.decode(utf8.decode(response.bodyBytes));
      List<Notification> userSettings =
          (bodyJson as List).map((e) => Notification.fromJson(e)).toList();
      return userSettings;
    }
    throw Exception(
        "Error when calling API to list notifications ${response.statusCode} ${response.body}");
  }

  Future<void> fetchPage(int pageNum) async {
    try {
      final newItems = await listNotifications(pageNum);
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageNum + 1);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future markAsRead(String notificationId) async {
    final response = await http.put(
        ApiUtils.buildUri(path: "/notifications/$notificationId/mark-as-read"),
        headers: {
          'authorization': await FirebaseAuth.instance.currentUser!.getIdToken()
        });
    if (response.statusCode == 200) {
      return;
    }
    throw Exception(
        "Error when calling API to mark as read ${response.statusCode} ${response.body}");
  }

  @override
  void initState() {
    pagingController.addPageRequestListener((pageNum) {
      fetchPage(pageNum);
    });
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Thông báo")),
        backgroundColor: AppColor.appMainBackground,
        body: RefreshIndicator(
          onRefresh: () async {
            pagingController.refresh();
          },
          child: PagedListView<int, Notification>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<Notification>(
                itemBuilder: (context, notification, index) => Container(
                    decoration: BoxDecoration(
                        color: notification.markAsRead == false
                            ? Colors.blue[50]
                            : Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      onTap: () async {
                        await markAsRead(notification._id!);
                      },
                      title: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(notification.content ?? '')),
                      subtitle: Text(notification.createdDate == null
                          ? ''
                          : notification.createdDate.toString()),
                      trailing: const Icon(Icons.more_vert),
                    ))),
          ),
        ));
  }
}
