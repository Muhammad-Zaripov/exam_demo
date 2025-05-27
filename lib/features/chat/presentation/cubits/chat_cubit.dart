import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/chat_model.dart';

class ChatCubit extends Cubit<List<ChatMessage>> {
  final String userId;
  final String hotelId;
  late final CollectionReference _messagesRef;
  late final StreamSubscription _subscription;
  bool _hasSentAutoReply = false;

  ChatCubit({required this.userId, required this.hotelId}) : super([]) {
    _messagesRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(hotelId)
        .collection('messages');

    _subscription = _messagesRef.orderBy('timestamp').snapshots().listen((
      snapshot,
    ) {
      final messages =
          snapshot.docs
              .map(
                (doc) =>
                    ChatMessage.fromJson(doc.data()! as Map<String, dynamic>),
              )
              .toList();
      emit(messages);
    });
  }

  void sendUserMessage(String message) async {
    final newMessage = ChatMessage(
      message: message,
      isFromUser: true,
      timestamp: DateTime.now(),
    );

    await _messagesRef.add(newMessage.toJson());

    if (!_hasSentAutoReply) {
      _sendAutoReply();
    }
  }

  void _sendAutoReply() async {
    final botMessage = ChatMessage(
      message: "Siz bilan tez orada mutaxassislar bogʻlanadi.",
      isFromUser: false,
      timestamp: DateTime.now(),
    );

    await Future.delayed(const Duration(milliseconds: 500));
    await _messagesRef.add(botMessage.toJson());
    _hasSentAutoReply = true;
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
