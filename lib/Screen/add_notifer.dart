import 'package:flutter/foundation.dart';

class AddNotifer{
  ValueNotifier setdata = ValueNotifier('');

  void setAddNotifer(String newValue){
    setdata.value = newValue;
  }
}