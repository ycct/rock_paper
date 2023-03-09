import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper/ui/player_2_screen.dart';
import '../algo_logic.dart';

class PlayerOneScreen extends StatelessWidget {
  const PlayerOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (HomeController h) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                h.algoLogic();
                Get.to(() => const PlayerTwoScreen());
              },
              label: const Text("Next"),
              backgroundColor: Colors.lightBlueAccent,
              icon: const Icon(Icons.navigate_next),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Player 1 Choose your weapon"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: h.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      h.changeIndex(index);
                      h.algoLogic();
                    },
                    child: Container(
                      color: h.selectedIndex == index
                          ? Colors.lightBlueAccent
                          : Colors.white,
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          h.list[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
