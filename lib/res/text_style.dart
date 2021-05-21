// Flutter imports:
import 'package:flutter/material.dart';


//Font styles base
TextStyle _text = const TextStyle(
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

//Light 300
TextStyle textLight = _text.copyWith(fontWeight: FontWeight.w300);

//Regular 400
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle textRegular11 = textRegular.copyWith(fontSize: 11);
TextStyle textRegular12 = textRegular.copyWith(fontSize: 12);
TextStyle textRegular14 = textRegular.copyWith(fontSize: 14);
TextStyle textRegular16 = textRegular.copyWith(fontSize: 16);
TextStyle textRegular18 = textRegular.copyWith(fontSize: 18);
TextStyle textRegular20 = textRegular.copyWith(fontSize: 20);
TextStyle textRegular24 = textRegular.copyWith(fontSize: 24);
TextStyle textRegular28 = textRegular.copyWith(fontSize: 28);
TextStyle textRegular14Grey = textRegular14.copyWith(color: Colors.grey.shade400);

//Medium 500
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500);
TextStyle textMedium20 = textMedium.copyWith(fontSize: 20);
TextStyle textMedium13 = textMedium.copyWith(fontSize: 13);
TextStyle textMedium14 = textMedium.copyWith(fontSize: 14);
TextStyle textMedium28 = textMedium.copyWith(fontSize: 28);
TextStyle textMedium14Grey = textMedium14.copyWith(color: Colors.grey.shade400);

//Bold 600
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.bold);
TextStyle textBold13 = textBold.copyWith(fontSize: 13);
