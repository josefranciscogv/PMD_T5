import 'package:flutter/material.dart';

class ForageProvider with ChangeNotifier {
  var _nameController = TextEditingController();
  var _locationController = TextEditingController();
  bool _isCurrentlyInSeason = false;
  var _notesController = TextEditingController();

  TextEditingController get getNameController => _nameController;
  TextEditingController get getLocationController => _locationController;
  bool get isCurrentlyInSeason => _isCurrentlyInSeason;
  TextEditingController get getNotesController => _notesController;

  List<dynamic> forage_items = [];

  void updateSeason(bool value) {
    _isCurrentlyInSeason = value;
    notifyListeners();
  }

  void addItemToList() {
    if (_nameController.text.isEmpty) return;
    if (_locationController.text.isEmpty) return;

    var new_item = {
      "name": _nameController.text,
      "location": _locationController.text,
      "isCurrentlyInSeason": _isCurrentlyInSeason,
      "notes": _notesController.text
    };

    forage_items.add(new_item);
    notifyListeners();
  }

  void clearControllers() {
    _nameController.clear();
    _locationController.clear();
    _isCurrentlyInSeason = false;
    _notesController.clear();
  }
}
