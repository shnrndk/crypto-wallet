import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  String dropdownValue = 'Bitcoin';

  TextEditingController _coinAmount = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            items: <String>['Bitcoin', 'Tether', 'Ethereum']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            value: dropdownValue,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: TextFormField(
              controller: _coinAmount,
              decoration: InputDecoration(labelText: 'Coin Amount'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.lightBlueAccent),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
