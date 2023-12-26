import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/main_up_down.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    Uri(
                      path: '/game',
                    ).toString(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // 원하는 BorderRadius 값으로 조절
                  ),
                ),
                child: const Text(
                  'Start GAME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
