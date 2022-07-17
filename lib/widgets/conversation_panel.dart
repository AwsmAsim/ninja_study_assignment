import 'package:flutter/material.dart';

String pause = 'pause', play = 'play';

class ConversationPanel extends StatelessWidget {
  final String username, lastMessage, messageAge, pauseOrPlay;

  ConversationPanel({required this.username, required this.lastMessage, required this.messageAge, required this.pauseOrPlay});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Container(
                height: 60.0,
                child: CircleAvatar(

                  backgroundColor: Colors.blueAccent,
                ),
              ),
          ),

          Expanded(
            flex: 3,
              child: Container(
                child: ListTile(
                  title: Text(username,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(lastMessage),
                  trailing: Container(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text('${messageAge} minutes ago',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        this.pauseOrPlay == pause ?  Icon(Icons.pause,
                          color: Colors.orange,
                        ) : Icon(Icons.play_circle_fill,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }
}
