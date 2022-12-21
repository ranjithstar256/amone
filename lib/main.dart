import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: SimpleLoginScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage('dddd'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String something;
  MyHomePage(this.something);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.something),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            widget.something,
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(onPressed: _incrementCounter, child: Text('hi'))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SimpleLoginScreen()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.ac_unit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({Key? key}) : super(key: key);

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  late TextEditingController s1 = TextEditingController(text: '');
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('Simple Login Screen'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                // your logic
                if (value == "hello") {
                  Fluttertoast.showToast(msg: "helo");
                } else {
                  Fluttertoast.showToast(msg: "other");
                }
              },
              itemBuilder: (BuildContext bc) {
                return const [
                  PopupMenuItem(
                    child: Text("Hello"),
                    value: 'hello',
                  ),
                  PopupMenuItem(
                    child: Text("About"),
                    value: 'about',
                  ),
                  PopupMenuItem(
                    child: Text("Contact"),
                    value: 'contact',
                  )
                ];
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Username',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32),
              ),
              TextField(
                  controller: s1,
                  decoration: InputDecoration(hintText: 'Enter Username')),
              Text('Password',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 32)),
              TextField(
                  decoration: InputDecoration(hintText: 'Enter Password')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Please replay!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: Text('Sign In'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green))),
                    ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  //which date will display when user open the picker
                                  firstDate: DateTime(1999),
                                  //what will be the previous supported year in picker
                                  lastDate: DateTime
                                      .now()) //what will be the up to supported date in picker
                              .then((pickedDate) {
                            //then usually do the future job
                            if (pickedDate == null) {
                              //if user tap cancel then this function will stop
                              return;
                            }
                            setState(() {
                              //for rebuilding the ui
                              _selectedDate = pickedDate;
                            });
                          });
                        },
                        child: Text('DateTimePicker'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green))),
                    ElevatedButton(
                        onPressed: () {
                          /*  showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Alert Dialog Box"),
                                    content: Text(
                                        "You have raised a Alert Dialog Box"),
                                    actions: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Fluttertoast.showToast(msg: "hi");
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("okay"),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("No"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));*/
                          AudioPlayer().pause();
                          //Navigator.of(context).push(MaterialPageRoute(
                          //    builder: (context) => MyHomePage(s1.text)));

                          // Navigator.pop(context);
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green))),
                    ElevatedButton(
                        onPressed: () {
                          //   FlutterBeep.beep();
                          // SystemSound.play(SystemSoundType.click);

                          Fluttertoast.showToast(msg: "msg");

                          AudioPlayer().play(AssetSource('vanthematharam.mp3'));
                        },
                        child: Text('Audio'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('$_selectedDate'),
                ],
              ),
              /*Image.network(
                  'https://www.androidmanifester.in/images/profile-pic.jpg',
                  height: 400,
                  width: 250)*/
            ],
          ),
        ));
  }
}

class MyApdp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Image Demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/ranjith.jpg'),
              Text(
                'A tablet is a wireless touch screen computer that is smaller than a notebook but larger than a smartphone.',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var _selectedDate;

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1999),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(child: Text('Add Date'), onPressed: _pickDateDialog),
        SizedBox(height: 20),
        Text(_selectedDate == null //ternary expression to check if date is null
            ? 'No date was chosen!'
            : 'Picked Date: ${DateFormat.yMMMMEEEEd().format(_selectedDate)}'),
      ],
    );
  }
}

/*
showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019, 1),
                              lastDate: DateTime(2021, 12),
                              builder: (context, picker) {
                                return Theme(
                                  //TODO: change colors
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: Colors.deepPurple,
                                      onPrimary: Colors.white,
                                      surface: Colors.pink,
                                      onSurface: Colors.yellow,
                                    ),
                                    dialogBackgroundColor: Colors.green[900],
                                  ),
                                  child: picker!,
                                );
                              }).then((selectedDate) {
                            //TODO: handle selected date
                            if (selectedDate != null) {
                              s1.text = selectedDate.toString();
                            }
                          });
* */
