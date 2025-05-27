import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String message;
  final bool isFromUser;
  final DateTime timestamp;

  ChatMessage({
    required this.message,
    required this.isFromUser,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'message': message,
    'isFromUser': isFromUser,
    'timestamp': Timestamp.fromDate(timestamp),
  };

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'],
      isFromUser: json['isFromUser'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }
}
