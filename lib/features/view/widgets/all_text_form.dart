import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/components.dart';
import '../screens/search_screen/search_screen.dart';

class AllTextForm {
  static TextFormField dTextFormField(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return TextFormField(
      readOnly: true,
      onTap: () {
        focusNode.unfocus();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(focusNode);
        });
        navigateTo(
          context,
          const SearchScreen(),
        );
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
            width: 0.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.black,
        ),
        hintText: "Search",
      ),
    );
  }

  static TextFormField sTextFormField(
          {required void Function(String) onChange}) =>
      TextFormField(
        onChanged: onChange,
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0.r),
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0.r),
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
          hintText: "Search",
        ),
      );
}
