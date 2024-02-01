import 'package:flutter/material.dart';

 class NotificationPage extends StatefulWidget {
  final String deviceUDID;
  const NotificationPage({Key? key, required this.deviceUDID}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications'),
    );
  }
}