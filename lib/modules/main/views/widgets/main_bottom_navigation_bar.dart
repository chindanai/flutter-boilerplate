import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_boilerplate/images/images.dart';
import 'package:flutter_boilerplate/modules/main/bloc/main_bloc.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  BottomNavigationBarItem buildBottomNavigationBarItem(
    BuildContext context, {
    required String title,
    required String image,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        image,
        height: 25,
        color: Theme.of(context).unselectedWidgetColor,
      ),
      activeIcon: SvgPicture.asset(
        image,
        color: Theme.of(context).highlightColor,
        height: 25,
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (index) => BlocProvider.of<MainBloc>(context)
              .add(MainEventSelectedTab(index)),
          currentIndex: state.selectedIndex,
          items: [
            buildBottomNavigationBarItem(
              context,
              title: "tab1",
              image: CommonImage.buttonCart,
            ),
            buildBottomNavigationBarItem(
              context,
              title: "tab2",
              image: CommonImage.buttonCart,
            ),
            buildBottomNavigationBarItem(
              context,
              title: "tab3",
              image: CommonImage.buttonCart,
            ),
            buildBottomNavigationBarItem(
              context,
              title: "tab4",
              image: CommonImage.buttonCart,
            ),
            buildBottomNavigationBarItem(
              context,
              title: "tab5",
              image: CommonImage.buttonCart,
            ),
          ],
        );
      },
    );
  }
}
