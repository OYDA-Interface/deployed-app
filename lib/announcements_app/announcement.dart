// ignore_for_file: avoid_print

import 'package:deployed_app/announcements_app/dummy_announcements.dart';
import 'package:deployed_app/announcements_app/views/all_announcements.dart';
import 'package:deployed_app/announcements_app/views/view_announcement.dart';
// import 'package:oydadb/src/oyda_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//   runApp(const AnnouncementApp());
// }

class AnnouncementApp extends StatelessWidget {
  const AnnouncementApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Announcements App',
      initialRoute: '/announcements',
      routes: {
        '/announcements': (context) => const AllAnnouncementsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/viewAnnouncement') {
          final announcement = settings.arguments as Announcement;
          return MaterialPageRoute(
            builder: (context) {
              return ViewAnnouncementPage(announcement: announcement);
            },
          );
        }
        return null;
      },
    );
  }
}
