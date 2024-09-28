import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.result,
      required this.ismale,
      required this.age});
  final double result;
  final bool ismale;
  final int age;
  String get re {
    String re = '';
    if (result >= 30)
      re = 'Obese';
    else if (result > 25 && result < 30)
      re = 'Overweight';
    else if (result >= 18.5 && result < 30)
      re = 'Normal';
    else
      re = 'Thin';
    return re;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        title: Text('Result', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
      
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Center(
                  child: Text('Gender: ${ismale ? 'Male ' : 'Famel'}',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Center(
                  child: Text('BMI: ${result.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
            ),
          
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Center(
                  child: Text(
                    'Healthness: ${re}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Center(
                  child: Text(
                    'Age: ${age}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            )
         ]     ),

      )),
    );
  }
}
