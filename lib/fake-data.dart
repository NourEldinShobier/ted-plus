import 'package:flutter/material.dart';
import 'utils/talk.util.dart';

class FakeData {
  static List<Talk> talks = [
    Talk(
      title: 'Why you should treat the tech you use at work like a colleague',
      speakerName: 'Nadjia Yousif',
      publishDate: 'Dec 2018',
      duration: '11:36',
      image: Image(
        image: AssetImage('assets/img/PostImg.jpg'),
        fit: BoxFit.cover,
      ),
      tags: ['Technology', 'Science'],
    ),
    Talk(
      title: 'Can you solve the prisoner hat riddle?',
      speakerName: 'Alex Gendler',
      publishDate: 'Feb 2019',
      duration: '4:34',
      image: Image(
        image: AssetImage('assets/img/PostImg1.jpg'),
        fit: BoxFit.cover,
      ),
      tags: ['Technology', 'Science'],
    ),
    Talk(
      title: 'What your breath could reveal about your health',
      speakerName: 'Julian Burschka',
      publishDate: 'Feb 2019',
      duration: '13:29',
      image: Image(
        image: AssetImage('assets/img/PostImg2.jpg'),
        fit: BoxFit.cover,
      ),
      tags: ['Technology', 'Science'],
    )
  ];

  static List<String> fields = [
    'All',
    'Business',
    'Science',
    'Art',
    'Education',
    'Design',
  ];
}
