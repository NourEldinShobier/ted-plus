import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/app.view.dart';

void main() => runApp(MultiProvider(
      providers: [
        /*      
        Provider.value(value: TalksStore()..init()),
        Provider.value(value: UserStore()..init()), 
        */
      ],
      child: TEDApp(),
    )););
