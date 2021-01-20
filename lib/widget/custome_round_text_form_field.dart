import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:shopping_app/utills/size_config.dart';
import 'package:shopping_app/utills/imports.dart';

//TODO Sean customization
class CustomRoundedTextFormField extends StatefulWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String labelText;
  final String hintText;
  final Function onChanged;
  final Function validator;
  final Function onTap;
  final TextEditingController controller;
  final String initialValue;
  final bool showCursor;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool userCanType;
//  final List<TextInputFormatter> inputFormatters;
  final Function onSubmitted;
  final int maxLength;
  final FocusNode focusNode;
  final bool readOnly;

  CustomRoundedTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onTap,
    this.controller,
    this.initialValue,
    this.showCursor,
    this.obscureText,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.userCanType = true,
//    this.inputFormatters,
    this.onSubmitted,
    this.maxLength,
    this.focusNode,
    this.readOnly, List<TextInputFormatter> inputFormatters,
  });

  @override
  _CustomRoundedTextFormFieldState createState() =>
      _CustomRoundedTextFormFieldState();
}

class _CustomRoundedTextFormFieldState
    extends State<CustomRoundedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.all(0.0),
          hintText: widget.hintText != null ? widget.hintText : '',
          hintStyle: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).hintColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.sizes(6))),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.sizes(6))),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        controller: widget.controller,
        showCursor: widget.showCursor,
        cursorColor: Colors.grey,
        obscureText: widget.obscureText == null ? false : widget.obscureText,
        obscuringCharacter: "*",
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        style: Theme.of(context).textTheme.headline4,
        autocorrect: false,
        enableInteractiveSelection: widget.userCanType,
//        inputFormatters: widget.inputFormatters,
        onFieldSubmitted: (_) {},
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly ?? false,
      ),
    );
  }
}
