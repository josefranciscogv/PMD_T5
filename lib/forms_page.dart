import 'package:flutter/material.dart';
import 'package:forage_app/home_page.dart';
import 'package:forage_app/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: context.watch<ForageProvider>().getNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.grey[350],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller:
                    context.watch<ForageProvider>().getLocationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  filled: true,
                  fillColor: Colors.grey[350],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: context.watch<ForageProvider>().isCurrentlyInSeason,
                    onChanged: (bool? value) {
                      context
                          .read<ForageProvider>()
                          .updateSeason(value ?? false);
                    },
                  ),
                  Text(
                    'Currently in season',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: context.watch<ForageProvider>().getNotesController,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  filled: true,
                  fillColor: Colors.grey[350],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ForageProvider>().addItemToList();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item added'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.shade900),
                    ),
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add your action for the second button
                      context.read<ForageProvider>().clearControllers();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.shade900),
                    ),
                    child: Text(
                      'DELETE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
