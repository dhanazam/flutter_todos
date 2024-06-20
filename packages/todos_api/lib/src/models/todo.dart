import 'package:uuid/uuid.dart';

class Todo {
  Todo({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or a not empty'
        ),
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
}