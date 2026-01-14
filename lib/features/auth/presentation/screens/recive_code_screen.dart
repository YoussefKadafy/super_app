import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/core/utils/custom_button.dart';
import 'package:super_app/core/utils/custom_text_field.dart';
import 'package:super_app/core/utils/sized_box_extension.dart';

class ReciveCodeScreen extends StatefulWidget {
  const ReciveCodeScreen({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<ReciveCodeScreen> createState() => _ReciveCodeScreenState();
}

class _ReciveCodeScreenState extends State<ReciveCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  Color _buttonColor = AppColors.disabledColor;
  Color _textColor = AppColors.disableTextColor;
  bool _isButtonEnabled = false;
  final ValueNotifier<int> _counter = ValueNotifier<int>(45);
  late Timer _timer;
  bool _resendEnabled = false;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter.value > 0) {
        _counter.value--;
      } else {
        _timer.cancel();
      }
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                80.height,
                Text(
                  'Код из смс',
                  textAlign: TextAlign.center,
                  style: AppStyles.wight600Size24,
                ),
                8.height,
                Text(
                  'Отправили на + ${widget.phoneNumber}',
                  textAlign: TextAlign.center,
                  style: AppStyles.wight400Size18,
                ),
                24.height,
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  controller: _codeController,

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  onChanged: (value) {
                    final isValid = value.length == 4;

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
                  text: 'Продолжить',
                  backgroundColor: _buttonColor,
                  textColor: _textColor,
                  onPressed: _isButtonEnabled
                      ? () {
                          if (_formKey.currentState!.validate()) {
                          } else {
                            _resendEnabled = true;
                          }
                        }
                      : null,
                ),
                24.height,
                if (!_resendEnabled)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Получить код повторно можно через ',
                            textAlign: TextAlign.center,
                            style: AppStyles.wight400Size16,
                          ),
                          ValueListenableBuilder<int>(
                            valueListenable: _counter,
                            builder: (context, value, child) {
                              return Text(
                                ' $value сек',
                                textAlign: TextAlign.center,
                                style: AppStyles.wight400Size16.copyWith(
                                  color: AppColors.primary,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      24.height,
                      Text(
                        'Продолжая, вы соглашаетесь с нашей ',
                        textAlign: TextAlign.center,
                        style: AppStyles.wight500Size14.copyWith(
                          color: AppColors.disableTextColor,
                        ),
                      ),
                      Text(
                        'Политикой конфиденциальности и Условиями использования.',
                        textAlign: TextAlign.center,
                        style: AppStyles.wight500Size14.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                if (_resendEnabled)
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Получить код повторно',
                      style: AppStyles.wight400Size16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _counter.dispose();
    _codeController.dispose();
    super.dispose();
  }
}
