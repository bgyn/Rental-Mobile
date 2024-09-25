import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/common/add_photo_option.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _fNameCtrl = TextEditingController();
  final _lNameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _aboutCtrl = TextEditingController();
  final _key = GlobalKey<FormState>();
  late ImageHandlerCubit _imageHandlerCubit;

  @override
  void initState() {
    _imageHandlerCubit = context.read<ImageHandlerCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _fNameCtrl.dispose();
    _lNameCtrl.dispose();
    _addressCtrl.dispose();
    _aboutCtrl.dispose();
    _imageHandlerCubit.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        title: const Text(
          "Profile Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.015.toRes(context)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.02.h(context),
                  ),
                  Stack(
                    children: [
                      BlocBuilder<ImageHandlerCubit, List<XFile>>(
                          builder: (context, state) {
                        return state.isEmpty
                            ? Container(
                                width: 0.4.w(context),
                                height: 0.18.h(context),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 0.1.toRes(context),
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                clipBehavior: Clip.hardEdge,
                                child: Container(
                                  width: 0.4.w(context),
                                  height: 0.18.h(context),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.file(
                                    File(state[0].path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                      }),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => addPhotoOption(context, "edit"),
                          child: Icon(
                            Icons.camera_alt,
                            size: 0.025.toRes(context),
                            color: Colors.grey.shade800,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.02.h(context),
                  ),
                  ProfileTextFormField(
                    textEditingController: _fNameCtrl,
                    title: "First Name",
                    hintText: "e.g. Ram",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  ProfileTextFormField(
                    textEditingController: _lNameCtrl,
                    title: "Last Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required";
                      }
                      return null;
                    },
                    hintText: "e.g. Gurung",
                  ),
                  ProfileTextFormField(
                    textEditingController: _addressCtrl,
                    title: "City and State",
                    hintText: "e.g. Bharatpur, Bagmati",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "City and State is required";
                      }
                      return null;
                    },
                  ),
                  ProfileTextField(
                    textEditingController: _aboutCtrl,
                    title: "About you",
                    hintText: "Tell us something about yourself",
                  ),
                  SizedBox(
                    height: 0.3.h(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0.015.toRes(context)),
        child: ElevatedButton(
          onPressed: () {
            if (_key.currentState?.validate() ?? false) {}
          },
          style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: ColorPalette.primaryColor),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
