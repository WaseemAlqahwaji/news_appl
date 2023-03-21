import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings Screen",
        style: TextStyle(
          fontSize: 16.0.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
