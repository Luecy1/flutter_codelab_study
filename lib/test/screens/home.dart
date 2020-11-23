import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing sample'),
        actions: [
          FlatButton.icon(
            onPressed: () {
              // Navigator.pushNamed(context, );
            },
            icon: Icon(Icons.favorite_border),
            label: Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      }),
    );
  }
}
