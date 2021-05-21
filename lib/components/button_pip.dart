import 'package:flutter/material.dart';

enum ButtonPipState { disable, enable, loading }

class ButtonPip extends StatelessWidget {
  const ButtonPip({
    required this.title,
    required this.onClick,
    Key? key,
    this.margin = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    this.height = 50,
    this.width = double.maxFinite,
    this.enable = ButtonPipState.enable,
    this.icon = '',
  }) : super(key: key);

  final String title;
  final VoidCallback onClick;
  final EdgeInsetsGeometry margin;
  final double height;
  final double width;
  final ButtonPipState enable;
  final String icon;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        margin: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.transparent,
          ),
          onPressed: enable == ButtonPipState.enable
              ? onClick
              : enable == ButtonPipState.loading
                  ? (){}
                  : null,
          child: enable == ButtonPipState.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(title),
        ),
      );
}
