abstract class BaseModal {
  int? id;
  int? createdAt;
  int? updatedAt;

  // initialize object attributes
  BaseModal();

  // convert table columns into key-value array
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'created_at': createdAt ?? DateTime.timestamp().millisecondsSinceEpoch,
      'updated_at': updatedAt ?? DateTime.timestamp().millisecondsSinceEpoch
    };
  }

  // get table name
  Type tableName() => runtimeType;
}
