import 'package:flutter/material.dart';

//https://www.geeksforgeeks.org/flutter-modal-bottom-sheet/

class BottomModelSheet extends StatelessWidget {
  const BottomModelSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('Hello World'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),


    );
  }
}
