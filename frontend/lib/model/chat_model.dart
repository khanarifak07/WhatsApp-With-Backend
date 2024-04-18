// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatModel {
  String name;
  String currentMessage;
  String time;
  bool isGroup;
  IconData icon;
  String status;
  bool select = false;
  int id;
  ChatModel({
    bool select = false,
    required this.name,
    required this.currentMessage,
    required this.time,
    required this.isGroup,
    required this.icon,
    required this.status,
    required this.id,
  });
}
