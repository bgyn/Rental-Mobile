import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/menu/presentation/widgets/menu_option_tiles.dart';
import 'package:rentpal/features/menu/presentation/widgets/version_info.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Menu"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015.toRes(context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.05.h(context),
              ),
              _profile(context),
              SizedBox(
                height: 0.03.h(context),
              ),
              _account(context),
              SizedBox(
                height: 0.03.h(context),
              ),
              _information(context),
              SizedBox(
                height: 0.05.h(context),
              ),
              GestureDetector(
                onTap: (){
                  context.read<AuthCubit>();
                },
                child:
                    const MenuOptionTiles(icon: Icons.logout, title: "logout"),
              ),
              SizedBox(
                height: 0.05.h(context),
              ),
              const VersionText()
            ],
          ),
        ),
      ),
    );
  }

  _profile(context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          width: 0.015.toRes(context),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bigyan"),
            Text("bigyanthanait8@gmail.com"),
          ],
        )
      ],
    );
  }

  _account(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ACCOUNT",
          style: TextStyle(
              fontSize: 0.016.toRes(context), fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.01.h(context),
        ),
        const MenuOptionTiles(
          icon: Icons.person_2_outlined,
          title: "Edit profile",
        ),
        const MenuOptionTiles(
          icon: Icons.dataset,
          title: "Personal information",
        ),
        const MenuOptionTiles(
          icon: Icons.shield_outlined,
          title: "Verification",
        ),
        const MenuOptionTiles(
          icon: Icons.favorite_outline,
          title: "Favorites",
        ),
        const MenuOptionTiles(
          icon: Icons.key,
          title: "Password",
        ),
        const MenuOptionTiles(
          icon: Icons.payments,
          title: "Payment method",
        ),
      ],
    );
  }

  _information(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INFORMATION",
          style: TextStyle(
              fontSize: 0.016.toRes(context), fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.01.h(context),
        ),
        const MenuOptionTiles(
          icon: Icons.lightbulb_outline,
          title: "How it works",
        ),
        const MenuOptionTiles(
          icon: Icons.help_outline_sharp,
          title: "Help and support",
        ),
        const MenuOptionTiles(
          icon: Icons.question_mark,
          title: "Frequently asked questions",
        ),
        const MenuOptionTiles(
          icon: Icons.checklist_outlined,
          title: "Terms",
        ),
        const MenuOptionTiles(
          icon: Icons.lock_outline,
          title: "Privacy",
        ),
      ],
    );
  }
}
