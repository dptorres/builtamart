import 'package:flutter/material.dart';

import '../../../constants/constants_colors.dart';

class BuiltaMartButton extends StatelessWidget {
  BuiltaMartButton({
    required this.onPressed,
    required this.label,
    this.isEnabled = true,
    this.rounded = true,
    this.backgroundColor = BuiltaMartColors.green,
    this.fontColor = BuiltaMartColors.gray,
    this.borderColor = BuiltaMartColors.green,
    this.borderRadius = 8.0,
    this.borderWidth = 2.0,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 28.0,
    this.btnFontSize = 14.0,
    this.selectedFontWeight = FontWeight.w600,
    this.selectedFontStyle = FontStyle.normal,
    this.isCentered = false,
    this.icon = '',
  });

  final VoidCallback onPressed;
  final bool isEnabled;
  final String label;
  final bool rounded;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final double btnFontSize;
  final FontWeight selectedFontWeight;
  final FontStyle selectedFontStyle;
  final bool isCentered;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : () {},
      child: Container(
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: isEnabled ? borderColor.withOpacity(1) : borderColor.withOpacity(0.3), width: borderWidth),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: isCentered ? 0 : horizontalPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != '') Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          icon,
                          width: 14,
                          height: 14,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: selectedFontWeight,
                    color: isEnabled ? fontColor.withOpacity(1) : fontColor.withOpacity(0.3),
                    fontStyle: selectedFontStyle,
                    fontSize: btnFontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
