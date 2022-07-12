import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List tabs = ["最新", "最热", "学校"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                   
                    itemBuilder: (context, index) {
                      return MyNews();
                    }
                  );
  }
}
/*Scaffold(
        body: Center(
      child: MyNews(),
    ));*/

const List<String> list = ["要闻", "学术", "综合", "院系", "学者学生", "媒体"];
Widget photo = Image.asset("images/fu.png", width: 110.0);

class MyNews extends StatelessWidget {
  final String title = "title";
  final String info = "info";

  /*ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
    child:Image.asset("images/fu.png",width:110.0),);*/
  final String date = "2022-7-11";
  final String kinds = list[0];
  final int tem = 0;

  MyNews( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 200,
      width: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        alignment: AlignmentDirectional.bottomStart,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: const [
                //阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
            ),
          ),
          Positioned(
              left: 5.0,
              top: 5.0,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    height: 3.2,
                  ),
                ),
              )),
          Positioned(
            right: 5.0,
            top: 60.0,
            child: SizedBox(
              width: 150,
              height: 100,
              child: Text(
                info,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  height: 2.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: SizedBox(
                width: 70,
                height: 20,
                child: Row(
                  children: [
                    Text(
                      date,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        height: 1.0,
                      ),
                    ),
      /*Text(kinds,style: const TextStyle(
    color: Colors.grey,
    fontSize: 8.0,
    height: 1.0,  
  ),)*/
                  ],
                )),
          ),
          Positioned(
            child: SizedBox(
              width: 80,
              height: 150,
              child: photo,
            ),
            top: 5.0,
            right: 5.0,
          ),
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Text(
              "热度" + tem.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                height: 1.8,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
