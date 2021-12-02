import 'package:daa/Animation/hoverText.dart';
import 'package:daa/Animation/latter.dart';
import 'package:daa/views/input_page/graph_input_matrix_web.dart';
import 'package:daa/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoPageWeb extends StatefulWidget {
  @override
  _InfoPageWebState createState() => _InfoPageWebState();
}

class _InfoPageWebState extends State<InfoPageWeb> {
  String text = '';
  final String line0 = "Graph";
  final String line1 = "Coloring algorithm";
  final String line2 = "Coloring algorithm";
  final String line3 = "Visualization";
  int vertex = 4;
  bool _isdesktop = false;
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        _isdesktop = false;
      } else {
        _isdesktop = true;
      }
      return Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Stack(
        children: [
          Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Container(child: Image.network('https://miro.medium.com/max/2000/1*x_WiMjF0s6_gGRqPmDZ1Eg.png', fit: BoxFit.cover,)))),
          SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(_isdesktop ? 40 : 10, 40, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: List.generate(
                                    line0.length,
                                        (index) =>
                                      Word(
                                          line0[index],
                                          Colors.white,
                                          false, _isdesktop ? 80 : 30),
                                  ).toList(),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        line2.length,
                                            (index) =>
                                          Word(
                                              line2[index],
                                              Colors.white,
                                              false, _isdesktop ? 80 : 30),
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: List.generate(
                                    line3.length,
                                        (index) =>
                                      Word(
                                          line3[index],
                                          Colors.white,
                                          false, _isdesktop ? 80 : 30),
                                  ).toList(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),

                              DefaultTextStyle(
                                style: GoogleFonts.arvo(
                                    letterSpacing: 2,
                                    color: Color(0xff8B8B8B),
                                    fontSize: _isdesktop ? 22 : 17,
                                    fontWeight: FontWeight.w500),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HoverText(text: "To proceed select number of vertices for the graph."),
                                    HoverText(text: "App uses adjacency matrix representation to solve vertex coloring problem"),
                                    HoverText(text: "using Recursive, Backtracking and Greedy approach."),
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 40,
                            ),
                            // MyText(),
                            // ContactMe(Theme.of(context).highlightColor),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NumberPicker(minValue: 1,
                        textStyle: GoogleFonts.openSansCondensed(fontSize: 20),
                        selectedTextStyle: GoogleFonts.josefinSans(color: Theme.of(context).accentColor, fontSize: 30),
                        maxValue: 15,
                        value: vertex,
                        onChanged: (value) => setState(() => vertex = value),
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
                      MyButton(Theme.of(context).highlightColor, "PROCEED", () {Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GraphInputWeb(
                                                    vertexCount: vertex,
                                                  )),
                                        );}, Theme.of(context).accentColor),
                      SizedBox(height: 30,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),]
      ),
    );});
  }
}
