import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice_first/animal.dart';
import 'package:getx_practice_first/bird.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //declaring a variable by Rx <type>
  var count = RxInt(0);
  //var name = RxString('');

  //declaring a variable by dart generics
  //var name = Rx<String>('');

  //making class observable by declaring all the variable as observable
  var animal = Animal();

  //making class observable by declaring class as observable
  var bird = Bird(name: 'Magpie').obs;

  void increase(){
    count++;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Practice'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=>Text('You have pressed the button for $count time(s)')),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: increase, child: const Text('Increment')),
                const SizedBox(height: 20,),

                //observable class by making all the variables observable
                Obx(() => Text('Animal name is ${animal.name.value}')),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){animal.name.value = animal.name.value.toUpperCase();}, child: const Text('Uppercase')),
                const SizedBox(height: 20,),

                //observable class by creating observable object of it
                Obx(() => Text('Bird name is ${bird.value.name}')),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){bird.update((val) {bird.value.name = bird.value.name.toUpperCase();});}, child: const Text('Uppercase')),


              ],
            ),
          ),
        ),
      )
    );
  }
}
