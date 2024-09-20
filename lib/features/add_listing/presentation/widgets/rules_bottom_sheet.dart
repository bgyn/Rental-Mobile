import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';
import 'package:rentpal/features/add_listing/cubit/rules_cubit.dart';

rulesBottomSheet(context) {
  final TextEditingController ruleController = TextEditingController();
  return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      isDismissible: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 0.015.toRes(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rental Rules",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.015.toRes(context),
                    ),
                  ),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                  BlocBuilder<RulesCubit, RulesState>(
                      builder: (context, state) {
                    if (state.tempRules.isEmpty) {
                      return SizedBox(
                        height: 0.015.h(context),
                      );
                    } else {
                      return Column(
                        children: state.tempRules
                            .asMap()
                            .entries
                            .map((rule) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 0.01.toRes(context),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.02.w(context),
                                      ),
                                      Text(rule.value),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<RulesCubit>()
                                              .removeRules(index: rule.key);
                                        },
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      );
                    }
                  }),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                  Text(
                    "Add a premade rules",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.015.toRes(context),
                    ),
                  ),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                  BlocBuilder<RulesCubit, RulesState>(
                      builder: (context, state) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.premadeRules
                            .asMap()
                            .entries
                            .map((MapEntry<int, String> entry) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<RulesCubit>()
                                  .addPremadeRulesToRules(index: entry.key);
                            },
                            child: Row(
                              children: [
                                Text(
                                  entry.value,
                                  style: const TextStyle(
                                      color: ColorPalette.primaryColor),
                                ),
                              ],
                            ),
                          );
                        }).toList());
                  }),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                  Text(
                    "Enter a custom rule",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.015.toRes(context),
                    ),
                  ),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ruleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter your rule here",
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.normal),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            context.read<RulesCubit>().addRules(rule: value);
                            ruleController.clear();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 0.02.w(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<RulesCubit>()
                              .addRules(rule: ruleController.text);
                          ruleController.clear();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 3,
                                color: ColorPalette.primaryColor,
                              )),
                          child: const Icon(
                            Icons.add,
                            color: ColorPalette.primaryColor,
                            weight: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        backgroundColor: ColorPalette.primaryColor,
                      ),
                      onPressed: () {
                        context.read<RulesCubit>().onSave();
                        ruleController.dispose();
                        GoRouter.of(context).pop();
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.01.h(context),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
