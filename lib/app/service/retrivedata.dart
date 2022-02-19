import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class DataFromFirebase {
  Future<String> getData() async {
    var res = await firestoreInstance.collection('data').doc('json').get();

    getXStorage.write('firebaseDataX', res.data()!['main'].toString());
    log(res.data()!['main'].toString());
    return res.data()!['main'].toString();
  }
}

String getVideoID(String url) {
  var imgURL = url;
  imgURL = imgURL.toString().split('v=')[1];
  imgURL = imgURL.toString().split('&')[0];
  return imgURL;
}

final firestoreInstance = FirebaseFirestore.instance;
var getXStorage = GetStorage();
const bgColor = Color(0xffFFFFF0);
var rgPadding = 16.0;
var miniPadding = 5.0;
const bgRed = Color(0xffFB1414);
const red = Color(0xffAF0909);
void launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
