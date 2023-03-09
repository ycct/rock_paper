import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../algo_logic.dart';
import 'home_screen.dart';

class PlayerTwoScreen extends StatelessWidget {
  const PlayerTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController h) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text("Player 2 Choose your weapon"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: h.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      showLoading(context);
                      h.changeIndexSecond(index);
                      await Future.delayed(const Duration(seconds: 1));
                      h.showGameResult(h.list[index]);
                      h.clearEverthing();
                      h.initFunc();
                      await Future.delayed(const Duration(seconds: 3));
                      Get.offAll(() => const HomeScreen());
                    },
                    child: Container(
                      color: h.selectedIndexSec == index
                          ? Colors.red
                          : Colors.white,
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          h.list[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
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

  showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
