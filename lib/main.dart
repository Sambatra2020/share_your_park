import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:share_your_park/views/nfc/scan_nfc.dart';
import 'package:share_your_park/views/nfc/testNfc.dart';
import 'package:share_your_park/views/screens/baseCarteMap.dart';
import 'package:share_your_park/views/screens/mapbox/listeParking.dart';
import 'package:share_your_park/views/screens/mapbox/slideListParking.dart';
import 'package:share_your_park/views/screens/register.dart';
import 'package:share_your_park/views/screens/setting/autosetting.dart';
import 'package:share_your_park/views/screens/setting/car_setting.dart';
import 'package:share_your_park/views/screens/setting/confidentialit%C3%A9.dart';
import 'package:share_your_park/views/screens/setting/infos.dart';
import 'package:share_your_park/views/screens/setting/notificatio.dart';
import 'package:share_your_park/views/screens/setting/offre.dart';
import 'package:share_your_park/views/screens/setting/parain.dart';
import 'package:share_your_park/views/screens/setting/param%C3%A8tre.dart';
import 'package:share_your_park/views/screens/setting/stat.dart';
import 'package:share_your_park/views/screens/signup.dart';

import 'package:share_your_park/views/tuto/acceuil.dart';
import 'models/user.dart' as userModel;
//import 'package:share_your_park/views/screens/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value( 
       value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(),
        home: Signup(),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userModel.User>(context);
    print(user);
    if (user == null) {
      return Register();
    } else {
      return Signup();
    }
  }
}
