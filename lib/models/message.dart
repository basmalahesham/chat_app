class Message {
  final String message;
  final String id;

  Message(
      this.message,
      this.id,
      );

  // Named constructor to create a Message from a snapshot
  factory Message.fromSnapshot(Map<String, dynamic> snapshot) {
    return Message(
      snapshot['message'] as String,
      snapshot['id'] as String,
    );
  }
}