import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_shopping/core/router/route_path.dart';
import 'package:home_shopping/features/common/widgets/chat/user_chat_list_widget.dart';
import 'package:home_shopping/helper/responsive_helper/responsive_helper.dart';


import 'package:home_shopping/share/widgets/custom_appbar/custom_appbar.dart';
import 'package:home_shopping/share/widgets/custom_search_bar/custom_search_bar.dart';
import 'package:home_shopping/utils/app_text/app_text.dart';

class ChatSellerScreen extends StatelessWidget {
  const ChatSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.allChats)),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: ResponsiveHelper.height(16)),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return UserChatListWidget(
                    onTap: () {
                      context.pushNamed(RoutePath.chatInboxSellerScreen);
                    },
                    name: 'Georgiaa',
                    message: 'its urgentt do it asap',
                    time: '3:15 pm',
                    count: '4',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
