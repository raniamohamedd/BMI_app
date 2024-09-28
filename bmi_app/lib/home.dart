import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  double height = 165;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        title: Text('Body Mass Index',
            style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                m1(context, 'male'),
                SizedBox(
                  width: 15,
                ),
                m1(context, 'female')
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text('CM',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.black,
                      value: height,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                      },
                      max: 220,
                      min: 90,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                m2(context, 'weight'),
                SizedBox(
                  width: 15,
                ),
                m2(context, 'age')
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),  color: Colors.teal,),
              width: double.infinity,
            
              height: MediaQuery.of(context).size.height / 10,
              child: TextButton(
                
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Result(result: result, ismale: ismale, age: age);
                    }));
                  },
                  child: Text(

                    'Calculate',
                    style: Theme.of(context).textTheme.headlineLarge,
                    
                  )))
        ],
      )),
    );
  }

  Expanded m1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: ismale && type == 'male' || !ismale && type == 'female'
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2(BuildContext context, String m) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              m == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              m == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(   foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  heroTag: m == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      m == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(   backgroundColor: Colors.teal,
             foregroundColor: Colors.white,
                  heroTag: m == 'age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      m == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
