import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    this.hintText,
    required this.obscureText,
    this.focusNode,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
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
    return TextField(
      obscureText: widget.obscureText,
      onChanged: (value) {
        setState(() {});
      },
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: isTextNotEmpty
            ? GestureDetector(
                onTap: () {
                  widget.controller.clear();
                  FocusScope.of(context).unfocus();
                },
                child: Icon(widget.suffixIcon),
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
      onSubmitted: (_) {
        setState(() {
          isTextNotEmpty = widget.controller.text.isNotEmpty;
        });
      },
    );
  }
}
