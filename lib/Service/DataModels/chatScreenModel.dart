class ChatMessage {
  final String message;
  final String imageUrl;
  final String id;

  ChatMessage({required this.id, required this.message, required this.imageUrl});

factory ChatMessage.fromJson(Map<String, dynamic> jsonData) {
  return ChatMessage(
    id: jsonData['id'] ?? '',
    message: jsonData['message'] ?? '',
    imageUrl: jsonData['imageUrl'] ?? '',
  );
}

  Map<String, dynamic> toJson() => {'message': message, 'imageUrl': imageUrl, 'id':id};
}