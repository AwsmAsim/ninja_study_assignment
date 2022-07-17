import 'package:get/get.dart';
import 'package:internship_work/model/conversation_model.dart';

class ConversationsController extends GetxController{

  List<ConversationModel> conversionsList = <ConversationModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetch();
    super.onInit();
  }

  void fetch() async{

    await Future.delayed(const Duration(seconds: 2),);

    List<ConversationModel> fetched = [
      ConversationModel(imageUrl: 'imageUrl', title: 'Taste', subTitle: 'Eida: Would you try again', timePeriod: 29.toString()),
      ConversationModel(imageUrl: 'imageUrl', title: 'Bienvenue', subTitle: 'Eida: We are going to start', timePeriod: 1.toString()),
      ConversationModel(imageUrl: 'imageUrl', title: 'Restraunt', subTitle: 'Eida: Welcome to restraunt', timePeriod: 12.toString())
    ];

    conversionsList += fetched;
  }

}