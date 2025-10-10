class MessageModel {
  final String id;
  final String message;
  final String senderUid;
  final String receiverUid;
  final String sentAt;

  MessageModel({
    required this.id,
    required this.message,
    required this.senderUid,
    required this.receiverUid,
    required this.sentAt,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
    id: map["id"],
    message: map['message'],
    senderUid: map['senderUid'],
    receiverUid: map['receiverUid'],
    sentAt: map['sentAt'],
  );
}
