// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:beats_me/collection/collection.dart';
import 'package:beats_me/playback/playback.dart';
import 'package:beats_me/services/auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PageController pc = PageController();

  @override
  MyApp() {
    authService.anonLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: pc,
          children: <Widget>[
            Collection(),
            Playback()
          ],
        ),
      ),
    );
  }
}
