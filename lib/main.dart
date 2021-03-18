import 'package:custom_theme/app_checkbox.dart';
import 'package:custom_theme/app_radio.dart';
import 'package:custom_theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Theme Demo',
      theme: AppTheme.theme,
      home: MyHomePage(title: 'Flutter カスタムテーマ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _check1 = false;
  bool _check2 = false;
  int _radiogroupValue = 0;

  static final _today = DateTime.now();
  static final _lastDate = _today.add(Duration(days: 90));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                showDatePicker(context: context, firstDate: _today, initialDate: _today, lastDate: _lastDate);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Text('You have pushed the button this many times:'),
              ),
            ),
            Center(child: Text('$_counter', style: Theme.of(context).textTheme.headline5)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: kElevationToShadow[6],
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ユーザー',
                      hintText: 'ユーザーIDを入力',
                      helperText: '必須',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'パスワード',
                      hintText: 'パスワードを入力',
                      helperText: '必須',
                      errorText: 'パスワードを入力してください',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(child: Text('ElevatedButton'), onPressed: () {}),
                SizedBox(width: 4.0),
                ElevatedButton(child: Text('ElevatedButton'), onPressed: null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(child: Text('OutlinedButton'), onPressed: () {}),
                SizedBox(width: 4.0),
                OutlinedButton(child: Text('OutlinedButton'), onPressed: null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(child: Text('TextButton'), onPressed: () {}),
                SizedBox(width: 4.0),
                TextButton(child: Text('TextButton'), onPressed: null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: _check1, onChanged: (value) => setState(() => _check1 = value)),
                SizedBox(width: 4.0),
                AppCheckbox(value: _check2, onChanged: (value) => setState(() => _check2 = value)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                    value: 0,
                    groupValue: _radiogroupValue,
                    onChanged: (value) => setState(() => _radiogroupValue = value)),
                SizedBox(width: 4.0),
                AppRadio<int>(
                    value: 1,
                    groupValue: _radiogroupValue,
                    onChanged: (value) => setState(() => _radiogroupValue = value)),
              ],
            ),
            ElevatedButton(
              child: Text('ElevatedButton', style: TextStyle(fontSize: 16.0)),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  );
                }),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                    return null;
                  },
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
