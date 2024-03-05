import 'package:flutter/material.dart';
import 'package:forage_app/details_page.dart';
import 'package:forage_app/forms_page.dart';
import 'package:forage_app/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade900,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: context.watch<ForageProvider>().forage_items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                  "${context.watch<ForageProvider>().forage_items[index]["name"]}"),
              subtitle: Text(
                  "${context.watch<ForageProvider>().forage_items[index]["location"]}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(index: index),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormsPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 3, 216, 244),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
