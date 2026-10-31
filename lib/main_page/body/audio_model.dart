import 'package:flutter/material.dart';

class AudioModel {
  String title;
  String subtitle;
  String duration;
  String tag;
  String category;
  String path;
  String image;

  AudioModel({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.tag,
    required this.category,
    required this.path,
    required this.image,
  });
}
