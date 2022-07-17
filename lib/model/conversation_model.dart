import '../constants.dart';

class ConversationModel{

  String imageUrl, title, subTitle, timePeriod, playPause;

  ConversationModel({required this.imageUrl, required this.title, required this.subTitle,required this.timePeriod, this.playPause = PAUSE});

}