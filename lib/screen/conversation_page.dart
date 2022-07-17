import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_work/constants.dart';
import 'package:internship_work/controller/conversations_controller.dart';
import 'package:internship_work/controller/messages_controller.dart';
import 'package:internship_work/widgets/message_box.dart';

class ConversationPage extends StatelessWidget {

  final String secondPersonNamee;

  ConversationPage({required this.secondPersonNamee});


  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.circle,
                    color: Colors.green,
                ),
              ),
            IconButton(onPressed: (){},
              icon: Icon(Icons.settings,
                color: Colors.blue,
              ),
            ),
            IconButton(onPressed: (){},
              icon: Icon(Icons.flag,
                color: Colors.blue,
              ),
            ),
            ],
          title: Text(secondPersonNamee,
            style: TextStyle(
              color: Colors.grey
            ),
          ),
        ),

      body: Column(
        children: [
          SizedBox(height: 10.0,),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:
              // Center(child: Container(child: Text('Loading...'),),),
              GetX<MessageController>(
                tag: secondPersonNamee,
                builder: (controller){
                  if(controller.messagesList.isEmpty){
                    return Center(child: Container(child: Text('Loading...'),),);
                  }
                  return ListView.builder(
                      itemCount: controller.messagesList.length,
                      itemBuilder: (BuildContext context, int index){
                        return MessageBox(messageModel: controller.messagesList[index]);
                      },
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: lightgrey,
                  borderRadius: BorderRadius.all(Radius.circular(20.0),),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: SuggestionOptions(context)),
                    const Divider(
                      thickness: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child: LanguagesOptions(context)),
                    Expanded(
                        flex: 1,
                        child: OptionsIcons(context)),
                  ],
                ),
              ),

          )
        ],
      ),
      ),
    );
  }
  
  Widget OptionsIcons(BuildContext context){

    final MessageController messsageContoller = Get.find<MessageController>(tag: secondPersonNamee);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: iconDecoration(),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.attachment_sharp),
            ),
        ),
        Container(
          decoration: iconDecoration(),
          child: IconButton(onPressed: () async{
            stt.SpeechToText speech =  stt.SpeechToText();
            bool available = await speech.initialize();
            print(available);

            if(available){
              speech.listen();
              print('Listening...');
              await Future.delayed(Duration(seconds: 4),);
              String words = speech.lastRecognizedWords;
              print(words);
              messsageContoller.checkWords(words.toLowerCase());
              await speech.stop();
              print('Stopped listening');
            }
          }, icon: Icon(Icons.mic),),
          ),
        Container(
          decoration: iconDecoration(),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard)),
          ),
      ],
    );
  }
  
  Widget LanguagesOptions(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: GetX<MessageController>(
        tag: secondPersonNamee,
        builder: (msgController){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('हाय लौरा!',
                style: TextStyle(
                  color: msgController.suggestionsBool.value ?
                  Colors.black : lightgrey,
                ),
              ),
              Text('ہیلو لورا!',
                style: TextStyle(
                  color: msgController.suggestionsBool.value ?
                  Colors.black : lightgrey,
                ),
              ),
              Text('Hi Laura !',
                style: TextStyle(
                  color: msgController.suggestionsBool.value ?
                  Colors.black : lightgrey,
                ),
              )
            ],
          );
        },
      ),


    );
  }

  Widget SuggestionOptions(BuildContext context){
    return Container(
      child: Row(
        children: [
          GetX<MessageController>(
            tag: secondPersonNamee,
            builder: (msgController){
              return Switch(
                  value: msgController.suggestionsBool.value,
                  onChanged: (value){
                    msgController.suggestionsBool.value = !msgController.suggestionsBool.value;
                  }
              );
            },
          ),
          Text('Suggestions',
          style: TextStyle(
            color: Colors.black54
          ),
          )
        ],
      ),
    );
  }

  BoxDecoration iconDecoration() =>  const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(30.0),),
  );
  
}
