import 'package:flutter/material.dart';

class AddProfessorStore extends ChangeNotifier{
  bool passwordvisibility = true;
  bool confirmPasswordVisibility = true;
  String? selectedDepartment;
  String? selectedGender;

  setPasswirdVisibility(){
    passwordvisibility = !passwordvisibility;
    notifyListeners();
  }

  setConfirmPasswordVisibility(){
    confirmPasswordVisibility = !confirmPasswordVisibility;
    notifyListeners();
  }

  selectedGenderValue({String? selectedValue}) {
    selectedGender = selectedValue;
    notifyListeners();
  }

  selectedDepartmentValue({String? selectedValue}) {
    selectedDepartment = selectedValue;
    notifyListeners();
  }

}