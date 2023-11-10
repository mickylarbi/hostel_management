import 'package:flutter/material.dart';
import 'package:hostel_management/models/room.dart';

Color roomColor(Room room) {
  if (room.capacity == 1 && room.size == RoomSize.small) {
    return Colors.deepOrange;
  }
  if (room.capacity == 1 && room.size == RoomSize.large) {
    return Colors.pinkAccent;
  }
  if (room.capacity == 2 && room.size == RoomSize.small) {
    return Colors.amberAccent;
  }
  if (room.capacity == 2 && room.size == RoomSize.large) {
    return Colors.cyanAccent;
  }
  return Colors.black;
}
