import 'package:flutter/foundation.dart';

class BookmarkProvider extends ChangeNotifier {
  List<int> bookmarkse = [];
  bool state = true;

  addBookmark({required int index}) {
    bookmarkse.add(index);
    notifyListeners();
  }

  removeBookmark({required int index}) {
    bookmarkse.remove(index);
    notifyListeners();
  }

  bool bookmarkCheker({required int index}) {
    return bookmarkse.contains(index);
  }
}
