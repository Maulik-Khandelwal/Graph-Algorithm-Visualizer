import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class Word extends StatefulWidget {
  final String word;
  Color color;
  bool heading;
  double fontSize;

  Word(this.word, this.color, this.heading, this.fontSize);
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  // Color color = widget.color;
  int flag = 1;
  double fontsize = 50;

  @override
  void initState() {
    super.initState();
    // color = Theme.of(context).accentColor;
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1000,
        ),
        value: 1,
        lowerBound: 0.5);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
      reverseCurve: Curves.easeInOutBack,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          fontsize = 60;
        } else if (sizingInformation.isTablet)
          fontsize = 50;
        else
          fontsize = 32;

        return GestureDetector(
          onTapDown: (t) {
            animationController
              ..reset()
              ..forward();
            setState(() {
              widget.color = Theme.of(context).highlightColor;
            });
          },
          onTapUp: (t) {
            setState(() {
              widget.color = flag == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor;
              widget.color == Theme.of(context).accentColor
                  ? flag = 1
                  : flag = 0;
            });
          },
          child: MouseRegion(
            onEnter: (event) {
              animationController
                ..reset()
                ..forward();
              setState(() {
                widget.heading
                    ? widget.color = Theme.of(context).primaryColor
                    : widget.color = Theme.of(context).accentColor;
              });
            },
            onExit: (event) {
              setState(() {
                widget.heading
                    ? widget.color = Theme.of(context).accentColor
                    : widget.color = Theme.of(context).highlightColor;
              });
            },
            child: ScaleTransition(
              scale: animation,
              child:
              // widget.word.text
              //     .color(widget.color)
              //     .textStyle(GoogleFonts.viga())
              //     .maxLines(2)
              //     .size(context.isMobile ? 50 : 80)
              //     .heading ? b
              //     .make(),
              Text(
                widget.word,
                maxLines: 2,
                style: widget.heading
                    ? GoogleFonts.russoOne(
                    fontSize: 80,
                    color: widget.color,
                    fontWeight: FontWeight.w200)
                    : GoogleFonts.russoOne(
                    fontSize: widget.fontSize,
                    color: widget.color,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        );
      },
    );
  }
}
