// ignore_for_file: avoid_print
import 'package:deployed_app/announcements_app/dummy_announcements.dart';
import 'package:deployed_app/announcements_app/widgets/announcement.dart';
import 'package:deployed_app/announcements_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:oydadb/src/oyda_interface.dart';

class AllAnnouncementsPage extends StatelessWidget {
  const AllAnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: "Announcements"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30.0),
          // child: StreamBuilder<QuerySnapshot>(
          // )
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: OydaInterface().selectTable('announcements'),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No announcements available.'),
                );
              } else {
                print('Data received: ${snapshot.data}');

                final announcements = snapshot.data!.map((data) {
                  final title = data['title'] as String?;
                  final content = data['content'] as String?;
                  final postedDate = data['posteddate'] as String?;
                  print(postedDate);

                  if (title == null || content == null || postedDate == null) {
                    print('Found null value in data: $data');
                  }

                  // Format postedDate
                  // final formattedDate = postedDate != null ? DateFormat.yMMMd().format(postedDate) : 'No date';

                  return Announcement(
                    title: title ?? 'No title',
                    content: content ?? 'No content',
                    postedDate: postedDate ?? 'No date',
                  );
                }).toList();

                return ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return AnnouncementWidget(
                      announcement: announcements[index],
                    );
                  },
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
