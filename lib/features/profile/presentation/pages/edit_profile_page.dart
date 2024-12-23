import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/common/add_photo_option.dart';
import 'package:rentpal/core/constant/url_constant.dart';
import 'package:rentpal/core/cubit/image_handler_cubit.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_state.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_dropdown.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:rentpal/features/profile/presentation/widgets/profile_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  final String from;
  const EditProfilePage({super.key, required this.from});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _aboutCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? image;
  XFile? _profile;
  String? _gender;
  late ImageHandlerCubit _imageHandlerCubit;

  @override
  void initState() {
    super.initState();
    if (widget.from != "register") {
      _fetchProfileData();
    }
    _imageHandlerCubit = context.read<ImageHandlerCubit>();
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

  Future<void> _fetchProfileData() async {
    final profileBloc = context.read<ProfileBloc>();
    profileBloc.add(ProfileFetch());

    await Future.delayed(Duration.zero);
    final state = profileBloc.state;

    if (state is ProfileSuccess) {
      image = state.data.profilePic ?? "";
      _addressCtrl.text = state.data.address ?? '';
      _phoneCtrl.text = state.data.phone ?? '';
      _aboutCtrl.text = state.data.aboutYou ?? '';
      _dobCtrl.text = state.data.dateOfBirth ?? '';
      _gender = state.data.gender?.capitalize();
    }
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
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }
        if (state is ProfileSuccess || state is Profieinitial) {
          return Container(
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
                                    ? image == null
                                        ? const CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.person,
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            clipBehavior: Clip.hardEdge,
                                            child: Container(
                                              width: 0.4.w(context),
                                              height: 0.18.h(context),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: UrlConstant.mediaUrl +
                                                    image.toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                color: ColorPalette.primaryColor,
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
                          DropdownMenuItem(value: 'Male', child: Text('Male')),
                          DropdownMenuItem(
                              value: 'Female', child: Text('Female')),
                          DropdownMenuItem(
                              value: 'Other', child: Text('Other')),
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
                        keyboardType: TextInputType.phone,
                        title: "Phone Number",
                        hintText: "980000000",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone number is required";
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
          );
        }

        return const SizedBox();
      }),
      bottomNavigationBar: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
            context.read<ProfileBloc>().add(ProfileFetch());
            if (widget.from == "register") {
              LocalStorage.setProfile();
              context.go('/');
            } else {
              LocalStorage.setProfile();
              context.pop();
            }
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
      keyboardType: TextInputType.datetime,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobCtrl.text = picked.toString().split(" ")[0];
      });
    }
  }
}
