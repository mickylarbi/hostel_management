import 'package:equatable/equatable.dart';
import 'package:hostel_management/models/guardian.dart';

// ignore: must_be_immutable
class Tenant extends Equatable {
  String? id;
  String name;
  Gender gender;
  String programme;
  int year;
  List<String> phones;
  List<Guardian> guardian;

  Tenant({
    this.id,
    required this.name,
    required this.gender,
    required this.programme,
    required this.year,
    required this.phones,
    required this.guardian,
  });

  @override
  List<Object?> get props =>
      [id, name, gender, programme, year, phones, guardian];
}

enum Gender { male, female }
