import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class CustomerProvider with ChangeNotifier {
  Customer? customer;

  addPicture(Uint8List list) {
    customer = Customer(list);
    notifyListeners();
  }
}

class Customer {
  Uint8List? image;

  Customer(this.image);
}
