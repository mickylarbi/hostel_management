import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Guardian extends Equatable {
  String? id;
  String name;
  Relationship relationship;
  List<String> phones;

  Guardian({
    this.id,
    required this.name,
    required this.relationship,
    required this.phones,
  });

  @override
  List<Object?> get props => [id, name, relationship, phones];
}

enum Relationship { parent, sibling, uncle, aunt, cousin, grandparent, other }
