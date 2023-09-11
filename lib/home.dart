import 'package:flutter/material.dart';
import 'package:untitled/widget/bottommodelsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello This is App Bar"),
        actions: [
          Center(
            child: PopupMenuButton<int>( // https://stackoverflow.com/questions/53662200/how-to-change-the-background-color-of-popup-menubutton-bullet-window#:~:text=You%20can%20just%20change%20the,it%20in%20a%20new%20theme.&text=Center(%20child%3A%20Theme(%20data%3A%20Theme.
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Pop Up Button 1")
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.chrome_reader_mode),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Pop Up Button 2")
                    ],
                  ),
                ),
              ],
              offset: const Offset(0, 100),
              color: Colors.grey,
              elevation: 2,
            ),
          ),
        ],
      ),
      body: const BottomModelSheet(),
    );
  }
}
