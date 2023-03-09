import 'package:get/get.dart';
import 'package:rock_paper/model/game_model.dart';
import 'package:rock_paper/ui/home_screen.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    super.onInit();
    initFunc();
  }

  List<GameModel> listModel = [
    GameModel(title: "Rock", index: 0),
    GameModel(title: "Gun", index: 1),
    GameModel(title: "Lightning", index: 2),
    GameModel(title: "Devil", index: 3),
    GameModel(title: "Dragon", index: 4),
    GameModel(title: "Water", index: 5),
    GameModel(title: "Air", index: 6),
    GameModel(title: "Paper", index: 7),
    GameModel(title: "Sponge", index: 8),
    GameModel(title: "Wolf", index: 9),
    GameModel(title: "Tree", index: 10),
    GameModel(title: "Human", index: 11),
    GameModel(title: "Snake", index: 12),
    GameModel(title: "Scissors", index: 13),
    GameModel(title: "Fire", index: 14),
  ];

  List<GameModel> list = [];
  List winnerIndexes = [];
  List loserIndexes = [];
  List<GameModel> newTitleModel = [];

  int selectedIndex = 0;
  int selectedIndexSec = 0;

  initFunc() {
    list.add(listModel[0]);
    list.add(listModel[7]);
    list.add(listModel[13]);
  }

  bool checkboxController(GameModel selectedModel) {
    if (list.contains(selectedModel)) {
      return true;
    } else {
      return false;
    }
  }

  addWeaponsToListAndSort(GameModel item) {
    if (!list.contains(item)) {
      list.add(item);
      list.sort((a, b) => a.index.compareTo(b.index));
    } else {
      list.remove(item);
      list.sort((a, b) => a.index.compareTo(b.index));
    }
    update();
  }

  changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  changeIndexSecond(int index) {
    selectedIndexSec = index;
    update();
  }

  clearEverthing() {
    winnerIndexes.clear();
    loserIndexes.clear();
    list.clear();
  }

  showGameResult(GameModel selectedModel) {
    if (selectedIndex == selectedIndexSec) {
      CustomSnackBar.showWarningMessage("Draw");
    } else if (loserIndexes.contains(selectedModel)) {
      CustomSnackBar.showSuccessMessage("Player 1 Win");
    } else if (winnerIndexes.contains(selectedModel)) {
      CustomSnackBar.showErrorMessage("Player 2 Win");
    }
  }

  algoLogic() {
    if (selectedIndex > list.length ~/ 2) {
      winnerIndexes = list
              .skip(selectedIndex + 1)
              .take(list.length - 1 - selectedIndex)
              .toList() +
          list
              .take(list.length ~/ 2 - (list.length - 1 - selectedIndex))
              .toList();
    } else {
      winnerIndexes =
          list.skip(selectedIndex + 1).take(list.length ~/ 2).toList();
    }
    var set1 = Set.from(list);
    var set2 = Set.from(winnerIndexes);
    loserIndexes = List.from(set1.difference(set2));
  }
}
