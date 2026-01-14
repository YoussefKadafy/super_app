import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/core/utils/custom_button.dart';
import 'package:super_app/features/auth/presentation/widgets/phone_text_field.dart';
import 'package:super_app/core/utils/sized_box_extension.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  final TextEditingController _phoneController = TextEditingController();
  Color _buttonColor = AppColors.disabledColor;
  Color _textColor = AppColors.disableTextColor;
  bool _isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              'Номер телефона',
              textAlign: TextAlign.center,
              style: AppStyles.wight600Size24,
            ),
            24.height,
            PhoneTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,

              onChanged: (value) {
                final isValid = value.length == 10;

                setState(() {
                  _isButtonEnabled = isValid;
                  _buttonColor = AppColors.primary;
                  _textColor = isValid
                      ? Colors.black
                      : AppColors.disableTextColor;
                });
              },
            ),

            24.height,
            CustomButton(
              text: 'Получить код',
              backgroundColor: _buttonColor,
              textColor: _textColor,
              onPressed: _isButtonEnabled
                  ? () {
                      context.pushNamed(
                        AppRoutes.reciveCode,
                        extra: _phoneController.text,
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
