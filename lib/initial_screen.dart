import 'package:flutter/material.dart';
import 'package:flutter_teste/task.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
