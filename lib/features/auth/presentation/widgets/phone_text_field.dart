import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;

  const PhoneTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(() => setState(() {}));
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _controller.text.isEmpty;
    final bool isFocused = _focusNode.hasFocus;

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType ?? TextInputType.phone,
      validator: widget.validator,
      onChanged: widget.onChanged,
      enableInteractiveSelection: false,
      enabled: widget.enabled,
      cursorColor: Colors.black,
      cursorWidth: 1.5.w,
      maxLines: widget.maxLines,
      style: AppStyles.wight600Size16,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],

      decoration: InputDecoration(
        labelText: widget.labelText,

        /// 🔹 Prefix logic
        prefix: (_controller.text.isNotEmpty || isFocused)
            ? Text(
                '+',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: (isEmpty) ? Colors.grey[400] : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,

        hintText: !isFocused ? '+7' : null,
        hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey[400]),
        labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.primary),

        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 16.w),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
