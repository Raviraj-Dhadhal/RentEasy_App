import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/chat/widgets/chat_bubble.dart';
import 'package:renteasy_app/features/pg/screens/chat/widgets/chat_input_bar.dart';
import 'package:renteasy_app/features/pg/screens/chat/widgets/chat_pinned_property.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    this.ownerName = 'Rajesh (Owner)',
    this.propertyTitle = 'Skyline Modern Studio',
    this.propertyPrice = '₹25,000/mo',
    this.propertyLocation = 'Ahmedabad',
    this.propertyImage = images.propertyHome1,
  });

  final String ownerName;
  final String propertyTitle;
  final String propertyPrice;
  final String propertyLocation;
  final String propertyImage;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {
      'message': 'Hi Sarah, is this property still available?',
      'time': '09:41 AM',
      'isOutgoing': true,
      'isRead': true,
    },
    {
      'message': 'Yes it is! Would you like to schedule a visit?',
      'time': '09:42 AM',
      'isOutgoing': false,
      'isRead': true,
    },
    {
      'message': 'Yes, this Saturday works for me.',
      'time': '09:44 AM',
      'isOutgoing': true,
      'isRead': true,
    },
    {
      'message': 'Perfect, see you at 11 AM.',
      'time': '09:45 AM',
      'isOutgoing': false,
      'isRead': true,
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'message': text,
        'time': 'Just now',
        'isOutgoing': true,
        'isRead': false,
      });
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.button),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(images.userProfileImage),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ownerName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: Color(0xFF22C55E),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: AppColors.button),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: AppColors.button),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.button),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to log out of RentEasy?',
                textConfirm: 'Logout',
                textCancel: 'Cancel',
                confirmTextColor: Colors.white,
                buttonColor: AppColors.error,
                onConfirm: () => Get.offAll(() => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Pinned Property Banner
          ChatPinnedProperty(
            title: widget.propertyTitle,
            price: widget.propertyPrice,
            location: widget.propertyLocation,
            image: widget.propertyImage,
          ),

          // Message Bubbles List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  message: msg['message'],
                  time: msg['time'],
                  isOutgoing: msg['isOutgoing'],
                  isRead: msg['isRead'],
                );
              },
            ),
          ),

          // Chat Input Bar
          ChatInputBar(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
