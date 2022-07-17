
import 'package:get/get.dart';

import '../model/message_model.dart';

class MessageController extends GetxController{

  String secondPersonName;
  RxBool suggestionsBool = true.obs;

  MessageController({required this.secondPersonName});

  List<MessageModel> messagesList = <MessageModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetch();
      super.onInit();
  }

  void checkWords(String spokenWords) async{
    spokenWords = spokenWords.toLowerCase();
    if(spokenWords.contains('hi laura') || spokenWords.contains('hi lura') || spokenWords.contains('helora') || spokenWords.contains('high low') ||
    spokenWords.contains('i laura') || spokenWords.contains('myLara')){
      messagesList.add(MessageModel(englishMessage: 'Hi Laura', urduMessage: '', myMessage: true));
      await Future.delayed(const Duration(milliseconds: 500));
      messagesList.add(MessageModel(englishMessage: 'How are you ?', urduMessage: 'آپ کیسے ہو ?'),);
    }else{
      messagesList.add(MessageModel(englishMessage: spokenWords, urduMessage: '', myMessage: true));
      await Future.delayed(const Duration(milliseconds: 500));
      messagesList.add(MessageModel(englishMessage: 'The message was wrong please try again', urduMessage: 'پیغام غلط تھا براہ کرم دوبارہ کوشش کریں۔'));
    }
  }

  void fetch(){
    List<MessageModel> fetchedMessages = [];
    if(secondPersonName == 'Taste'){
      fetchedMessages = [
        MessageModel(englishMessage: 'Hello Shaktiman!', urduMessage: 'ہیلو شکتیمان!'),
      ];
    }else if(secondPersonName == 'Bienvenue'){
      fetchedMessages = [
        MessageModel(englishMessage: 'We are going to start.', urduMessage: 'ہم شروع کرنے جا رہے ہیں.'),
      ];
    }else if(secondPersonName == 'Restaurant'){
      fetchedMessages = [
        MessageModel(englishMessage: 'Welcome to restaurant !', urduMessage: 'ریستوراں میں خوش آمدید!')
      ];
    }

    Future.delayed(Duration(seconds: 1));

    messagesList += fetchedMessages;

  }

}