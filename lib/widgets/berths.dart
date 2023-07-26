// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BerthRow extends StatelessWidget {
  const BerthRow(
      {super.key,
      required this.totalRows,
      required this.seatNumber,
      required this.enteredSeatNumber});
  final totalRows;
  final seatNumber;
  final enteredSeatNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Row(
        children: [
          for (int i = 1; i <= totalRows; i++)
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: (i + seatNumber) == enteredSeatNumber
                    ? Colors.lightBlue
                    : const Color.fromARGB(255, 205, 233, 254),
                border: Border.all(color: Colors.transparent, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Center(
                      child: Text(
                    '${i + seatNumber}',
                    style:
                        const TextStyle(color: Color.fromARGB(255, 6, 71, 124)),
                  )),
                  if (totalRows == 3)
                    i == 1
                        ? const Text(
                            'Lower',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 10),
                          )
                        : i == 2
                            ? const Text(
                                'Middle',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 10),
                              )
                            : const Text(
                                'Upper',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 10),
                              ),
                  if (totalRows == 1)
                    (i + seatNumber) % 8 == 0
                        ? const Text(
                            'Side Upper',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 9),
                          )
                        : const Text(
                            'Side Lower',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 9),
                          ),
                  const SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
