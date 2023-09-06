import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class policecall extends StatefulWidget {
  @override
  _policecallState createState() => _policecallState();
}

class _policecallState extends State<policecall> {
  List<String> itemList = [
    'addis abeba',
    'adama',
    'bishoftu',
    'hawasa',
    'Gonder',
  ];

  final List<String> rightColumnTexts = [
    '9000',
    '0090',
    '89989',
    '58',
    '321',
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

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Number copied!'),
        action: SnackBarAction(
            label: 'okay', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('የፖሊስ ጣቢያ ጥሪዎች'),
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
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(filteredList[index]),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: rightColumnTexts[index]));
                          _showToast(context);
                        },
                        child: Text(
                          rightColumnTexts[index],
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}