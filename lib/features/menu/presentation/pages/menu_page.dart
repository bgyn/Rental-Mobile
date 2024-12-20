import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/constant/url_constant.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rentpal/features/home/presentation/cubit/navigator_cubit.dart';
import 'package:rentpal/features/menu/presentation/widgets/menu_option_tiles.dart';
import 'package:rentpal/features/menu/presentation/widgets/version_info.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_state.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text(
          "Menu",
          style: TextStyle(color: Colors.white),
        ),
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
              // _information(context),
              // SizedBox(
              //   height: 0.05.h(context),
              // ),
              MenuOptionTiles(
                  icon: Icons.logout,
                  title: "logout",
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                    context.read<NavigatorCubit>().onChanged(1);
                  }),
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
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorPalette.primaryColor,
          ),
        );
      }
      if (state is ProfileError) {
        return Text(state.err);
      }
      if (state is ProfileSuccess) {
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl: UrlConstant.mediaUrl + state.data.profilePic.toString(),
              imageBuilder: (context, imageProvider) => Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: ColorPalette.primaryColor),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade400,
                ),
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 0.015.toRes(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.data.firstname} ${state.data.lastname}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 0.013.toRes(context),
                      ),
                ),
                Text(
                  "${state.data.email}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 0.013.toRes(context),
                      ),
                ),
              ],
            )
          ],
        );
      }
      return const SizedBox();
    });
  }

  _account(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuOptionTiles(
          icon: Icons.person_2_outlined,
          title: "Edit profile",
          onTap: () => GoRouter.of(context).push("/edit-profile"),
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
        MenuOptionTiles(
          icon: Icons.key,
          title: "Password",
          onTap: () => GoRouter.of(context).push(("/forgot-password")),
        ),
        const MenuOptionTiles(
          icon: Icons.shopping_bag_outlined,
          title: "My Orders",
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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 0.015.toRes(context),
              ),
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
