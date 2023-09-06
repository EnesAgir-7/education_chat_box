import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:StudyWiz/constants/constants.dart';
import 'package:StudyWiz/services/assets_manager.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';


class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
    this.shouldAnimate = false,
  });

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatIndex == 0 ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          right: chatIndex == 0 ? 8 : 52,
          left: chatIndex == 1 ? 8 : 52,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: chatIndex == 0 ? Colors.blue : Colors.grey.shade700,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatIndex == 1)
              Padding(
                padding: const EdgeInsets.only(top: 2, right: 8),
                child: Icon(
                  Icons.school,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            Expanded(
              child: Text(
                msg.trim(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              // shouldAnimate
              //     ? DefaultTextStyle(
              //         style: const TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 16,
              //         ),
              //         child: AnimatedTextKit(
              //           isRepeatingAnimation: false,
              //           repeatForever: false,
              //           displayFullTextOnTap: true,
              //           totalRepeatCount: 1,
              //           animatedTexts: [
              //             TyperAnimatedText(
              //               msg.trim(),
              //             ),
              //           ],
              //         ),
              //       )
              //     : Text(
              //         msg.trim(),
              //         style: const TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 16,
              //         ),
              //       ),
            ),
            if (chatIndex == 0)
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 8),
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
