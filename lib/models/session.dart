import 'package:equatable/equatable.dart';
import 'package:hostel_management/models/room.dart';

// ignore: must_be_immutable
class Session extends Equatable {
  String? id;
  String title;
  DateTime startDate;
  DateTime? endDate;
  List<RoomPrice> roomPrices;
  List<SpecialRoomPrice> specialRoomPrices;

  Session({
    this.id,
    required this.title,
    required this.startDate,
    this.endDate,
    required this.roomPrices,
    required this.specialRoomPrices,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        startDate,
        endDate,
        roomPrices,
        specialRoomPrices,
      ];
}

// ignore: must_be_immutable
class RoomPrice extends Equatable {
  RoomSize roomSize;
  int capacity;
  double price;

  RoomPrice({
    required this.roomSize,
    required this.capacity,
    required this.price,
  });

  @override
  List<Object?> get props => [roomSize, capacity, price];
}

// ignore: must_be_immutable
class SpecialRoomPrice extends Equatable {
  String roomId;
  double price;

  SpecialRoomPrice({required this.roomId, required this.price});

  @override
  List<Object?> get props => [roomId, price];
}
