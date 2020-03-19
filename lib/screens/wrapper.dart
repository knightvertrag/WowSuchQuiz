import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_such_quiz/models/user.dart';

import 'package:wow_such_quiz/screens/home.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //returns either home or auth depending on login status.
    if (user == null) {
      return Authenticate();
    } else {
      return Homepage();
    }

    
  }
}
