// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'note.freezed.dart';
// optional: Since our Note class is serializable, we must add this line.
// But if Note was not serializable, we could skip it.
part 'note.g.dart';

const String tableNotes = "notes";

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, desc, createAt, updateAt,
  ];

  static const String id = 'id';
  static const String title = 'title';
  static const String desc = 'desc';
  static const String createAt = 'create_at';
  static const String updateAt = 'update_at';
}

@freezed
class Note with _$Note {
  const factory Note({
    int? id,
    String? title,
    String? desc,
    // ignore: invalid_annotation_target
    @JsonKey(name: "create_at") String? createAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: "update_at") String? updateAt,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}
