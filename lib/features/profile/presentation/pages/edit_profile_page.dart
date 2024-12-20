import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/common/add_photo_option.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_state.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_dropdown.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _aboutCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _key = GlobalKey<FormState>();
  XFile? _profile;
  String? _gender;
  late ImageHandlerCubit _imageHandlerCubit;

  @override
  void initState() {
    _imageHandlerCubit = context.read<ImageHandlerCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _addressCtrl.dispose();
    _aboutCtrl.dispose();
    _imageHandlerCubit.reset();
    _phoneCtrl.dispose();
    _dobCtrl.dispose();
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
                      BlocListener<ImageHandlerCubit, List<XFile>>(
                        listener: (context, state) {
                          if (state.isNotEmpty) {
                            setState(() {
                              _profile = state[0];
                            });
                          }
                        },
                        child: BlocBuilder<ImageHandlerCubit, List<XFile>>(
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
                          },
                        ),
                      ),
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
                    textEditingController: _dobCtrl,
                    title: "DOB",
                    hintText: "yyyy-mm-dd",
                    readOnly: true,
                    onTap: () => selectDate(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date of birth is required";
                      }
                      return null;
                    },
                  ),
                  ProfileDropdownFormField(
                    title: "Gender",
                    hintText: "Gender",
                    items: const [
                      DropdownMenuItem(value: 'Option 1', child: Text('Male')),
                      DropdownMenuItem(
                          value: 'Option 2', child: Text('Female')),
                      DropdownMenuItem(value: 'Option 3', child: Text('Other')),
                    ],
                    value: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
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
                  ProfileTextFormField(
                    textEditingController: _phoneCtrl,
                    title: "Phone Number",
                    hintText: "9841",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The phone number is required";
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
      bottomNavigationBar: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
          }
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.err}')),
            );
          }
        },
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(0.015.toRes(context)),
            child: ElevatedButton(
              onPressed: () async {
                if (_key.currentState?.validate() ?? false) {
                  context.read<ProfileBloc>().add(ProfileUpdate(
                        file: _profile == null ? null : File(_profile!.path),
                        gender: _gender!,
                        dob: _dobCtrl.text,
                        address: _addressCtrl.text,
                        phone: _phoneCtrl.text,
                        aboutYou: _aboutCtrl.text,
                      ));
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: ColorPalette.primaryColor),
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 0.013.toRes(context),
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dobCtrl.text = picked.toString().split(" ")[0];
      });
    }
  }
}
