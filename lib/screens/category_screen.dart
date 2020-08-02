import 'package:flutter/material.dart';
import 'package:flutter_app7/models/places.dart';
import 'package:flutter_app7/screens/places_screen.dart';
import '../components/list_category.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daengweb Pariwisata"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.call, color: Colors.white),
            //Menangani kejadian saat menu Call diklik
            onPressed: () {
            },
          ),
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            //Menangani kejadian saat menu search diklik
            onPressed: () {
              ListView.builder(
                itemBuilder: (context, index) {
                  return index == 0 ? _searchBar() : _listItem(index-1);
                },
                itemCount: PlacesScreen.length+1,
              );
            },
          ),
        ],
      ),

      body:
      GridView(
        padding: EdgeInsets.all(15),
        children: CATEGORIES_DUMMY_DATA
            .map((cat) => ListCategory(cat.id, cat.title, cat.description, cat.image))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() => PlacesScreen = name.where((PlacesScreen) {

            }).toList());
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _notesForDisplay[index].title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              _notesForDisplay[index].text,
              style: TextStyle(
                  color: Colors.grey.shade600
              ),
            ),
          ],
        ),
      ),
    );
  }
}


