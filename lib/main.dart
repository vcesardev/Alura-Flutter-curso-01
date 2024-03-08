import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Tarefas",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: ListView(
            children: [
              Task(
                title: "Andar de Bike",
                pictureUrl:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 3,
              ),
              Task(
                title: "Aula de piano",
                pictureUrl:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 4,
              ),
              Task(
                title: "Jogar",
                pictureUrl:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 2,
              ),
              Task(
                title: "Treinar",
                pictureUrl:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                difficulty: 3,
              ),
            ],
          ),
          floatingActionButton: ElevatedButton(
            child: Text("Oi"),
            onPressed: () {
              print("Apertei");
            },
          ),
        ));
  }
}

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
                        difficulty: widget.difficulty,
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

class DifficultyData extends StatelessWidget {
  final int difficulty;
  const DifficultyData({required this.difficulty, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (difficulty >= 1 ? Colors.blue : Colors.blue[100]),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficulty >= 2 ? Colors.blue : Colors.blue[100]),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficulty >= 3 ? Colors.blue : Colors.blue[100]),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficulty >= 4 ? Colors.blue : Colors.blue[100]),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (difficulty >= 5 ? Colors.blue : Colors.blue[100]),
        ),
      ],
    );
    ;
  }
}
