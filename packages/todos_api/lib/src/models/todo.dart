import 'package:json_annotation/json_annotation.dart';
import 'package:todos_api/src/models/models.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(id == null || id.isNotEmpty,
            'id must either be null or a not empty'),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the 'todo'.
  ///
  /// Cannot be emptyy.
  final String id;

  /// The title of the 'todo'.
  ///
  /// Note that the title may be empty.
  final String title;

  /// The description of the 'todo'.
  ///
  /// Defaults to an empty string.
  final String description;

  /// Whether the 'todo' is completed.
  ///
  /// Defaults to 'false'.
  final bool isCompleted;

  /// Returns a copy of this `todo` with the given values updated.
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);
}
