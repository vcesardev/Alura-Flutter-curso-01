import 'package:flutter/material.dart';
import 'package:flutter_teste/difficulty.dart';

class Task extends StatefulWidget {
  final String title;
  final String pictureUrl;
  final int difficulty;

  const Task(
      {required this.title,
      required this.pictureUrl,
      required this.difficulty,
      key})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[100],
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black12,
                    ),
                    child: Image.network(
                      widget.pictureUrl,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 120,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Container(
                          child: DifficultyData(
                        difficultyLevel: widget.difficulty,
                      ))
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _nivel++;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            ),
                            Text('lvl up!',
                                style: TextStyle(color: Colors.white))
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.blue,
              ),
              height: 40,
              width: 400,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (_nivel / widget.difficulty) / 10),
                  ),
                  Text(
                    "Nível: $_nivel",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
