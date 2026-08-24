import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_shopping/features/common/widgets/chat/message_double.dart';
import 'package:home_shopping/features/common/models/chat_model.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';

import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_container/custom_container.dart';
import 'package:home_shopping/share/widgets/custom_image/custom_image.dart';
import 'package:home_shopping/share/widgets/custom_profile_image.dart';
import 'package:home_shopping/utils/app_assets/app_assets.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';
import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/extension/base_extension.dart';

class ChatInboxScreen extends StatefulWidget {
  const ChatInboxScreen({super.key});

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final TextEditingController _messageController = TextEditingController();

  // temporary local messages (API later)
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hello 👋", isMe: false),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(
      text:
          "Hello rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr 👋",
      isMe: false,
    ),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(text: _messageController.text.trim(), isMe: true),
      );
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppText.inbox),
      body: Column(
        children: [
          Padding(
            padding: ResponsiveHelper.symmetric(horizontal: 16),
            child: CustomContainer(
              backgroundColor: AppColors.containerGreyBgColor.withAlpha(48),
              padding: ResponsiveHelper.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  CustomProfileAvatar(),

                   SizedBox(width: ResponsiveHelper.spacing(8)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Georgiaa",
                        style: context.bodyLarge.copyWith(
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        "Great Falls, Marylan",
                        style: context.bodyMedium.copyWith(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 Message list
          Expanded(
            child: ListView.builder(
              padding: ResponsiveHelper.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: _messages[index]);
              },
            ),
          ),

          /// 🔹 Input box
          SafeArea(
            child: Padding(
              padding:  ResponsiveHelper.all(8.0),
              child: CustomContainer(
                backgroundColor: AppColors.containerGreyBgColor,
                radius: ResponsiveHelper.borderRadius(12),
                padding: ResponsiveHelper.symmetric(horizontal: 4, vertical: 2),

                child: Row(
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: CustomImage(imageSrc: AppAssets.link),
                    // ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          fillColor: AppColors.containerGreyBgColor,
                          filled: true,
                          hintText: "Type a message...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: CustomImage(imageSrc: AppAssets.send),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
