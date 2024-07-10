//
// import 'dart:math';
//
// import 'package:api_demo_task/audio_call/presentation/audio_utils.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:flutter/material.dart';
//
//
// class CallPage extends StatelessWidget {
//   final String callId;
//   CallPage({super.key,required this.callId});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final String localUserId = Random().nextInt(10000).toString();
//
//     return SafeArea(
//       child:  ZegoUIKitPrebuiltCall(
//         appID: Utils.appId,
//         appSign: Utils.appSignIn,
//         userID:localUserId ,
//         userName: "user_$localUserId",
//         callID: callId,
//         config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
//         // config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall().. = (context) {
//         //   Navigator.of(context).pop();
//         // },
//       ),);
//   }
// }
