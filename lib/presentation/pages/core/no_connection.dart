import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/infrastructure/services/connectivity.dart';
import 'package:kitaab/presentation/component/custom_button.dart';
import 'package:kitaab/presentation/component/easy_loading.dart';
import 'package:kitaab/presentation/routes/routes.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  // Future<void> retry() async {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorPage()));
  //   EasyLoading.show();
  //   final result = await ConnectivityX().create();
  //   if (result) {
  //     Navigator.pushAndRemoveUntil(
  //         context, AppRoutes.main(index: 0), (route) => false);
  //     EasyLoading.dismiss();
  //     return;
  //   } else {
  //     return EasyLoading.dismiss();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, c) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: icons.noInternetO.svg(width: 200.w, height: 144.h),
              ),
              16.verticalSpace,
              Text(
                semanticsLabel: 'connection_is_afk'.tr(),
                'connection_is_afk'.tr(),
                style: fonts.paragraphP2Regular.copyWith(fontSize: 18.sp),
              ),
              10.verticalSpace,
              Text(
                semanticsLabel: 'no_connection_body'.tr(),
                'no_connection_body'.tr(),
                textAlign: TextAlign.center,
                style: fonts.headingH6SmallSemiBold,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  // retry();
                },
                backgroundColor: colors.primary500,
                titleColor: colors.shade0,
                verticalPadding: 10.h,
                title: 'retry'.tr(),
              ),
            ],
          ),
        ),
      );
    });
  }
}