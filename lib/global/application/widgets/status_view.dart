import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class StatusView extends StatelessWidget {
  final String message;
  final Widget icon;
  final Color color;
  final Color textColor;

  final String? title;
  final String? confirmText;
  final Function()? onConfirmed;

  const StatusView({
    required this.message,
    required this.icon,
    required this.color,
    required this.textColor,
    this.title,
    this.confirmText,
    this.onConfirmed,
    Key? key,
  }) : super(key: key);

  factory StatusView.failure({
    required String message,
    String? title,
    String? confirmText,
    Function()? onConfirmed,
  }) {
    return StatusView(
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirmed: onConfirmed,
      icon: const Icon(UniconsLine.ban),
      color: Colors.red,
      textColor: Colors.white,
    );
  }

  factory StatusView.success({
    required String message,
    String? title,
    String? confirmText,
    Function()? onConfirmed,
  }) {
    return StatusView(
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirmed: onConfirmed,
      icon: const Icon(UniconsLine.thumbs_up),
      color: Colors.green,
      textColor: Colors.white,
    );
  }

  factory StatusView.empty({
    required String message,
    String? title,
    String? confirmText,
    Function()? onConfirmed,
  }) {
    return StatusView(
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirmed: onConfirmed,
      icon: const Icon(UniconsLine.box),
      color: Colors.transparent,
      textColor: Colors.primaries.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        backgroundColor: color,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor, displayColor: textColor),
      ),
      child: Container(
        color: color,
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          icon,
          if (title != null) Text(title!),
          Text(message),
          if (onConfirmed != null)
            OutlinedButton(
              onPressed: onConfirmed,
              child: Text(confirmText ?? 'Confirm'),
            ),
        ]),
      ),
    );
  }
}
