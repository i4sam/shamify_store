import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;

  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    this.hintText,
    required this.obscureText,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool isTextNotEmpty;

  @override
  void initState() {
    super.initState();
    isTextNotEmpty = widget.controller.text.isNotEmpty;
    widget.controller.addListener(updateTextNotEmpty);
  }

  @override
  void dispose() {
    widget.controller.removeListener(updateTextNotEmpty);
    super.dispose();
  }

  void updateTextNotEmpty() {
    if (mounted) {
      setState(() {
        isTextNotEmpty = widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: isTextNotEmpty
            ? GestureDetector(
                onTap: () {
                  widget.controller.clear();
                  if (widget.focusNode != null) {
                    widget.focusNode!.unfocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                },
                child: widget.suffixIcon,
              )
            : null,
        filled: true,
      ),
      onTap: () {
        setState(() {
          isTextNotEmpty = widget.controller.text.isNotEmpty;
        });
      },
      onEditingComplete: () {
        setState(() {
          isTextNotEmpty = widget.controller.text.isNotEmpty;
        });
      },
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
    );
  }
}
