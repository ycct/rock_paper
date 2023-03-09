import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper/algo_logic.dart';
import 'package:rock_paper/main.dart';
import 'package:rock_paper/ui/player_1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController h) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                if (h.list.length.isOdd) {
                  Get.to(() => const PlayerOneScreen());
                } else {
                  CustomSnackBar.showErrorMessage(
                      "Please Add Odd Number of Elements");
                }
              },
              label: const Text("Next"),
              backgroundColor: Colors.lightBlueAccent,
              icon: const Icon(Icons.navigate_next),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Select Game Weapons",
                style: TextStyle(color: Colors.blue),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: h.listModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      h.addWeaponsToListAndSort(h.listModel[index]);
                    },
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          const Spacer(),
                          h.checkboxController(h.listModel[index])
                              ? const Icon(
                                  Icons.check_box,
                                  color: Colors.greenAccent,
                                )
                              : const SizedBox(),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            h.listModel[index].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                        ],
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


enum AlertEnum { success, danger, warning,  }

extension AlertEnumExtension on AlertEnum {
  Color get backgroundColor {
    switch (this) {
      case AlertEnum.success:
        return Colors.blue;
      case AlertEnum.danger:
        return Colors.red;
      case AlertEnum.warning:
        return Colors.green;
    }
  }
}

class CustomSnackBar {
  static const EdgeInsets _margin = EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 10,
  );

  CustomSnackBar.showSuccessMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.success;
    Get.snackbar(
      "Congrats",
      message,
      margin: _margin,
      backgroundColor: alertEnum.backgroundColor,
      colorText: Colors.white,
    );
  }

  CustomSnackBar.showWarningMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.warning;
    Get.snackbar(
      "Congrats",
      message,
      margin: _margin,
      backgroundColor: alertEnum.backgroundColor,
      colorText: Colors.white,
    );
  }

  CustomSnackBar.showErrorMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.danger;

    Get.snackbar(
      "Congrats",
      message,
      margin: _margin,
      backgroundColor: alertEnum.backgroundColor,
      colorText: Colors.white,
    );
  }
}
