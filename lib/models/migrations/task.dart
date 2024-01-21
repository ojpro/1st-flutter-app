import 'package:first_app/models/base_model.dart';

class Task extends BaseModal {
  String name;
  String? status = 'todo';
  Task({
    int? id,
    this.status,
    this.name = '',
    this.dueDate,
    int? createdAt,
    int? updatedAt,
  }) {
    super.id = id;
    super.createdAt = createdAt;
    super.updatedAt = updatedAt;
  }

  final int? dueDate;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'due_date': dueDate,
      'created_at': super.toMap()['created_at'],
      'updated_at': super.toMap()['updated_at'],
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, status: $status, due_date: $dueDate, createdAt: $createdAt, updated_at: $updatedAt}';
  }
}
