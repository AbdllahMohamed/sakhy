import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;

Widget bankCard(
    bankName, bankBalance, color, availableBalance, iban, onClick, context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: Container(
      height: 128.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            "assets/images/card-background.PNG",
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
        gradient: RadialGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF).withOpacity(0),
          ],
          //stops: [0.9, 0.9],
          radius: 2,
        ),
      ),
      child: ElevatedButton(
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bankName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Colors.white,
                  letterSpacing: 1.8.sp,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Bank Balance",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.white,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    bankBalance,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.white,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.white,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    availableBalance,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.white,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.web,
                          color: Colors.white,
                          size: 17.w,
                        ),
                      ),
                      Text(
                        "IBAN",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        iban,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Icon(
                          Icons.copy_all,
                          color: Colors.white,
                          size: 17.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Color(color).withOpacity(0.5),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget sakhyCard(bankName, balance, onClick, context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: Container(
      height: 160.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/card-background.PNG",
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        gradient: RadialGradient(
          colors: [
            Color(0xFF5B4A1C),
            Color(0xFF302206),
          ],
          radius: 1,
        ),
      ),
      child: ElevatedButton(
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bankName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.Alpine,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/icons/sakhy.png",
                      width: 42.w,
                      height: 28.h,
                      fit: BoxFit.fill,
                      color: AppColors.Alpine,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "4343  4334  3767  3323",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFFF8BC29),
                          letterSpacing: 15.sp,
                          fontSize: 80.sp,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(7.0, 7.0),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 35, 34, 34),
                            ),
                            Shadow(
                              offset: Offset(7.0, 7.0),
                              blurRadius: 2.0,
                              color: Color.fromARGB(125, 35, 34, 34),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "EXPIRES  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColors.Alpine),
                        ),
                        Text(
                          "05 / 25",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFFF8BC29),
                              fontSize: 15.sp,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 1.0,
                                  color: Color.fromARGB(255, 35, 34, 34),
                                ),
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(125, 35, 34, 34),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.web,
                          color: AppColors.Alpine,
                          size: 20.w,
                        ),
                      ),
                      Text(
                        "Balance ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.Alpine,
                        ),
                      ),
                      Text(
                        balance,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColors.Alpine,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/settings-icon.png",
                      width: 20.w,
                      height: 19.h,
                      fit: BoxFit.fill,
                      color: AppColors.Alpine,
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, route.cardSettings),
                  ),
                ],
              ),
            ],
          ),
        ),
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget smallBankCard(bankName, color, icon, balance, onClick, context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: Container(
      height: 80.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            "assets/images/card-background.PNG",
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
        gradient: RadialGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF).withOpacity(0),
          ],
          //stops: [0.9, 0.9],
          radius: 2,
        ),
      ),
      child: ElevatedButton(
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.white,
                      letterSpacing: 1.8.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.web,
                          color: Colors.white,
                          size: 18.w,
                        ),
                      ),
                      Text(
                        "Balance ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        balance,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 24.w,
              ),
            ],
          ),
        ),
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Color(color).withOpacity(0.51),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
        ),
      ),
    ),
  );
}