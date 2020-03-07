import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //returns either home or auth depending on login status.


    return Authenticate();
  }
}
