import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_work/controller/navigation_cotroller.dart';
import '../controller/conversations_controller.dart';
import '../controller/messages_controller.dart';
import '../widgets/conversation_panel.dart';
import 'conversation_page.dart';

class HomePage extends StatelessWidget {
  final conversationsController = Get.put(ConversationsController());
  final navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 1, child: NavBar(context)),
              const SizedBox(
                height: 10,
              ),
              Expanded(flex: 8, child: Content(context)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget NavBar(BuildContext context) {
  final NavigationController navigationController = Get.find();

  return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: GetX<NavigationController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            controller.currentPage.value == 0
                ? Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFCCCB),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.setPage(0);
                    },
                    icon: Icon(Icons.message),
                  ),
            controller.currentPage.value == 1
                ? Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFCCCB),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_chart),
                      onPressed: () {},
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.setPage(1);
                    },
                    icon: Icon(Icons.add_chart),
                  ),
            controller.currentPage.value == 2
                ? Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFCCCB),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.play_circle_fill),
                      onPressed: () {
                        controller.setPage(2);
                      },
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.setPage(2);
                    },
                    icon: Icon(Icons.play_circle_fill),
                  ),
            controller.currentPage.value == 3
                ? Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFCCCB),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        controller.setPage(3);
                      },
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.setPage(3);
                    },
                    icon: Icon(Icons.person),
                  ),
          ],
        );
      }));
}

Widget Content(BuildContext context) {
  final ConversationsController conversations = Get.find();
  final NavigationController navigationController = Get.find();

  return GetX<NavigationController>(
    builder: (navController) {
      return navController.currentPage.value == 0
          ? Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.01)),
                color: Color(0xffD3D3D3),
              ),
              child: GetX<ConversationsController>(builder: (controller) {
                if (conversations.conversionsList.isEmpty) {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
                return ListView.builder(
                    itemCount: controller.conversionsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          Get.put(MessageController(secondPersonName: controller.conversionsList[index].title), tag: controller.conversionsList[index].title);
                          Future.delayed(Duration(seconds: 1));

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ConversationPage(
                                secondPersonNamee:
                                    controller.conversionsList[index].title,
                              ),
                            ),
                          );
                        },
                        child: ConversationPanel(
                          username: controller.conversionsList[index].title,
                          lastMessage:
                              controller.conversionsList[index].subTitle,
                          pauseOrPlay:
                              controller.conversionsList[index].playPause,
                          messageAge:
                              controller.conversionsList[index].timePeriod,
                        ),
                      );
                    });
              }))
          : Center(
              child: Container(
                child: Text('To be impleted...'),
              ),
            );
    },
  );
}
