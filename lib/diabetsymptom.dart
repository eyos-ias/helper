import 'package:flutter/material.dart';

class diabetsymptom extends StatefulWidget {
  @override
  _diabetsymptomState createState() => _diabetsymptomState();
}

class _diabetsymptomState extends State<diabetsymptom> {
  List<String> itemList = [
    'String',
    'Something',
    'anything',
    'somebody',
    'nobody',
    'ራስ',
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList.addAll(itemList);
  }

  void filterItems(String query) {
    filteredList.clear();
    if (query.isNotEmpty) {
      itemList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      });
    } else {
      filteredList.addAll(itemList);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms of diabet'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterItems,
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
