import 'package:flutter/material.dart';
import 'package:seat_finder/widgets/seats_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _seatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var seatNumber = 0;
  var _isTapped = false;

  void getSeatNumber() {
    seatNumber = int.parse(_seatController.text);
    if (seatNumber < 0 || seatNumber > 72) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Invalid seat number'),
            content: const Text('Entered seat number should be from 1 to 72'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              )
            ]),
      );
    }
    if (seatNumber > 0 && seatNumber < 72) {
      setState(() {
        _isTapped = true;
        double offset = (seatNumber ~/ 15) * 200.0;
        _scrollController.animateTo(offset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      });
    } else {
      setState(() {
        _seatController.clear();
        seatNumber = 0;
        _isTapped = false;
      });
    }
  }

  void reset() {
    setState(() {
      _seatController.clear();
      _isTapped = false;
      seatNumber = 0;
    });
  }

  @override
  void dispose() {
    _seatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 12.0),
            child: Text(
              'Seat Finder',
              style: TextStyle(
                  color: Color.fromARGB(255, 121, 199, 255),
                  fontFamily: 'Handlee',
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            IconButton(
                onPressed: reset, icon: const Icon(Icons.refresh_outlined))
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 14).copyWith(top: 10),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                      border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 205, 233, 254),
                            width: 4),
                        top: BorderSide(
                            color: Color.fromARGB(255, 205, 233, 254),
                            width: 4),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 205, 233, 254),
                            width: 4),
                        right: BorderSide(
                            color: Color.fromARGB(255, 205, 233, 254),
                            width: 0),
                      ),
                    ),
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 8.0,
                          bottom: 7.0,
                        ),
                        hintText: 'Enter seat no.',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      controller: _seatController,
                      onSubmitted: (value) => getSeatNumber(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: getSeatNumber,
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        color: _isTapped
                            ? const Color.fromARGB(255, 121, 199, 255)
                            : const Color.fromARGB(110, 86, 82, 82)),
                    child: Center(
                      child: Text(
                        'Find',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i <= 66; i = i + 8)
              SeatMap(
                normalBerthIndex: i,
                sideBerthIndex: i + 6,
                getSeatNumber: seatNumber,
              ),
          ]),
        ));
  }
}
