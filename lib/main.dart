import 'dart:async';

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
      home: MyHomePage(title: 'Balance Game ver0.2'),
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
  int _timeLeft = 5;
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
  void _startCountDown(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      }
      else {
        timer.cancel();
      }
    });

  }
  final List<String> _questionBasic = [
    '''
    A. 핸드폰 액정 나가는데 보험 없음
    
    B. 에어팟 한 쪽 잃어버렸는데 6시간동안 
       차 타고 이동해야 함 ''',

    '''
    A. 핸드폰 배터리 15%
    
    B. 핸드폰 인터넷 안 됨''',

    '''
    A.평생 채소만 먹기
    
    B. 평생 치킨만 먹기''',

    '''
    A. 평생 라면 안 먹기
    
    B. 평생 탄산음료, 탄산수 안 먹기''',

    '''
    A. 존잘 노잼 남/여친, 
    근데 너무 재미없어서 짜증날 정도
    
    B. 존못 꿀잼 남/여친,
    근데 너무 못생겨서 키스 힘듦''',

    '''
    A.학점 4년 4.0 받고 대학 졸업까지 모쏠
    
    B. 학점 4년 2.5 받고 연애 
    원하는 만큼 함(깊이, 횟수 모두)''',

    '''
    둘 중 누구랑 사귐?
    
    A. 나만 바라보는 쏘스윗 이명박
    
    B. 나 때리는 강동원''',


    '''
    A. 선크림 안 바르고 더운 여름
     해변에 4시간 방치되기
    
    B. 선크림 위장마냥 바르고 
    강남 한복판 걷기
    ''',

    '''
    A. 김치찌개에 스팸 
    
    B. 김치찌개에 고기
    '''
    ,
    '''
    A. 애인 앞에서 용트름
    
    B. 애인 앞에서 똥방구
    '''
    ,
    '''
    A. 앞니에 고추가루 끼고 소개팅
    
    B. 바지지퍼 고장난 채로 소개팅
    '''
    ,
    '''
    여행지 갔는데 식당 딱 2곳 있음
    A. 2시간 기다려서 맛집 가기
    
    B. 사람 없는 곳 가기(무조건 맛 없음)
    '''
    ,
    '''
    A. 유급휴가 3일 받고 마지막 이틀동안 
    누워만 있을 정도로 아프기
    
    B. 그냥 출근하기
    '''
    ,
    '''
    A. 월 200 받고 주3일 출근(은퇴 60까지 쭉)
    
    B. 월 500 받고 주6일 출근(은퇴 60까지 쭉)
    '''
    ,
    '''
    A. 전남친/전여친 집에 실수로 내 택배 보내기
    (헤어진지 두 달 됨)
    
    B. 술먹고 전남친/전여친한테 새벽 2시에
     20통 전화했는데 통화기록 30분 있기
    (헤어진지 한 달 됨)
    '''
    ,
    '''
    A. 주량 소주 0잔 되기
    
    B. 주량 소주 10병 되기
    '''
    ,
    '''
    신박한 알약을 먹을 수 있는 기회가 옴.
    먹으면 피로감 따위 느낄 수 없게 됨.
    근데 12시엔 무조건 잠이 듦.
    
    A. 먹는다
    
    B. 안 먹는다
    '''
    ,
    '''
    A. 최애 음식 일주일동안 마음껏 먹기
    (근데 내가 진~~~짜 싫어하는 사람이랑
    얼굴 맞대고 먹어야 함)
    
    B. 내가 먹으면 헛구역질 하는 음식 
    내 최애 연예인이랑 일주일동안 먹기
    (남기면 안 됨)
    '''
    ,
    '''
    미용실 가서 머리 했는데,
    
    A. 실수로 눈썹 밀리기(한쪽 80%)
    
    B. 아줌마 펌 되기
    '''
    ,
    '''
    A. 6월에 호주 가기
    
    B. 12월에 동남아 가기
    '''
    ,
    '''
    A. 한 시간에 한 번씩 연락하는 애인
    
    B. 하루에 한 번씩 연락하는 애인
    (하루 한 번 이상은 절대 연락 안 받음)
    '''
    ,
    '''
    A. 설사 달고 살기
    
    B. 변비 달고 살기
    '''
    ,
    '''
    A. 평생 아메리카노 못 먹기
    
    B. 평생 밀가루 음식 못 먹기
    '''
    ,
    '''
    A. 10년 전으로 돌아가는데
    제일 친한 친구랑 친해질 수 없음
    (비트코인 쟁이기 가능,
    역사 안 바뀜)
    
    B. 10년 전으로 돌아가는데
    역사 예측 불가함
    '''
    ,
    '''
    A. 해외여행 가서 한식만 먹기
    
    B. 해외여행 가서 포켓몬고만 하기
    '''
    ,
    '''
    A. 12월 24일에 야근하기
    
    B. 12월 31일에 야근하기
    '''
    ,
    '''
    A. 크리스마스 이브에 회식하기
    (밤 10시까지 있어야 함, 
    그래도 맛있는 거 먹음)
    
    B. 크리스마스에 애인이랑 싸우기
    (도로에 나 버려서 
    집에 혼자 걸어와야 함)
    '''
    ,
    '''
    A. 애인이랑 3시간마다
    전화하는 친구랑 여행가기
    
    B. 사진 백만장 찍어달라는 
    친구랑 여행가기
    '''
    ,
    '''
    죽을 때까지 라면은 한종류만
    먹을 수 있다면
    A. 삼양라면
    
    B. 진라면(순한맛)
    '''
    ,
    '''
    특별한 능력이 하나 생긴다면
    A. 순간이동
    
    B. 지방 저장 컨트롤 능력
    '''
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
            Text(
              //Timer
                _timeLeft.toString(),
              style:  TextStyle(fontSize: 20)
            ),
            Container(
             // width: 120,
              //height: 30,
              child: RaisedButton(
                child: Text('선택지A'),
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
              //width: 120,
             // height: 30,
              child: RaisedButton(
                child: Text('선택지B'),
                onPressed: () {
                  setState((){
                    idx ++;
                    if (idx > _questionBasic.length - 1)
                      idx = 0;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
