// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:seat_finder/widgets/berths.dart';

class SeatMap extends StatelessWidget {
  const SeatMap(
      {super.key,
      required this.normalBerthIndex,
      required this.sideBerthIndex,
      required this.getSeatNumber});
  final normalBerthIndex;
  final sideBerthIndex;
  final getSeatNumber;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, top: 1),
                height: 25,
                width: 143,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    top: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    right: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                  ),
                ),
              ),
              BerthRow(
                totalRows: 3,
                seatNumber: normalBerthIndex + 0,
                enteredSeatNumber: getSeatNumber,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, top: 1),
                height: 25,
                width: 53,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    top: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    right: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                  ),
                ),
              ),
              BerthRow(
                totalRows: 1,
                seatNumber: sideBerthIndex,
                enteredSeatNumber: getSeatNumber,
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 25,
      ),

      //bottomStack

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, top: 31),
                height: 25,
                width: 143,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    right: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                  ),
                ),
              ),
              BerthRow(
                totalRows: 3,
                seatNumber: normalBerthIndex + 3,
                enteredSeatNumber: getSeatNumber,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, top: 31),
                height: 25,
                width: 53,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                    right: BorderSide(
                        color: Color.fromARGB(255, 121, 199, 255), width: 5),
                  ),
                ),
              ),
              BerthRow(
                totalRows: 1,
                seatNumber: sideBerthIndex + (1),
                enteredSeatNumber: getSeatNumber,
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
