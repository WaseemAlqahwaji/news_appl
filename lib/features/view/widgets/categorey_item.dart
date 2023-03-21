import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<IconData> icons = [
  Icons.business,
  Icons.sports_basketball,
  Icons.mouse,
  Icons.health_and_safety,
  Icons.science,
];

class CategoryItem extends RawMaterialButton {
  CategoryItem({Key? key, required VoidCallback onPressed, required int index})
      : super(
    onPressed: onPressed,
          key: key, elevation: 0.0,
          fillColor: Colors.blue,
          padding: EdgeInsets.all(5.0.w),
          shape: const CircleBorder(),
          child: Icon(
            icons[index],
            color: Colors.white,
            size: 40.0.r,
          ),
        );
}
