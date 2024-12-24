import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/constant/premade_rule.dart';

class RulesState {
  RulesState(
      {required this.rules,
      required this.premadeRules,
      required this.tempRules});
  final List<String> rules;
  final List<String> premadeRules;
  final List<String> tempRules;

  RulesState copyWith(
      {List<String>? rules,
      List<String>? premadeRules,
      List<String>? tempRules}) {
    return RulesState(
      rules: rules ?? this.rules,
      premadeRules: premadeRules ?? this.premadeRules,
      tempRules: tempRules ?? this.tempRules,
    );
  }
}

class RulesCubit extends Cubit<RulesState> {
  RulesCubit()
      : super(RulesState(
          rules: [],
          premadeRules: PremadeRule.premadeRules,
          tempRules: [],
        ));

  void addRules({required String rule}) {
    final newRules = [...state.rules, rule];
    emit(
      state.copyWith(tempRules: newRules),
    );
  }

  void initalizeRules({required String rule}) {
    final newRules = [...state.rules, rule];
    emit(state.copyWith(rules: newRules));
  }

  void addPremadeRulesToRules({required int index}) {
    final newRules = [...state.tempRules, state.premadeRules[index]];
    final premadeRule = state.premadeRules
        .asMap()
        .entries
        .where((entry) => entry.key != index)
        .map((entry) => entry.value)
        .toList();
    emit(state.copyWith(tempRules: newRules, premadeRules: premadeRule));
  }

  void removeRules({required int index}) {
    emit(
      state.copyWith(
        tempRules: state.tempRules
            .asMap()
            .entries
            .where((rule) => rule.key != index)
            .map((rule) => rule.value)
            .toList(),
      ),
    );
  }

  void onSave() {
    emit(state.copyWith(
      rules: [...state.tempRules],
      tempRules: [],
    ));
  }

  void copyRulesToTemp() {
    emit(state.copyWith(
      tempRules: List.from(state.rules),
    ));
  }

  void reset() {
    emit(RulesState(
      rules: [],
      premadeRules: PremadeRule.premadeRules,
      tempRules: [],
    ));
  }
}
