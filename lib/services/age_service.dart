import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  DateTime? _selectedDate;
  String _age = "";

  DateTime? get selectedDate => _selectedDate;
  String get age => _age;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setAge(String value) {
    _age = value;
    notifyListeners();
  }


//The function used to format the date in to our desire
  String getFormattedDate() {
    return _selectedDate != null
        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
        : "Select Date of Birth";
  }


//Function used to get the age
  String getAge() {
    if (_selectedDate != null) {
      DateTime currentDate = DateTime.now();
      int years = currentDate.year - _selectedDate!.year;

      if (currentDate.month < _selectedDate!.month ||
          (currentDate.month == _selectedDate!.month &&
              currentDate.day < _selectedDate!.day)) {
        years--;
      }

      return "Your age is $years years";
    } else {
      return "Please select your date of birth";
    }
  }

//This is the future function used to select the date from the date picker
  Future<void> selectDate(
      BuildContext context, AgeProvider ageProvider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != ageProvider.selectedDate) {
      ageProvider.setSelectedDate(picked);
    }
  }

//This is the function used to calculate the age after selecting the date from the date picker
  void calculateAge(BuildContext context) {
    if (_selectedDate != null) {
      DateTime currentDate = DateTime.now();
      int years = currentDate.year - _selectedDate!.year;

      if (currentDate.month < _selectedDate!.month ||
          (currentDate.month == _selectedDate!.month &&
              currentDate.day < _selectedDate!.day)) {
        years--;
      }

      String ageText = "Your age is $years years";
      setAge(ageText);
    }
  }
  
}
