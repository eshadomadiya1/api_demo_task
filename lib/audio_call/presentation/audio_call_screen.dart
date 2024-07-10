//
// import 'package:api_demo_task/audio_call/presentation/call_page.dart';
// import 'package:api_demo_task/widget/form_container_widget.dart';
// import 'package:flutter/material.dart';
//
//
// class AudioHomePage extends StatelessWidget {
//   AudioHomePage({super.key});
//   // final String localUserId = math.Random().nextInt(1000).toString();
//
//   final callController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               FormContainerWidget(
//                 controller: callController,
//               ),
//               ElevatedButton(onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return CallPage(callId: callController.text,);
//                 },));
//               }, child: const Text("Join"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
