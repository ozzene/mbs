import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildChatItem('Maria Bekker', '12:34', 'Orlov is typing...', true),
                  const SizedBox(height: 10),
                  _buildChatItem('Martin Klani', '12:30', 'When is the meeting scheduled?', false),
                  const SizedBox(height: 10),
                  _buildChatItem('Jake Kenno', '11:30', 'Unfortunately, I won\'t be here today.', false),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(String name, String time, String message, bool isTyping) {
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
    );
  }
}