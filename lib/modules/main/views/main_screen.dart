import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/main/views/widgets/main_bottom_navigation_bar.dart';
import 'package:flutter_boilerplate/modules/main/views/widgets/main_screens.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreens(),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  // Handler Lifecycle application resumed,inactive,paused
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint("App resumed..");
    } else if (state == AppLifecycleState.inactive) {
      debugPrint("App inactive..");
    } else if (state == AppLifecycleState.paused) {
      debugPrint("App paused..");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
