import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/common/widgets/screen_wrapper.dart';
import 'package:flutter_boilerplate/modules/home/views/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: const HomeAppBar(),
      child: Text(
        "Home",
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Theme.of(context).hintColor),
      ),
    );
  }
}
