import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class Message {
  final String sender;
  final String text;
  final bool isBot;

  Message({
    required this.sender,
    required this.text,
    this.isBot = false,
  });
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<Message> messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COLLEGE OF BUSINESS AND ACCOUNTANCY',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: message.isBot ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.isBot ? Colors.blueGrey : Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '${message.sender}: ${message.text}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add(Message(sender: 'You', text: messageText));
      });
      String botResponse = getBotResponse(messageText);
      setState(() {
        messages
            .add(Message(sender: 'Council', text: botResponse, isBot: true));
      });
      _messageController.clear();
    }
  }

  String getBotResponse(String message) {
    if (message.toLowerCase().contains('hello')) {
      return 'Hello! How can I help you today?';
    } else if (message.toLowerCase().contains('how are you')) {
      return 'I am just here to assist you!';
    } else if (message.toLowerCase().contains('admission')) {
      return 'For admission inquiries, please visit our website or contact the admission office. You can also visit our Facebook page: https://www.facebook.com/ColegioSanAgustin.Bacolod';
    } else if (message.toLowerCase().contains('courses')) {
      return 'We offer various courses including Bachelor of Arts in English, Bachelor of Science in Biology, Bachelor of Elementary Education, Bachelor of Secondary Education, etc.';
    } else {
      return "I'm sorry, I didn't understand that. How can I assist you?";
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatRoomPage(),
  ));
}
