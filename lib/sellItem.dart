import 'package:flutter/material.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Welcome Vendor",
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: () {},
                elevation: 20,
                child: Text("All Items"),
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 20,
                child: Text("Out of stock"),
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Add New",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
