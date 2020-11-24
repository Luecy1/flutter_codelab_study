import 'package:flutter/material.dart';
import 'package:flutter_codelab_study/test/models/favorites.dart';
import 'package:provider/provider.dart';

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
      body: ListView.builder(itemBuilder: (context, index) => ItemTile(itemNo: index)),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile({Key key, this.itemNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
      ),
      title: Text(
        'Item $itemNo',
        key: Key('text_$itemNo'),
      ),
      trailing: IconButton(
        key: Key('icon_$itemNo'),
        icon: favoritesList.items.contains(itemNo)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        onPressed: () {},
      ),
    );
  }
}
