import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            center: Alignment.topLeft,
            radius: 1.0,
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.bell),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10.0,),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.bars),
                color: Colors.white,
              ),
            ],
          )
        ],
      )
    );
  }
}
