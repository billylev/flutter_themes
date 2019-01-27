import 'package:flutter/material.dart';

class DashboardPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
            children: [
              Text('Title', style: Theme.of(context).textTheme.title),
              Text('Headline', style: Theme.of(context).textTheme.headline),
              Text('Subhead', style: Theme.of(context).textTheme.subhead),
              Text('Body1', style: Theme.of(context).textTheme.body1),
              Text('Body2', style: Theme.of(context).textTheme.body2),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              Text('Button', style: Theme.of(context).textTheme.button),
              Text('Caption', style: Theme.of(context).textTheme.caption),
              Text('Display1', style: Theme.of(context).textTheme.display1),
              Text('Display2', style: Theme.of(context).textTheme.display2),
              Text('Display3', style: Theme.of(context).textTheme.display3),
              Text('Display4', style: Theme.of(context).textTheme.display4),
            ],
          )
        );
  }
}