import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextField(
  BuildContext context, {
  bool? enabled,
  IconData? icon,
  String? title,
  Widget? iconTrailing,
  TextEditingController? controller,
  List<TextInputFormatter>? formatter,
  TextCapitalization? textCapitalization,
  bool? readOnly,
  TextInputType? inputType,
  bool? obscureText,
  Function()? onClick,
}) {
  //
  return Card(
    elevation: 1,
    child: TextFormField(
      enabled: enabled ?? true,
      onTap: onClick,
      controller: controller,
      inputFormatters: formatter ?? [],
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      readOnly: readOnly ?? false,
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.light ? null : Colors.grey,
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                size: 24,
              )
            : null,
        suffixIcon: iconTrailing,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
