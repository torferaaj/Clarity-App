import 'package:flutter/material.dart';

class PollsProvider extends ChangeNotifier {
  List pollsOptions = ['', ''];

  Map pollsWeights = {};

  String pollTitle = '';

  List<TextEditingController> _controllers = [TextEditingController(),TextEditingController()];

  TextEditingController  controller(int index){
    return _controllers[index];
  }

  void addControllers(){
    _controllers.add(TextEditingController());
    notifyListeners();
  }

  void removeControllers(){
    // _controllers.clear();
    clearList();
    if(_controllers.length>2) {
      for (int i = _controllers.length - 1; i > 2; i--) {
        _controllers.removeAt(i);
      }
    }
    pollsWeights.clear();
   _controllers[0].clear();
   _controllers[1].clear();
   print(_controllers[0].text);
    notifyListeners();
  }


  ///// Functions
  ///
  ///

  addPollWeights(Map value) {
    pollsWeights = value;
    notifyListeners();
  }

  addPollTitle(String value) {
    pollTitle = value;
    notifyListeners();
  }

  addPollOption() {
    pollsOptions.add('');
    notifyListeners();
  }

  removeOption() {
    pollsOptions.removeLast();
    notifyListeners();
  }

  clearList(){
    pollsOptions.clear();
    pollsOptions.add('');
    pollsOptions.add('');
    notifyListeners();
  }
}
