import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/theming/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteInfoCard extends StatelessWidget {
  final bool isVisible;
  final String? distance;
  final String? duration;
  final VoidCallback onClose;

  const RouteInfoCard({
    super.key,
    required this.isVisible,
    required this.distance,
    required this.duration,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      bottom: isVisible ? 30.h : -200.h,
      left: 20.w,
      right: 20.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.directions_car_rounded,
                        color: MyColors.primaryColor,
                        size: 24.r,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      S.of(context).routeInfo,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey, size: 20.r),
                      onPressed: onClose,
                    ),
                  ],
                ),
                Divider(height: 24.h, thickness: 1.h),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.straighten_rounded,
                            color: Colors.grey,
                            size: 22.r,
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).distance,

                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                '$distance ${S.of(context).km}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 1.w,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                            size: 22.r,
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).expectedTime,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                '$duration ${S.of(context).mins}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
