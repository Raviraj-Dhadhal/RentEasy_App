import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isOutgoing,
    this.isRead = true,
  });

  final String message;
  final String time;
  final bool isOutgoing;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isOutgoing ? AppColors.button : const Color(0xFFF0F1FA),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
            bottomLeft: Radius.circular(isOutgoing ? 16.0 : 4.0),
            bottomRight: Radius.circular(isOutgoing ? 4.0 : 16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: isOutgoing ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 13.0,
                color: isOutgoing ? Colors.white : AppColors.primaryTextColor,
                fontFamily: 'poppins',
                height: 1.35,
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: isOutgoing ? Colors.white.withValues(alpha: 0.8) : AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
                if (isOutgoing) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 14,
                    color: isRead ? Colors.white : Colors.white60,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
