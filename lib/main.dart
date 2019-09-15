// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:beats_me/collection/collection.dart';
import 'package:beats_me/playback/playback.dart';
import 'package:beats_me/services/auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PageController pc = PageController(
    initialPage: 0
  );

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
            Playback(),
            Collection(),
          ],
        ),
      ),
    );
  }
}

// Widget to capture the audio
class AudioLoad extends StatefulWidget {
  createState() => _AudioLoadState();
}

class _AudioLoadState extends State<AudioLoad> {
  // Active audio file
  File _audioFile;

  // Select audio via gallery or camera
  Future<void> _pickAudio(ImageSource source) async {
    File selected = await FilePicker.pickAudio(source: source);

    setState(() {
      _audioFile = selected;
    });
  }

  // Remove audio
  void _clear() {
    setState(() => _audioFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Select audio from gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickAudio(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the audio
      body: ListView(
        children: <Widget>[
          if (_audioFile != null) ...[

            File.file(_audioFile),

            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),

            Uploader(file: _audioFile)
          ]
        ],
      ),
    );
  }
}