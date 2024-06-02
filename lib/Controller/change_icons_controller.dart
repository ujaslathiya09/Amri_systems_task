import 'package:get/get.dart';

class IconController extends GetxController {
  var isIconChanged = <int, bool>{}.obs;

  void toggleIcon(int index) {
    if (isIconChanged.containsKey(index)) {
      isIconChanged[index] = !isIconChanged[index]!;
    } else {
      isIconChanged[index] = true;
    }
  }
}
