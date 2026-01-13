import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/core/utils/custom_button.dart';
import 'package:super_app/core/utils/custom_text_field.dart';
import 'package:super_app/core/utils/sized_box_extension.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color _buttonColor = AppColors.disabledColor;
  Color _textColor = AppColors.disableTextColor;
  bool _isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
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
              CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,

                onChanged: (value) {
                  final isValid = value.length == 10;

                  setState(() {
                    _isButtonEnabled = isValid;
                    _buttonColor = AppColors.primary;
                    _textColor = isValid
                        ? Colors.white
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
                        if (_formKey.currentState!.validate()) {}
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
