import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();

  // initial selected value
  String DropDownvalue = '';

  //List of items in dropdown menu
  List<String> Things = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drop Down Menu',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                width: width * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                    value: name.text,
                    isDense: true,
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                    items: Things.map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        name.text = value!;
                        print("selected:- $value");
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Center(
                  child: Text(
                'CATEGORY PAGE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: name.text,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Things.add(name.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Add Successfully')));
                          print('Name Added:- ${name.text}');
                        });
                      },
                      child: const Text('Add')),
                  SizedBox(
                    width: width * 0.15,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Next')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
