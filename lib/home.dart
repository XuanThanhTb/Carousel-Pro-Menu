import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:residemenu/residemenu.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}
class HomeState extends State<Home> with TickerProviderStateMixin{
  MenuController _menuController;
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  final myCaroul = Carousel(
    dotSize: 5,
    dotIncreaseSize: 2.0,
    borderRadius: true,
    radius: Radius.circular(10.0),
    animationCurve: Curves.easeOutSine,
    animationDuration: Duration(seconds: 5),
    images: [
      AssetImage('lib/images/a.jpg'),
      AssetImage('lib/images/b.jpg'),
      AssetImage('lib/images/dc.jpg'),
    ],
  );
  showDailog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text('Đăng nhập', style: TextStyle(fontSize: 18, color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: userName,
            ),
            TextField(
              controller: passWord,
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', style: TextStyle(color: Colors.black, fontSize: 18),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('CANCEL', style: TextStyle(color: Colors.black, fontSize: 18),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
     }
    );
  }
  @override
  void initState() {
    super.initState();
    _menuController = MenuController(vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    return ResideMenu.scaffold(
      // direction: ScrollDirection.LEFT,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/back.jpg'),
          fit: BoxFit.cover
        ),
      ),
      controller: _menuController,
      leftScaffold: MenuScaffold(
        header: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 80, maxWidth: 100),
          child:  CircleAvatar(
            backgroundImage: AssetImage('lib/images/back.jpg'),
            radius: 30,
          ),
        ),
        children: <Widget>[
          Material(
           color: Colors.transparent,
            child: new InkWell(
              child: ResideMenuItem(
                title: 'Share the App',
                 titleStyle: TextStyle(color: Colors.black),
                icon: const Icon(Icons.share, color: Colors.black),
              ),
              onTap: (){
              }
            ),
          ),
           Material(
            color: Colors.transparent,
            child: new InkWell(
              child: ResideMenuItem(
                title: 'Suggestions',
                titleStyle: TextStyle(color: Colors.black),
                icon: const Icon(Icons.bug_report, color: Colors.black),
              ),
              onTap: (){
              }
            ),
          ),
        ],
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.menu, color: Colors.black,),
            onTap: (){
              _menuController.openMenu(true);
            },
          ),
          title: Center(
          child: Text(
            'TOUGHEST',textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 20.0
              ),
              onPressed: () => showDailog(context),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: height/2.5,
              child: myCaroul,
            ),
          ],
        ),
      ),
    );
  }
}
// class MenuController extends AnimatedContainer{
//   MenuController({TickerProvider vsync});
// }