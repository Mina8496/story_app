import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_app/feature/home_page/presentation/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
        centerTitle: true,
        title: Text('New Trand', style: TextStyle(color: Colors.black)),
      ),
      body: CustomCard(),
    );
  }
}
