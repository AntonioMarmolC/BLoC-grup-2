import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocdemo/blocs/frases_bloc.dart';
import 'package:flutterblocdemo/respositories/frases_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => FrasesBloc(FrasesRepository()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc DEMO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<FrasesBloc, FrasesState>(
              builder: (context, state) {
                if (state is FraseCargada) {
                  return Text(
                    state.frase,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => // 1. Esto activara el frasesEvent
                  BlocProvider.of<FrasesBloc>(context).add(CargarFrase()),
              child: Text("Cargar Frase"),
            )
          ],
        ),
      ),
    );
  }
}
