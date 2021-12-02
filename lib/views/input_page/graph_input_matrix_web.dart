import 'package:daa/Animation/hoverText.dart';
import 'package:daa/Animation/latter.dart';
import 'package:daa/views/homepage/homepage_web.dart';
import 'package:daa/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:responsive_builder/responsive_builder.dart';

class GraphInputWeb extends StatefulWidget {
  const GraphInputWeb({Key key, this.vertexCount}) : super(key: key);

  final int vertexCount;

  @override
  _GraphInputWebState createState() => _GraphInputWebState();
}

class _GraphInputWebState extends State<GraphInputWeb> {
  Color bgColor = Colors.black;
  List<int> displayExOh = [];
  var exampleMatrixOne = [
    [0, 1, 1, 0, 0],
    [1, 0, 1, 1, 0],
    [1, 1, 0, 1, 0],
    [0, 1, 1, 0, 1],
    [0, 0, 0, 1, 0]
  ];

  var exampleMatrixTwo = [
    [0, 1, 1, 0, 0],
    [1, 0, 1, 0, 1],
    [1, 1, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]
  ];

  bool _isdesktop = false;
  var matrix;
  String text = "3";

  final String line0 = "Fill the adjacency matrix.";
  final String line1 = "Fill the";
  final String line2 = "adjacency matrix.";
  // final String line3 = "Visualization";

  int ncolor = 2;

  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    for (int i = 0; i < widget.vertexCount * widget.vertexCount; i++) {
      displayExOh.add(0);
    }
    super.initState();
  }

  tapped(int index) {
    setState(() {
      displayExOh[index] == 0 ? displayExOh[index] = 1 : displayExOh[index] = 0;
    });
  }

  convertToMatrix() {
    matrix = List.generate(
        widget.vertexCount,
        (i) => List.generate(widget.vertexCount,
            (j) => displayExOh[j + i * widget.vertexCount]));
    print(matrix);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        _isdesktop = false;
      } else {
        _isdesktop = true;
      }
      return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          body: Stack(
              children: [
              // Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Container(child: ColorFiltered(child: Image.network('https://lh6.googleusercontent.com/hdBhnyYpD81vdJO-F7D4zPi-VO2EvtfdK2Ie-BHSdura9qFTyVCIijjJsP4x2X15OMQ8Hp4I_eqXnLVYfoqagb3K6C2KoBjoeq2Req9Jk5rE13vcPhsOwUqA5Ks6GRjrFYIGm546', fit: BoxFit.cover,),
              // colorFilter: ColorFilter.mode(Theme.of(context).accentColor, BlendMode.modulate))))),
                SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(_isdesktop ? 40.0 : 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _isdesktop ? Row(
                            children: List.generate(
                              line0.length,
                                  (index) =>
                                  Word(
                                      line0[index],
                                      Colors.white,
                                      false, 55),
                            ).toList(),
                          ) :
                          Row(
                            children: List.generate(
                              line1.length,
                                  (index) =>
                                  Word(
                                      line1[index],
                                      Colors.white,
                                      false, 30),
                            ).toList(),
                          ),
                          _isdesktop ? Container() : Row(
                            children: List.generate(
                              line2.length,
                                  (index) =>
                                  Word(
                                      line2[index],
                                      Colors.white,
                                      false, 30),
                            ).toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _isdesktop ? DefaultTextStyle(
                            style: GoogleFonts.arvo(
                                letterSpacing: 2,
                                color: Color(0xff8B8B8B),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HoverText(text: "Fill in the adjacency matrix by clicking on gird block."),
                                HoverText(text: "Select number of colors you wish to use."),
                                HoverText(text: "Indexing of matrix starts from 0, similar to 2-D array."),
                                HoverText(text: "You can skip this part and proceed with the sample matrix."),
                              ],
                            ),
                          ) :
                          DefaultTextStyle(
                            style: GoogleFonts.arvo(
                                letterSpacing: 2,
                                color: Color(0xff8B8B8B),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HoverText(text: "Fill in the\nadjacency matrix by\nclicking on gird block."),
                                HoverText(text: "Select number\nof colors you\nwish to use."),
                                HoverText(text: "Indexing of matrix\nstarts from 0,\nsimilar to 2-D array."),
                                HoverText(text: "You can skip this\npart and proceed with\nthe sample matrix."),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            MyButton(
                                Theme.of(context).highlightColor, "Sample Matrix 1", () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageWeb(
                                          vertexCount: 5,
                                          matrix: exampleMatrixOne,
                                          mcolor: 3,
                                        )
                                    ),
                                );
                              }, Theme.of(context).accentColor
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MyButton(Theme.of(context).highlightColor, "Sample Matrix 2", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageWeb(
                                      vertexCount: 5,
                                      matrix: exampleMatrixTwo,
                                      mcolor: 3,
                                    )),
                              );}, Theme.of(context).accentColor),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Flex(
                    direction: _isdesktop ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.height * 0.5,
                            child: GridView.builder(
                                itemCount:
                                    widget.vertexCount * widget.vertexCount,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: widget.vertexCount),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      tapped(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Color(0xff8B8B8B))),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            "${displayExOh[index]}",
                                            style: GoogleFonts.josefinSans(
                                                color: Theme.of(context).accentColor,
                                                fontSize: 40),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Column(
                          children: [
                            HoverText(text: "Select number of colors"),
                            SizedBox(height: 20),
                            NumberPicker(minValue: 1,
                              textStyle: GoogleFonts.openSansCondensed(fontSize: 20),
                              selectedTextStyle: GoogleFonts.josefinSans(color: Theme.of(context).accentColor, fontSize: 30),
                              maxValue: 7,
                              value: ncolor,
                              onChanged: (value) => setState(() => ncolor = value),
                              axis: Axis.horizontal,
                              haptics: true,
                                decoration: BoxDecoration(border: Border.all(color: Color(0xff8B8B8B), width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  color: Color(0xff8B8B8B).withOpacity(0.2),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Color(0xff8B8B8B).withOpacity(0.2),
                                      offset: new Offset(5.0, 3.0),
                                      blurRadius: 0.0,
                                    ),
                                  ],)
                            ),
                            SizedBox(height: 45),
                            MyButton(Theme.of(context).highlightColor, "PROCEED", () {
                              convertToMatrix();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageWeb(
                                      vertexCount: widget.vertexCount,
                                      matrix: matrix,
                                      mcolor: ncolor,
                                    )),
                              );
                            }, Theme.of(context).accentColor),
                            ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      ));
    });
  }
}
