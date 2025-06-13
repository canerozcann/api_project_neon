class Person {
  final int? id;
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  final String notes;

  Person({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
      'notes': notes,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      email: map['email'],
      notes: map['notes'],
    );
  }
}
