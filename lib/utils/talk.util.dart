import 'package:flutter/material.dart';

class Talk {
  final Image image;

  //final String id;
  final String title;

  final String speakerName;
  final String publishDate;

  final String duration;

  final List<String> tags;
  final int views;

  Talk({
    this.title,
    this.speakerName,
    this.publishDate,
    this.duration,
    this.image,
    this.tags,
    this.views,
  });
}
