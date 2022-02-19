import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase/firebase.dart' as WebFirebase;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:probashtotthokandro/app/service/retrivedata.dart';
import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WebFirebase.initializeApp(
      apiKey: "AIzaSyB-8bWkouH1e_EuiOBJfd_JWwcNlMoi-4Q",
      authDomain: "probash-tottho-kandro.firebaseapp.com",
      projectId: "probash-tottho-kandro",
      storageBucket: "probash-tottho-kandro.appspot.com",
      messagingSenderId: "518999322094",
      appId: "1:518999322094:web:51aeba74935ff9136d72ff",
      measurementId: "G-5KDESC8CQ8");

  await GetStorage.init();
  await DataFromFirebase().getData();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
