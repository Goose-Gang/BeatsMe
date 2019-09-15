import 'package:flutter/material.dart';
import 'dart:math';

// timer
// current length, color, set of emojis/comments
// could also keep it in a map or list and access them by time 

class Playback extends StatefulWidget {

  @override
  PlaybackState createState() => PlaybackState();
}
class PlaybackState extends State<Playback>{
  // sample lengths for testing
  List<double> lengthRatios = <double>[
    0.0527, 0.612, 0.663, 0.597, 0.525, 0.297, 0.289, 0.546, 0.715, 0.635, 0.62, 0.431, 0.282, 0.305, 0.604, 0.779, 0.874, 0.848, 0.897,0.753, 0.888, 0.796, 0.815, 0.742, 0.866, 0.788, 0.798, 0.759, 0.52, 0.524, 0.577, 0.533, 0.593, 0.35, 0.628, 0.47, 0.636, 0.638, 0.615, 0.654, 0.431, 0.867, 0.856, 0.845, 0.788, 0.844, 0.756, 0.807, 0.816, 0.698, 0.85, 0.831, 0.726, 0.753, 0.607, 0.334, 0.408, 0.524, 0.588, 0.646, 0.545, 0.681, 0.746, 0.739, 0.927, 0.636, 0.505, 0.536, 0.875, 0.748, 0.979, 0.767, 0.733, 0.862, 0.892, 0.812, 0.802,0.995, 0.925, 0.976, 0.767, 0.76, 0.688, 0.746, 0.755, 0.689, 0.638, 0.661, 0.807, 0.659, 0.741, 0.763, 0.785, 0.564, 0.808, 0.832, 0.914, 0.824, 0.852, 0.868, 0.746, 0.888, 0.727, 0.784, 0.851, 0.794, 0.753, 0.683, 0.353, 0.232, 0.253, 0.342, 0.297, 0.288, 0.512, 0.82, 0.79, 0.769, 0.663, 0.624, 0.615, 0.808, 0.811, 0.815, 0.918, 0.616, 0.722, 0.857, 0.717, 0.557, 0.637, 0.591, 0.596, 0.481, 0.734, 0.76, 0.816, 0.721, 0.789, 0.914, 0.743, 0.999, 0.836, 0.89, 0.872, 0.812, 0.866, 0.778, 0.883, 0.871, 0.871, 0.928, 0.916, 0.88, 0.979, 0.91, 0.89, 0.864, 0.918, 1.0, 0.826, 0.894, 0.84, 0.768, 0.865, 0.868, 0.805, 0.841, 0.826, 0.884, 0.837, 0.823, 0.859, 0.874, 0.802, 0.818, 0.804, 0.86, 0.918, 0.889, 0.898, 0.877, 0.897, 0.845,0.884, 0.858, 0.902, 0.836, 0.484, 0.181, 0.163, 0.379, 0.286, 0.357, 0.207, 0.0111, 0.0004, 0.0, 0.0
  ];
  // hardcoded color codes
  List<int> colorCodes = <int> [
    0xFFF44336,0xFFFFEBEE,0xFFFFCDD2,0xFFEF9A9A,0xFFE57373,0xFFEF5350,0xFFF44336,0xFFE53935,0xFFD32F2F,0xFFC62828,0xFFB71C1C,0xFFFF8A80,0xFFFF5252,0xFFFF1744,0xFFD50000,0xFFE91E63,0xFFFCE4EC,0xFFF8BBD0,0xFFF48FB1,0xFFF06292,0xFFEC407A,0xFFE91E63,0xFFD81B60,0xFFC2185B,0xFFAD1457,0xFF880E4F,0xFFFF80AB,0xFFFF4081,0xFFF50057,0xFFC51162,0xFF9C27B0,0xFFF3E5F5,0xFFE1BEE7,0xFFCE93D8,0xFFBA68C8,0xFFAB47BC,0xFF9C27B0,0xFF8E24AA,0xFF7B1FA2,0xFF6A1B9A,0xFF4A148C,0xFFEA80FC,0xFFE040FB,0xFFD500F9,0xFFAA00FF,0xFF673AB7,0xFFEDE7F6,0xFFD1C4E9,0xFFB39DDB,0xFF9575CD,0xFF7E57C2,0xFF673AB7,0xFF5E35B1,0xFF512DA8,0xFF4527A0,0xFF311B92,0xFFB388FF,0xFF7C4DFF,0xFF651FFF,0xFF6200EA,0xFF3F51B5,0xFFE8EAF6,0xFFC5CAE9,0xFF9FA8DA,0xFF7986CB,0xFF5C6BC0,0xFF3F51B5,0xFF3949AB,0xFF303F9F,0xFF283593,0xFF1A237E,0xFF8C9EFF,0xFF536DFE,0xFF3D5AFE,0xFF304FFE,0xFF2196F3,0xFFE3F2FD,0xFFBBDEFB,0xFF90CAF9,0xFF64B5F6,0xFF42A5F5,0xFF2196F3,0xFF1E88E5,0xFF1976D2,0xFF1565C0,0xFF0D47A1,0xFF82B1FF,0xFF448AFF,0xFF2979FF,0xFF2962FF,0xFF03A9F4,0xFFE1F5FE,0xFFB3E5FC,0xFF81D4FA,0xFF4FC3F7,0xFF29B6F6,0xFF03A9F4,0xFF039BE5,0xFF0288D1,0xFF0277BD,0xFF01579B,0xFF80D8FF,0xFF40C4FF,0xFF00B0FF,0xFF0091EA,0xFF00BCD4,0xFFE0F7FA,0xFFB2EBF2,0xFF80DEEA,0xFF4DD0E1,0xFF26C6DA,0xFF00BCD4,0xFF00ACC1,0xFF0097A7,0xFF00838F,0xFF006064,0xFF84FFFF,0xFF18FFFF,0xFF00E5FF,0xFF00B8D4,0xFF009688,0xFFE0F2F1,0xFFB2DFDB,0xFF80CBC4,0xFF4DB6AC,0xFF26A69A,0xFF009688,0xFF00897B,0xFF00796B,0xFF00695C,0xFF004D40,0xFFA7FFEB,0xFF64FFDA,0xFF1DE9B6,0xFF00BFA5,0xFF4CAF50,0xFFE8F5E9,0xFFC8E6C9,0xFFA5D6A7,0xFF81C784,0xFF66BB6A,0xFF4CAF50,0xFF43A047,0xFF388E3C,0xFF2E7D32,0xFF1B5E20,0xFFB9F6CA,0xFF69F0AE,0xFF00E676,0xFF00C853,0xFF8BC34A,0xFFF1F8E9,0xFFDCEDC8,0xFFC5E1A5,0xFFAED581,0xFF9CCC65,0xFF8BC34A,0xFF7CB342,0xFF689F38,0xFF558B2F,0xFF33691E,0xFFCCFF90,0xFFB2FF59,0xFF76FF03,0xFF64DD17,0xFFCDDC39,0xFFF9FBE7,0xFFF0F4C3,0xFFE6EE9C,0xFFDCE775,0xFFD4E157,0xFFCDDC39,0xFFC0CA33,0xFFAFB42B,0xFF9E9D24,0xFF827717,0xFFF4FF81,0xFFEEFF41,0xFFC6FF00,0xFFAEEA00,0xFFFFEB3B,0xFFFFFDE7,0xFFFFF9C4,0xFFFFF59D,0xFFFFF176,0xFFFFEE58,0xFFFFEB3B,0xFFFDD835,0xFFFBC02D,0xFFF9A825,0xFFF57F17,0xFFFFFF8D,0xFFFFFF00,0xFFFFEA00,0xFFFFD600,0xFFFFC107,0xFFFFF8E1,0xFFFFECB3,0xFFFFE082,0xFFFFD54F,0xFFFFCA28,0xFFFFC107,0xFFFFB300,0xFFFFA000,0xFFFF8F00,0xFFFF6F00,0xFFFFE57F,0xFFFFD740,0xFFFFC400,0xFFFFAB00,0xFFFF9800,0xFFFFF3E0,0xFFFFE0B2,0xFFFFCC80,0xFFFFB74D,0xFFFFA726,0xFFFF9800,0xFFFB8C00,0xFFF57C00,0xFFEF6C00,0xFFE65100,0xFFFFD180,0xFFFFAB40,0xFFFF9100,0xFFFF6D00,0xFFFF5722,0xFFFBE9E7,0xFFFFCCBC,0xFFFFAB91,0xFFFF8A65,0xFFFF7043,0xFFFF5722,0xFFF4511E,0xFFE64A19,0xFFD84315,0xFFBF360C,0xFFFF9E80,0xFFFF6E40,0xFFFF3D00,0xFFDD2C00,0xFF795548,0xFFEFEBE9,0xFFD7CCC8,0xFFBCAAA4,0xFFA1887F,0xFF8D6E63,0xFF795548,0xFF6D4C41,0xFF5D4037,0xFF4E342E,0xFF3E2723,0xFF9E9E9E,0xFFFAFAFA,0xFFF5F5F5,0xFFEEEEEE,0xFFE0E0E0,0xFFBDBDBD,0xFF9E9E9E,0xFF757575,0xFF616161,0xFF424242,0xFF212121,0xFF607D8B,0xFFECEFF1,0xFFCFD8DC,0xFFB0BEC5,0xFF90A4AE,0xFF78909C,0xFF607D8B,0xFF546E7A,0xFF455A64,0xFF37474F,0xFF263238,
  ];
  int randomColorIndex;
  ScrollController scrollController;
  String displayTime;
  bool isAutoScrolling;
  double barRowWidth;
  double dividerWidth;

  @override
  void initState() {
    super.initState();
    randomColorIndex = new Random().nextInt(colorCodes.length);
    scrollController = new ScrollController();
    displayTime = ""; // actually the time stamp
    isAutoScrolling = false;
    barRowWidth = 40; // total = divider + container?
    dividerWidth = 10;
  }
  // thickness is 20 
  // 20 px = 1 second
  startAutoScroll(){
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        curve: Curves.linear, duration: Duration(milliseconds: ((1000/30)*(scrollController.position.maxScrollExtent - scrollController.offset)).toInt()));
  }

  toggleAutoScroll(){
      setState(() { 
        isAutoScrolling = !isAutoScrolling;
      });
      if(isAutoScrolling) { startAutoScroll();
      } else{ scrollController.jumpTo(scrollController.offset);}
  }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'thank mr goose',
        home: Scaffold(
          appBar: AppBar(
            title: Text(displayTime),
          ),
          body: 
          NotificationListener<ScrollNotification>(
            child:
            ListView.separated(
              controller: scrollController,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.white,
                height: dividerWidth
              ),
              itemCount: lengthRatios.length,
              itemBuilder: (BuildContext context, int index) {
                return  BarRow(
                  length: lengthRatios[index] * MediaQuery.of(context).size.width /2,
                  color: Color(colorCodes[(randomColorIndex + index) % colorCodes.length]),
                  width: barRowWidth - dividerWidth,
                  timestamp: index,
                );
              }
            ),
            onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  setState(() { 
                    double seconds = scrollController.position.pixels/barRowWidth;
                    if(seconds > 60) {
                      displayTime = (seconds.toInt()~/60).toString() + ":" + (seconds.toInt()%60).toString();
                    } else {
                      displayTime = (seconds.toInt()%60).toString();
                    }
                  });
                } else if (scrollNotification is ScrollEndNotification) {
                  startAutoScroll();
                }
              },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: toggleAutoScroll,
            child: Icon(Icons.add)
          ),
        ),
      );

  }
}


class BarRow extends StatefulWidget {
  final double length;
  final Color color;
  final double width;
  final int timestamp; // the time stamp in seconds. 
  const BarRow({Key key, this.length, this.color, this.timestamp, this.width}): super(key: key);
  @override
  BarRowState createState() => BarRowState(length: this.length, color: this.color, timestamp: this.timestamp, width: this.width);
}

class BarRowState extends State<BarRow> {
  double length;
  Color color;
  int timestamp;
  double width;
  BarRowState({this.length, this.color, this.timestamp, this.width});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          GestureDetector(
              onTap: () { // changes the color to a random color, for testing
                Random r = new Random();
                setState(() {
                  color = Color.fromARGB(255, 1-r.nextInt(800), 1-r.nextInt(800), 1-r.nextInt(800));   
              });
              },
             child:
            Container(
              height: this.width,
              width: widget.length,
              
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, this.color]),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(0.5, 0.2),
                    blurRadius: 0.5,
                    spreadRadius: 0.5
                  )
                ],
                borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(5.0),
                      topRight: const Radius.circular(5.0)
                ),
              ),
              ),
            ),
          
          Container(
            height: this.width,
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
          ),
        ]
      
    );
  }
}

