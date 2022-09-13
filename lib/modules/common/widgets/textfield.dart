import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class YPTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputFormatter? textInputFormatter;
  final ValueChanged<String>? onChanged;
  String? placeholder;
  double? height;
  int? lengthLimit;
  bool? multiline;
  bool? optional;
  TextInputType? inputType;
  bool? enable = true;
  bool? obscureText = false;
  Color? backgroundColor = Colors.white;
  Color? focusedBorderColor;
  Color? borderColor;
  TextStyle? hintStyle;
  FocusNode? focus;
  bool? showCursor = true;
  bool? readOnly = false;
  bool? showVisibleToggle = false;

  //bool? visible = false;

  YPTextField(
      {Key? key,
      this.title,
      this.placeholder,
      this.controller,
      this.textInputFormatter,
      this.onChanged,
      this.lengthLimit,
      this.multiline,
      this.optional,
      this.inputType,
      this.enable,
      this.obscureText,
      this.backgroundColor,
      this.focusedBorderColor,
      this.borderColor,
      this.hintStyle,
      this.focus,
      this.showCursor,
      this.readOnly,
      this.showVisibleToggle,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> textInputFormatters = [];
    if (textInputFormatter != null) {
      textInputFormatters.add(textInputFormatter!);
    }
    if (lengthLimit != null) {
      textInputFormatters.add(LengthLimitingTextInputFormatter(lengthLimit));
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          (title != null)
              ? Row(
                  children: [
                    Text(
                      title ?? "",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    (optional != null && optional!)
                        ? Text("optional",
                            style: Theme.of(context).textTheme.displayMedium)
                        : const SizedBox()
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: _textField(context, textInputFormatters),
            height: _getHeight().toDouble(),
          ),
        ]);
  }

  _getHeight() {
    if (height != null) {
      return height;
    }
    if (multiline ?? false) {
      return 80;
    } else {
      return 40;
    }
  }

  _textField(
      BuildContext context, List<TextInputFormatter> textInputFormatters) {
    return TextField(
      showCursor: showCursor,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      enabled: enable,
      keyboardType: inputType ?? TextInputType.text,
      maxLines: multiline ?? false ? 100 : 1,
      inputFormatters: textInputFormatters,
      controller: controller,
      focusNode: focus,
      decoration: InputDecoration(
          // suffixIcon: (showVisibleToggle == true)
          //     ? GestureDetector(
          //         child: Padding(
          //           child: SvgPicture.asset(
          //             (obscureText == true)
          //                 ? AppImages.icPasswordVisible
          //                 : AppImages.icPasswordInvisible,
          //           ),
          //           padding: const EdgeInsets.all(AppSizes.spacingS),
          //         ),
          //         onTap: () {
          //           if (obscureText != null) {
          //             obscureText = !obscureText!;
          //             (context as Element).markNeedsBuild();
          //           }
          //         },
          //       )
          //     : null,
          hintText: placeholder,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.displaySmall,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          fillColor: enable ?? true
              ? (backgroundColor ?? Colors.white)
              : Theme.of(context).shadowColor,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).shadowColor,
              ),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).shadowColor,
              ),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: focusedBorderColor ?? Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
