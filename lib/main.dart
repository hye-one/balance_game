import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Balance Game ver0.1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });


  }
  final List<String> _questionBasic = [
    '''A. 핸드폰 액정 나가는데 보험 없음
       B. 에어팟 한 쪽 잃어버렸는데 6시간동안 
       차 타고 이동해야 함 ''',
        '''A. 핸드폰 배터리 15%
        B. 핸드폰 인터넷 안 됨''',
    '''A.평생 채소만 먹기
      B. 평생 치킨만 먹기''',
    '''A. 평생 라면 안 먹기
    B. 평생 탄산음료, 탄산수 안 먹기''',
    '''A. 존잘 노잼 남/여친, 근데 너무 재미없어서 짜증날 정도
    B. 존못 꿀잼 남/여친, 근데 너무 못생겨서 키스 힘듦''',
    '''A.학점 4년 4.0 받고 대학 졸업까지 모쏠
    B. 학점 4년 2.5 받고 연애 원하는 만큼 함(깊이, 횟수 모두)'''
  ];
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //'밸런스 게임 질문 들어갈 곳',
              _questionBasic[idx],
              style: TextStyle(fontSize: 20),

            ),

            Container(
              child: RaisedButton(
                child: Text("선택지A"),
                onPressed: () {
                  setState((){
                  idx ++;
                  if (idx > _questionBasic.length - 1)
                  idx = 0;
                    });
                  },
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text("선택지B"),
                onPressed: () {
                  setState((){
                    idx ^= 0x01;
                  });
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
