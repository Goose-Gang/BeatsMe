import 'package:beats_me/collection/cards.dart';
import 'package:beats_me/collection/sheet.dart';
import 'package:beats_me/collection/tabs.dart';
import 'package:beats_me/services/auth.dart';
import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
          SpecialBottomSheet()
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Beats Me',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
