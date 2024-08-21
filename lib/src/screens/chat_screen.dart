import 'package:flutter/material.dart';

class MessagingChatScreen extends StatelessWidget {
  const MessagingChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olivia Grant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildChatItem(
                    name: 'Olivia Grant',
                    time: '12:10',
                    message: 'Hi, I\'m doing good, thanks for asking. Have you made any plans for vacation yet?',
                    isTyping: false,
                  ),
                  const SizedBox(height: 10),
                  _buildChatItem(
                    name: 'Olivia Grant',
                    time: '12:12',
                    message: 'What if we take a vacation to Bromo?',
                    isTyping: false,
                  ),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String time,
    required String message,
    required bool isTyping,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Text(name[0]),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(time),
                ],
              ),
              const SizedBox(height: 4),
              Text(message),
              if (isTyping) const SizedBox(height: 4),
              if (isTyping)
                Row(
                  children: List.generate(3, (_) => const CircleAvatar(radius: 4, backgroundColor: Colors.grey)),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}