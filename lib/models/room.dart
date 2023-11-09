
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Room extends Equatable {
  String? id;
  String number;
  int capacity;
  RoomSize size;

  Room({
    this.id,
    required this.number,
    required this.capacity,
    required this.size,
  });

  // Room.fromExtraMap(Map<String, dynamic> map)
  //     : id = map['id'],
  //       number = map['number'],
  //       capacity = map['capacity'],
  //       size = RoomSize.values[map['size']];

  // // Room.copyWith();

  // String get toJson => jsonEncode(toMap());

  // Map<String, dynamic> toMap() => {
  //       'id': id,
  //       'number': number,
  //       'capacity': capacity,
  //       'size': size.index,
  //     };

  @override
  List<Object?> get props => [id, number, capacity, size];
}

enum RoomSize { small, large }
