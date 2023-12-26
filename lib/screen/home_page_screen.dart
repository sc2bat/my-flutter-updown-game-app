import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UP & DOWN GAME'),
        backgroundColor: const Color.fromARGB(255, 146, 178, 238),
        shadowColor: Colors.grey,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/main_up_down.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
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
