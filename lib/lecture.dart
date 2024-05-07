import 'package:flutter/material.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('German Grammar', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'German Personal Pronouns',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              buildPronounTable(),
              SizedBox(height: 20),
              Text(
                'Notes:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '1. "Ich" is always lowercase unless it is at the beginning of a sentence.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                '2. "Du" and "ihr" are generally lowercase and used among family, close friends, or from adults to children in informal settings.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                '3. "Sie" is always capitalized when used as a polite form.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen (questions)
                  },
                  child: Text('Continue', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPronounTable() {
    return Table(
      border: TableBorder.all(color: Colors.white),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(
            decoration: BoxDecoration(color: Colors.grey[850]),
            children: [
              Container(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Singular', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('Plural', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ]
        ),
        buildRow('1st Person', 'ich', 'wir'),
        buildRow('2nd Person', 'du', 'ihr'),
        buildRow('2nd Person Polite', 'Sie', 'Sie'),
      ],
    );
  }

  TableRow buildRow(String label, String singular, String plural) {
    return TableRow(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[850]),
            padding: EdgeInsets.all(8),
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(singular, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(plural, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ]
    );
  }
}
