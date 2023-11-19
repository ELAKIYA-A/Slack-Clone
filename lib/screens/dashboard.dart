import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7B3481),
      body: Column(
        children: [
          topBar(),
          Row(
            children: [
              Container(
                height: Get.height - 40,
                width: Get.width * 0.06,
                child: sideBar(),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: bodyWidget(),
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      height: Get.height - 50,
      child: Row(
        children: [
          Container(
              width: Get.width * 0.23,
              height: Get.height - 50,
              decoration: BoxDecoration(
                  color: Color(0xff391C3B),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: channelsWidget()),
          Expanded(
            child: Container(
//            width: Get.width * 0.3,
              height: Get.height - 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: messageWidget(),
            ),
          )
        ],
      ),
    );
  }

  final QuillEditorController editcontroller = QuillEditorController();
  Widget messageWidget() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("# general",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w900)),
              ],
            )),
        SizedBox(height: 10),
        Container(height: 1, width: Get.width, color: Colors.grey.shade200),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Icon(Icons.add, color: Color(0xff737273), size: 14),
              SizedBox(width: 2),
              Text("Add a bookmark",
                  style: TextStyle(
                      color: Color(
                        0xff737273,
                      ),
                      fontSize: 13))
            ]),
          ),
        ),
        SizedBox(height: 10),
        Container(height: 1, width: Get.width, color: Colors.grey.shade200),
        SizedBox(height: 50),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("📣 You’re looking at the # general channel",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                SizedBox(height: 15),
                Text(
                    "This is the one channel that will always include everyone. It’s a great spot for announcements and team-wide conversations. Edit description",
                    style: TextStyle(
                        color: Color(0xff606060), fontWeight: FontWeight.w500)),
                // Spacer(),
                SizedBox(height: 100),
                Container(
                    height: 1, width: Get.width, color: Colors.grey.shade200),
                SizedBox(height: 20),
                Row(children: [
                  Container(
                    child: Container(
                      height: 40,
                      width: 40,
                      //padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff512DA8)),
                      child: Center(
                          child: Text("B",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(children: [
                    Row(
                      children: [
                        Text("John",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18)),
                        SizedBox(width: 5),
                        Text("12:58 PM",
                            style: TextStyle(color: Colors.grey, fontSize: 13))
                      ],
                    ),
                    SizedBox(height: 1),
                    Text("joined #general"),
                    SizedBox(height: 20),
                  ])
                ]),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Container(
                    height: 100,
                    width: Get.width,
                    child: Column(
                      children: [
                        ToolBar(
                          toolBarColor: Colors.cyan.shade50,
                          activeIconColor: Colors.green,
                          padding: const EdgeInsets.all(8),
                          iconSize: 20,
                          toolBarConfig: [
                            ToolBarStyle.bold,
                            ToolBarStyle.italic,
                            ToolBarStyle.align,
                            ToolBarStyle.color,
                          ],
                          controller: editcontroller,
                          customButtons: [
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.favorite)),
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.add_circle)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: Get.width * 0.6,
                              height: 50,
                              child: QuillHtmlEditor(
                                //        text: "<h1>Hello</h1>This is a quill html editor example 😊",
                                hintText: 'Message #general',
                                controller: editcontroller,
                                isEnabled: true,
                                minHeight: 50,
                                textStyle: TextStyle(),
                                hintTextStyle: TextStyle(),
                                hintTextAlign: TextAlign.start,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                hintTextPadding: EdgeInsets.zero,
                                backgroundColor: Colors.grey.shade100,
                                onFocusChanged: (hasFocus) =>
                                    debugPrint('has focus $hasFocus'),
                                onTextChanged: (text) =>
                                    debugPrint('widget text change $text'),
                                onEditorCreated: () =>
                                    debugPrint('Editor has been loaded'),
                                onEditingComplete: (s) =>
                                    debugPrint('Editing completed $s'),
                                onEditorResized: (height) =>
                                    debugPrint('Editor resized $height'),
                                onSelectionChanged: (sel) =>
                                    debugPrint('${sel.index},${sel.length}'),
                                loadingBuilder: (context) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 0.4,
                                  ));
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(Icons.send,
                                    color: Colors.grey, size: 17)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }

  Widget channelsWidget() {
    return Column(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Slack Project",
                  style: TextStyle(
                      color: Color(0xffC6C5C7),
                      fontSize: 17,
                      fontWeight: FontWeight.w900)),
              Row(children: [
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.sort,
                      color: Color(0xffB7ADB8),
                      size: 18,
                    )),
                SizedBox(width: 5),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      color: Color(0xffB7ADB8),
                      size: 18,
                    ))
              ]),
            ],
          )),
      SizedBox(height: 10),
      Container(height: 1, width: Get.width * 0.23, color: Color(0xff573B59)),
      SizedBox(height: 20),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_drop_down,
                      color: Color(0xffB7ADB8), size: 22),
                  SizedBox(width: 5),
                  Text("Channels",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffB7ADB8)))
                ],
              ),
              SizedBox(height: 15),
              hashtags("general"),
              SizedBox(height: 7),
              hashtags("project"),
              SizedBox(height: 7),
              hashtags("random"),
              SizedBox(height: 7),
              addChannel()
            ],
          ))
    ]);
  }

  Widget addChannel() {
    return InkWell(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              width: 2,
            ),
            Container(
              height: 25,
              width: 25,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Color(0xff48264B),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                  child: Text("+",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffB7ADB8)))),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Add channels",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB7ADB8)))
          ],
        ));
  }

  Widget hashtags(String title) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(width: 10),
          Text("#",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Color(0xffB7ADB8))),
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB7ADB8)))
        ],
      ),
    );
  }

  Widget sideBar() {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xff616061),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text("SL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800))),
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff935D99)),
              child: Icon(Icons.home, color: Colors.white)),
          SizedBox(
            height: 5,
          ),
          Text("Home", style: TextStyle(color: Colors.white, fontSize: 12)),
          SizedBox(height: 15),
          singleIcon("Huddles", Icons.headphones_outlined),
          SizedBox(height: 15),
          singleIcon("Canvases", Icons.file_copy_outlined),
          SizedBox(height: 15),
          singleIcon("More", Icons.more_horiz),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            //padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff512DA8)),
            child: Center(
                child: Text("B",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500))),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget singleIcon(String text, IconData icon) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Color(0xff935D99)
            ),
            child: Icon(icon, color: Colors.white)),
        SizedBox(
          height: 5,
        ),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 11))
      ],
    );
  }

  Widget topBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_back,
                size: 19,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_forward,
                size: 19,
                color: Color(0xffB68CBB),
              ),
            ),
          ),
          SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.timer_outlined,
                size: 19,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 500,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xffAE84B3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Search Projects",
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                  Icon(Icons.search, color: Colors.white, size: 18)
                ],
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.help_outline,
                size: 19,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
