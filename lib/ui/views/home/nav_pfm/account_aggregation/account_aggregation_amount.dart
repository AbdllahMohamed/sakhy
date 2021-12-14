import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AccountAggregatorAmount extends StatelessWidget {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Styles.headingText("Account Aggregator"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.transparentDivider(),
            Styles.transparentDivider(),
            formField(
              TextInputType.number,
              false,
              _amountController,
              true,
              Icons.monetization_on_outlined,
              context,
              "Amount SAR",
            ),
            Styles.transparentDivider(),
            Styles.headingText("Choose option to pay :"),
            Styles.transparentDivider(),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4F4F4F),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Option ${index + 1}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: AppColors.Alpine),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SNB",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: Colors.white),
                              ),
                              Text(
                                "100 SAR",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}