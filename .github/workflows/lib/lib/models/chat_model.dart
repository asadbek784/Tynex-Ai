import '../import_helper.dart';

class TynexMessage {
  final String id;
    final String role;
      final String text;
        final String? imageBase64;
          final String? imageMimeType;
            final List<String> quickReplies;
              final int createdAt;

                TynexMessage({required this.id, required this.role, required this.text, this.imageBase64, this.imageMimeType, required this.quickReplies, required this.createdAt});

                  Map<String, dynamic> toJson() => {'id': id, 'role': role, 'text': text, 'imageBase64': imageBase64, 'imageMimeType': imageMimeType, 'quickReplies': quickReplies, 'createdAt': createdAt};

                    factory TynexMessage.fromJson(Map<String, dynamic> json) => TynexMessage(
                        id: json['id'] ?? '', role: json['role'] ?? 'user', text: json['text'] ?? '',
                            imageBase64: json['imageBase64'], imageMimeType: json['imageMimeType'],
                                quickReplies: List<String>.from(json['quickReplies'] ?? []),
                                    createdAt: json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
                                      );
                                      }

                                      class TynexConversation {
                                        final String id;
                                          String title;
                                            bool pinned;
                                              final int createdAt;
                                                int updatedAt;
                                                  List<TynexMessage> messages;

                                                    TynexConversation({required this.id, required this.title, this.pinned = false, required this.createdAt, required this.updatedAt, required this.messages});

                                                      Map<String, dynamic> toJson() => {'id': id, 'title': title, 'pinned': pinned, 'createdAt': createdAt, 'updatedAt': updatedAt, 'messages': messages.map((m) => m.toJson()).toList()};

                                                        factory TynexConversation.fromJson(Map<String, dynamic> json) => TynexConversation(
                                                            id: json['id'] ?? '', title: json['title'] ?? '', pinned: json['pinned'] ?? false,
                                                                createdAt: json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
                                                                    updatedAt: json['updatedAt'] ?? DateTime.now().millisecondsSinceEpoch,
                                                                        messages: (json['messages'] as List? ?? []).map((m) => TynexMessage.fromJson(m)).toList(),
                                                                          );
                                                                          }