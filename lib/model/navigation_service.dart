import 'package:keeper/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationService{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushNamed(routeName);
    }else{
      return Future.value();
    }

  }
  Future<dynamic> pushToDashBoard(){//todo:
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> HomeScreen()),(route)=>false);
    }else{
      return Future.value();
    }

  }

  Future<dynamic> push(Widget routeWidget){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => routeWidget));
    }else{
      return Future.value();
    }
  }
  void pop(){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pop();
    }else{
      // return Future.value();
    }
  }

  Future<dynamic> replace(Widget routeWidget){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => routeWidget));
    }else{
      return Future.value();
    }

  }

  // Future<dynamic> showDialogWidget(DialogType type,{String? title,String? subtitle,void Function()? onTap1,void Function()? onTap2,}){
  //   if(navigatorKey.currentState!=null){
  //     return showDialog(context: navigatorKey.currentState!.context, builder: (context) => WillPopScope (
  //       onWillPop: () async{
  //         // _dialogService.dialogComplete();
  //         return true;
  //       },
  //       child: _dialogToReturn(type,title: title,subtitle: subtitle,onTap1: onTap1,onTap2: onTap2),
  //     ),
  //     );
  //   }else{
  //     return Future.value();
  //   }
  // }

  // Future<dynamic> showBottomSheet(BottomSheetType type) async{///handles the type of dialog to show along with completer.
  //   // if(DialogType.basic == _dialogService.type){
  //   //  await _showOkDialog();
  //   // }else if(DialogType.navigate == _dialogService.type){
  //   //  await _showOkNavigateDialog();
  //   // }else if(DialogType.pop == _dialogService.type){
  //   //  await _showOkPopDialog();
  //   // }else{
  //   if(navigatorKey.currentState!=null){
  //     return showModalBottomSheet(
  //         context: navigatorKey.currentState!.context,
  //         builder: (context)=> _bottomSheetToReturn(type),
  //         isScrollControlled: true,
  //         enableDrag: true,
  //         isDismissible: true,
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(25.0),
  //             topRight: Radius.circular(25.0),
  //           ),
  //         ));
  //     // await showDialog(context: context, builder: (context) => WillPopScope(
  //     //   onWillPop: () async{
  //     //     _dialogService.bottomSheetComplete();
  //     //     return true;
  //     //   },
  //     //   child: _bottomSheetToReturn(_dialogService.bottomSheetType!),
  //     // ),
  //     // );
  //     // }
  //   }else{
  //     return Future.value();
  //   }
  //
  //
  // }
  // Widget _bottomSheetToReturn(BottomSheetType bottomSheetType){
  //   switch(bottomSheetType){
  //
  //     case BottomSheetType.cancelBooking:
  //       return const SizedBox();
  //     case BottomSheetType.transactionPayment:
  //       return const SizedBox();
  //   // break;
  //     case BottomSheetType.fund:
  //       return const SizedBox();
  //     case BottomSheetType.user:
  //     // TODO: Handle this case.
  //       return const SizedBox();
  //   }
  // }



  // Widget _dialogToReturn(DialogType dialogType,{String? title,String? subtitle,void Function()? onTap1,void Function()? onTap2,}){
  //   switch(dialogType){
  //     case DialogType.basic:
  //       return  BasicDialog(title: title,subtitle: subtitle,onTap: onTap1,onTap2: onTap2,success: true,);
  //     case DialogType.fundYourAccount:
  //       return const SizedBox();
  //     case DialogType.reviewDialog:
  //       return const SizedBox();
  //     case DialogType.createDispute:
  //       return const SizedBox();
  //   }
  // }
}