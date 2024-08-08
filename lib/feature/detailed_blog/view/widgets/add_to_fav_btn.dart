import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';

class AddToFavBtn extends StatefulWidget {
 const AddToFavBtn(
      {super.key,
      required this.onTap,
      required this.label,
      required this.icon,
      this.color,
      this.height,
      this.width,
      this.radius});
  final Function() onTap;
  final String label;
  final Icon icon;
  final Color? color;
  final double? height;
  final double? width;
  final double? radius;

  @override
  State<AddToFavBtn> createState() => _AddToFavBtnState();
}

class _AddToFavBtnState extends State<AddToFavBtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(size.height * 0.02),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.color ?? AppColorsTheme.dark().bgInput,
            borderRadius: BorderRadius.circular(widget.radius ?? 7)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.icon,
              Text(
                widget.label,
                style: AppTypography.main()
                    .defaultText
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
