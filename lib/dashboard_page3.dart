import 'package:flutter/material.dart';

class DashboardPage3 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(children: [
          RaisedButton(
            onPressed: () {},
            child: Text("button"),
          ),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
            label: Text('button with icon'),
          ),
          RaisedButton(onPressed: null, child: Text("disabled button")),
          RaisedButton.icon(
            onPressed: null,
            icon: Icon(Icons.account_circle),
            label: Text('disabled button with with icon'),
          ),
          OutlineButton(onPressed: () {}, child: Text("button")),
          OutlineButton.icon(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
            label: Text('button with icon'),
          ),
          OutlineButton(onPressed: null, child: Text("disabled button")),
          OutlineButton.icon(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
              label: Text('disabled with icon icon')),
          IconButton(
            icon: Icon(
              Icons.save
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.save
            ),
            onPressed: null,
          ),
          DropdownButton(
              items: ['Cheese', 'Ham', 'Bacon', 'Pickle']
                  .map((item) => DropdownMenuItem(child: Text(item)))
                  .toList(growable: false),
              onChanged: (value) => print('dropdown value $value')),
          FlatButton(onPressed: () {}, child: Text("button")),
          FlatButton(onPressed: null, child: Text('flat button')),
          FlatButton.icon(
            icon: Icon(
              Icons.restore_from_trash,
            ),
            onPressed: () {},
            label: Text('flat button with icon'),
          ),
          Divider(),
          Row(
            children: [
              Checkbox(value: true, onChanged: (v) {}),
              Checkbox(value: false, onChanged: (v) {}),
              Checkbox(value: true, onChanged: null),
              Checkbox(value: false, onChanged: null),
            ],
          ),
          Row(
            children: [
              Radio(value: false, onChanged: (v) {}, groupValue: null),
              Radio(value: true, onChanged: (v) {}, groupValue: true),
              Switch(value: false, onChanged: (v) {}),
              Switch(value: true, onChanged: (v) {}),
            ],
          ),
          Divider(),
          Slider(
            min: 0.0,
            max: 15.0,
            onChanged: (newRating) {},
            value: 5,
          ),
          Slider(
            min: 0.0,
            max: 15.0,
            onChanged: null,
            value: 5,
          ),
          Divider(),
          Row(children: [
            Chip(label: Text('chip')),
            Chip(
              label: Text('chip'),
              avatar: Icon(Icons.person_pin),
              onDeleted: () {},
            )
          ]),
          Row(children: [
            ChoiceChip(label: Text('selected choice chip'), selected: true),
            ChoiceChip(label: Text('not selected'), selected: false),
          ]),
          Row(children: [
            FilterChip(
                selected: true, label: Text('filter chip'), onSelected: (_) {}),
            FilterChip(label: Text('disabled filter chip'), onSelected: null)
          ]),
          Divider(),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'label text',
              hintText: 'hint text',
            ),
          ),
          TextFormField(
            autocorrect: false,
          ),
          TextFormField(
            autocorrect: false,
            maxLength: 20,
            decoration: InputDecoration(
              helperText: 'helper text',
            ),
          ),
          TextFormField(
            enabled: false,
            autocorrect: false,
            maxLength: 20,
            decoration: InputDecoration(
              helperText: 'helper text',
            ),
          ),
          TextFormField(
            autocorrect: false,
            maxLength: 20,
            decoration: InputDecoration(
              prefixText: 'prefix : ',
              suffixText: 'suffix',
            ),
          ),
          TextFormField(
            autocorrect: false,
            decoration:
            InputDecoration(hintText: '', errorText: 'error text'),
          ),
          Divider(),
          LinearProgressIndicator(
            value: 0.57,
          ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child:
    Wrap(
          children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              value: 1,
              backgroundColor: Colors.yellow,
            ),
          )])
    )]));
  }
}
