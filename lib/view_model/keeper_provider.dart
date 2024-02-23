import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 final keeperNotifierProvider = StateNotifierProvider<KeeperProvider, CalcModel>((ref) => KeeperProvider());

 // final keeperNotifierProviderr = ChangeNotifierProvider((ref) => KeeperProviderr());

 class CalcModel{
   CalcModel({required this.answer, required this.yoh,required this.parameter});
   int parameter;
   int answer;
   int yoh;
   }

class KeeperProvider extends StateNotifier<CalcModel>{
  KeeperProvider() : super(CalcModel(answer: 10, yoh: 1, parameter: 1));
   void calc(){
   state.parameter++;
   state.yoh++;
   state.answer = 10 * state.parameter;
   state = CalcModel(answer: state.answer, yoh: state.yoh, parameter: state.parameter);
   log('${state.parameter}');
   log('${state.yoh}');
   log('${state.answer}');
  }
}



// class KeeperProviderr extends ChangeNotifier{
//   int parameter = 1;
//   int answer = 5;
//   int yoh = 1;
//
//
//   void calc(){
//     parameter++;
//     yoh++;
//     answer = 5 * parameter;
//     notifyListeners();
//   }
// }