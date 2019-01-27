import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        GridView.count(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            primary: false,
            crossAxisSpacing: 0.0,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                  child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Card',
                              style: Theme.of(context).textTheme.body1,
                            ),
                          )))),
              Card(
                  child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: FlatButton(onPressed: () { _neverSatisfied(context); }, child: Text("show alert")))))
            ])
      ],
    ));
  }

  Future<void> _neverSatisfied(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
