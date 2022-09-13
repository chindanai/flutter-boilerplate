import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/common/widgets/notification_button.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = 'profile';

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ข้อมูลสมาชิก"),
        actions: const [
           NotificationButton(),
        ],
      ),
      body: Container(),
    );
  }
}
