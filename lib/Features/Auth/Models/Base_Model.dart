// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorModel {
  String error;
  ErrorModel({
    required this.error,
  });

  ErrorModel copyWith({
    String? error,
  }) {
    return ErrorModel(
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorModel(error: $error)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;

    return other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

class MessageModel  {
  String message;
  MessageModel({
    required this.message,
  });

  MessageModel copyWith({
    String? message,
  }) {
    return MessageModel(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageModel(message: $message)';

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
