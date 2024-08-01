import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/groups/Groups_Screen.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';

class ChatScreen extends StatefulWidget {
  final Group group;

  const ChatScreen({required this.group});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 1.sh,
        child: Column(
          children: [
            VerticalSizedBox(vertical: 50.h),
            const ChatHeader(),
            ChatListView(widget: widget),
            chatFooter(),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        widget.group.messages
            .add(Message(sender: "Me", text: text, isMe: true));
      });
      _controller.clear();
    }
  }

  Padding chatFooter() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: CustomContainer(
        borderColor: baseColor,
        borderRadius: 25.r,
        height: 50.h,
        child: Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 5.w),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: baseColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: whiteColor, // Border color
                  width: 1.5.sp, // Border width
                ),
              ),
              child: Icon(
                Icons.camera_alt_sharp,
                color: whiteColor,
                size: 20.sp,
              ),
            ),
            HorizontalSizedBox(horizontalSpace: 15.w),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 4,
                  scrollController: ScrollController(),
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _sendMessage,
              child: const Icon(
                Icons.send,
                color: baseColor,
              ),
            ),
            HorizontalSizedBox(horizontalSpace: 15.w),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.widget,
  });

  final ChatScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.all(10.w),
        itemCount: widget.group.messages.length,
        itemBuilder: (context, index) {
          return ChatBubble(message: widget.group.messages[index]);
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          message.isMe
              ? CustomText(
                  text: "10:30 PM",
                  fontSize: 10.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                )
              : Image.asset(
                  p1,
                  height: 50.h,
                ),
          HorizontalSizedBox(horizontalSpace: 15.w),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: message.isMe ? baseColor : const Color(0xff3E3E3E),
              borderRadius: BorderRadius.circular(50.r),
            ),
            constraints: BoxConstraints(
              maxWidth: 0.6.sw,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: whiteColor,
                ),
                // Limit to one line (change this as needed)
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 10.w),
          message.isMe
              ? Image.asset(
                  profil2,
                  height: 50.h,
                )
              : CustomText(
                  text: "10:30 PM",
                  fontSize: 10.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                ),
        ],
      ),
    );
  }
}
