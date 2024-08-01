import 'package:deployed_app/announcements_app/dummy_announcements.dart';
import 'package:deployed_app/announcements_app/widgets/appbar.dart';
import 'package:deployed_app/announcements_app/widgets/expanded_announcement.dart';
import 'package:flutter/material.dart';

class ViewAnnouncementPage extends StatelessWidget {
  final Announcement announcement;

  ViewAnnouncementPage({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: "Announcements"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30.0),
          child: ExpandedAnnouncementWidget(
            announcement: announcement,
          ),
        ),
      ),
    );
  }
}