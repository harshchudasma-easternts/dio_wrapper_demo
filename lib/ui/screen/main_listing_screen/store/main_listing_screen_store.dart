import 'package:flutter/material.dart';

class MainScreenStore extends ChangeNotifier{
    bool isExpandedList = true;

    void setExpandedValue(){
      isExpandedList = !isExpandedList;
      notifyListeners();
    }

}