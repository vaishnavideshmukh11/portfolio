import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaishnavi116/provider/dark_theme_provider.dart';
import 'package:vaishnavi116/utils/styles.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 30));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 52.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: !themeChange.darkTheme ? kDarkColor : Colors.amber[600],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: !themeChange.darkTheme
                    ? Icon(
                        Icons.wb_sunny,
                        color: Colors.orangeAccent,
                      )
                    : Icon(
                        Icons.brightness_3,
                        color: kDarkColor,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
