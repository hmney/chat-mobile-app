class MessageModel {
  String content;
  String senderId;
  DateTime time;

  MessageModel({this.content, this.senderId, this.time});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      senderId: json['sender_id'],
      time: json['time'].toDate(),
    );
  }

  static List<MessageModel> fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return MessageModel.fromJson(item);
    })?.toList();
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'sender_id': senderId,
        'time': time,
      };
}
