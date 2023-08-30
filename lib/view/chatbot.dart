import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController text = TextEditingController();
  FocusNode _textFocusNode = FocusNode();

  List<_chatBotModel> _chatModel = [
    _chatBotModel(
        message: "Merhaba, ben Nexa. Size nasıl yardımcı olabilirim?",
        hour: "3:14",
        rol: 'bot'),
    _chatBotModel(message: "Merhaba Nexa", hour: "3:13", rol: 'user'),
    _chatBotModel(
        message: "Merhaba, ben Nexa. Size nasıl yardımcı olabilirim?",
        hour: "3:12",
        rol: 'bot'),
    _chatBotModel(message: "Merhaba Nexa", hour: "3:10", rol: 'user'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Hero(
            tag: 'chatgifhero',
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.nexaGIF),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            padding: 19.allP,
            onPressed: () {
              Grock.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
            color: Constant.purple,
          ),
        ),
        backgroundColor: Constant.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(bottom: 20),
                itemCount: _chatModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Align(
                      alignment: _chatModel[index].rol == 'bot'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: _chatModel[index].rol == 'bot'
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                            decoration: BoxDecoration(
                              color: _chatModel[index].rol == 'bot'
                                  ? Constant.darkwhite
                                  : Color.fromARGB(73, 103, 71, 199),
                              borderRadius: _chatModel[index].rol == 'bot'
                                  ? BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))
                                  : BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                            ),
                            child: Text(
                              _chatModel[index].message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Proxima Nova',
                                  letterSpacing: -0.4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              _chatModel[index].hour,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(133, 51, 51, 51)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 19, right: 19, bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width - 123,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: text,
                              focusNode: _textFocusNode,
                              onEditingComplete: null,
                              cursorColor: Constant.purple,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE8E6EA), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE8E6EA), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Constant.white,
                                hintText: 'Mesajınız',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(175, 51, 51, 51),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GrockContainer(
                          onTap: () {
                            setState(() {
                              DateTime now = DateTime.now();
                              _chatModel.insert(
                                0,
                                _chatBotModel(
                                    message: text.text,
                                    hour: '${now.hour}:${now.minute}',
                                    rol: 'user'),
                              );
                              text.text = '';
                              FocusScope.of(context)
                                  .requestFocus(_textFocusNode);
                            });
                          },
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Color(0xFFE8E6EA), width: 1),
                          ),
                          child: Center(
                            child:
                                SvgPicture.asset(Assets.icons.icSendArrowSVG),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _chatBotModel {
  String message;
  String rol;
  String hour;
  _chatBotModel({required this.message, required this.hour, required this.rol});
}
