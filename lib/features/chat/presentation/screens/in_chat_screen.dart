// import 'package:exam_4_oy_demo/core/models/hotel_model.dart';
// import 'package:exam_4_oy_demo/features/auth/data/model/auth_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/models/chat_model.dart';
// import '../cubits/chat_cubit.dart';

// class ChatScreen extends StatefulWidget {
//   final HotelModel hotel;

//   const ChatScreen({super.key, required this.hotel});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final String userId = FirebaseAuth.instance.currentUser!.uid;
//     print(userId);
//     return BlocProvider(
//       create: (_) => ChatCubit(userId: userId, hotelId: widget.hotel.id),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Support Chat')),
//         body: Column(
//           children: [
//             Expanded(
//               child: BlocBuilder<ChatCubit, List<ChatMessage>>(
//                 builder: (context, messages) {
//                   return ListView.builder(
//                     reverse: true,
//                     itemCount: messages.length,
//                     itemBuilder: (context, index) {
//                       final msg =
//                           messages[messages.length -
//                               1 -
//                               index]; // Reverse order
//                       return Align(
//                         alignment:
//                             msg.isFromUser
//                                 ? Alignment.centerRight
//                                 : Alignment.centerLeft,
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(
//                             vertical: 4,
//                             horizontal: 12,
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color:
//                                 msg.isFromUser
//                                     ? Colors.blue
//                                     : Colors.grey.shade300,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             msg.message,
//                             style: TextStyle(
//                               color:
//                                   msg.isFromUser ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             const Divider(height: 1),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _controller,
//                       decoration: const InputDecoration(
//                         hintText: 'Xabar yozing...',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send),
//                     onPressed: () {
//                       final text = _controller.text.trim();
//                       if (text.isNotEmpty) {
//                         context.read<ChatCubit>().sendUserMessage(text);
//                         _controller.clear();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
