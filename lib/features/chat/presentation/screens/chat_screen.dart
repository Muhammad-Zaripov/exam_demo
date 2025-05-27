import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double w = ScreenSize.widthFactor(context);
    // final double h = ScreenSize.heightFactor(context);
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.only(left: 24, right: 24, top: 65),
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Messages',
      //             style: GoogleFonts.dmSans(
      //               fontSize: 24,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Stack(
      //             clipBehavior: Clip.none,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (cxt) => NotificationScreen(),
      //                     ),
      //                   );
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(11),
      //                   decoration: BoxDecoration(
      //                     color: AppColors.appBarButtonColor,
      //                     borderRadius: BorderRadius.circular(30),
      //                   ),
      //                   width: 44 * w,
      //                   height: 44 * h,
      //                   child: SvgPicture.asset(
      //                     AppImages.notification,
      //                     // ignore: deprecated_member_use
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //               Positioned(
      //                 top: 13,
      //                 right: 17,
      //                 child: Container(
      //                   width: 9,
      //                   height: 9,
      //                   decoration: BoxDecoration(
      //                     color: Colors.red,
      //                     shape: BoxShape.circle,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 36 * h),
      //       MyTextField(
      //         prefix: SvgPicture.asset(AppImages.searchNormal),
      //         hintText: 'Search hotel',
      //         suffix: SvgPicture.asset(AppImages.sort),
      //         borderRadius: 30,
      //       ),
      //       ListView.builder(
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (c) => ChatScreen()),
      //               );
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
