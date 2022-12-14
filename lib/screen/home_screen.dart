import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator1121/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '랜덤숫자 생성기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: randomNumbers
                          .asMap()
                          .entries
                          .map(
                            (x) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: x.key == 2 ? 0 : 16.0),
                              child: Row(
                                children: x.value
                                    .toString()
                                    .split('')
                                    .map(
                                      (y) => Image.asset(
                                        'asset/img/$y.png',
                                        height: 70.0,
                                        width: 50.0,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                          .toList()),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RED_COLOR,
                  ),
                  onPressed: () {
                    final rand = Random();
                    final Set<int> newNumbers = {};

                    while (newNumbers.length < 3)
                    {
                      final number = rand.nextInt(1000);
                      newNumbers.add(number);
                    }

                    setState(() {
                      randomNumbers = newNumbers.toList();
                    });
                    print(randomNumbers);
                  },
                  child: Text('생성하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
