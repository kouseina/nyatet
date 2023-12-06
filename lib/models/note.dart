// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'note.freezed.dart';
// optional: Since our Note class is serializable, we must add this line.
// But if Note was not serializable, we could skip it.
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    String? title,
    String? desc,
    @JsonKey(name: "create_at") String? createAt,
    @JsonKey(name: "update_at") String? updateAt,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}
