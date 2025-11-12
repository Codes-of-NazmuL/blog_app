import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class BookmarkProvider extends ChangeNotifier {
  final store = GetStorage();
  List<int> bookmarkse = [];
  bool state = true;

  savebookmark() {
    store.write("bookmark", bookmarkse);
  }

  readbookmark() {
    bookmarkse = List<int>.from(store.read("bookmark") ?? []);
  }

  addBookmark({required int index}) {
    bookmarkse.add(index);
    savebookmark();
    notifyListeners();
  }

  removeBookmark({required int index}) {
    bookmarkse.remove(index);
    savebookmark();
    notifyListeners();
  }

  bool bookmarkCheker({required int index}) {
    return bookmarkse.contains(index);
  }
}
