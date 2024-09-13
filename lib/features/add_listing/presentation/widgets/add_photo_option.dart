import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/cubit/image_handler_cubit.dart';

addPhotoOption(context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.4,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 0.015.h(context),
              horizontal: 0.1.w(context),
            ),
            child: BlocBuilder<ImageHandlerCubit, List<XFile>>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Where would you like to get your photo?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 0.012.toRes(context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 0.015.h(context),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<ImageHandlerCubit>()
                          .getImages(src: ImageSource.camera),
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.03.w(context)),
                        child: const Text("Camera"),
                      ),
                    ),
                    SizedBox(
                      height: 0.01.h(context),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 0.01.h(context),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<ImageHandlerCubit>()
                          .getImages(src: ImageSource.gallery),
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.03.w(context)),
                        child: const Text("Photos"),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
