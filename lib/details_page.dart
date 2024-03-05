import 'package:flutter/material.dart';
import 'package:forage_app/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final int index;

  // Constructor with index parameter
  DetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                "${context.watch<ForageProvider>().forage_items[widget.index]["name"]}",
                style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
                "${context.watch<ForageProvider>().forage_items[widget.index]["location"]}"),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              context.watch<ForageProvider>().forage_items[widget.index]
                      ["isCurrentlyInSeason"]
                  ? "Currently In Season"
                  : "Not In Season",
            ),
          ),
          ListTile(
            leading: Icon(Icons.notes),
            title: Text(
                "${context.watch<ForageProvider>().forage_items[widget.index]["notes"]}"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
