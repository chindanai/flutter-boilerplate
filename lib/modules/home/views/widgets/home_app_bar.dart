import 'package:flutter_boilerplate/modules/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_boilerplate/images/images.dart';
import 'package:flutter_boilerplate/modules/common/widgets/notification_button.dart';
import 'package:flutter_boilerplate/modules/profile/views/profile_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: const [
          Text("Title"),
          SizedBox(
            width: 10,
          ),
          Spacer()
        ],
      ),
      actions: [
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
            onPressed: () {
              BlocProvider.of<MainBloc>(context)
                  .add(const MainEventSelectedTab(2));
            },
            icon: SvgPicture.asset(
              CommonImage.buttonCart,
              color: Theme.of(context).primaryColor,
            )),
        const NotificationButton(),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
