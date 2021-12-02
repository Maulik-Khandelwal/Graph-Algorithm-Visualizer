import 'package:daa/views/input_page/graph_input_matrix_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  Color fontColor;
  String text;
  Function onTap;
  Color bgColor;

  MyButton(this.fontColor, this.text, this.onTap, this.bgColor);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
  Color coolor = Colors.white.withOpacity(0);
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 220), vsync: this);
    animation = Tween<double>(begin: 0, end: 188).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            coolor = widget.bgColor;
          });
        }
      });
    // CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
        widget.onTap
      ,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            widget.fontColor = Theme.of(context).scaffoldBackgroundColor;
          });
          animationController.forward();
        },
        onExit: (event) {
          setState(() {
            coolor = coolor.withOpacity(0);
            widget.fontColor = Theme.of(context).highlightColor;
          });
          animationController.reverse();
        },
        child: Container(
          height: 50,
          width: 190,
          // color: coolor,
          decoration: BoxDecoration(
            // gradient: gradient,
            color: coolor,
            border: Border.all(color: widget.bgColor, width: 1),
          ),
          child: Stack(children: [
            InnerContainer(
              width: animation, bg: widget.bgColor,
            ),
            Center(
              child: Text(
                widget.text,
                style: GoogleFonts.titilliumWeb(
                    fontWeight: FontWeight.w600,
                    color: widget.fontColor,
                    letterSpacing: 2,
                    fontSize: 15),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class InnerContainer extends StatelessWidget {
  final Animation<double> width;
  final Color bg;
  const InnerContainer({Key key, this.width, this.bg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: width,
      builder: (context, child) {
        return ClipPath(
          clipper: TrapeziumClipper(),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 49,
            width: width.value,
            color: bg,
          ),
        );
      },
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - 15, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}
