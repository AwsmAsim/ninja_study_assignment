import 'package:flutter/material.dart';
import 'package:internship_work/constants.dart';
import 'package:internship_work/model/message_model.dart';

class MessageBox extends StatelessWidget {

  final MessageModel messageModel;

  MessageBox({required this.messageModel});

  @override
  Widget build(BuildContext context) {

    double S_WIDTH = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: messageModel.myMessage ?
            Colors.blue: lightgrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(messageModel.englishMessage,
            style: TextStyle(
              color: messageModel.myMessage ?
              Colors.white: Colors.black,
            ),
          ),
          Text(messageModel.urduMessage,
            style: TextStyle(
              color: messageModel.myMessage ?
              Colors.white: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
