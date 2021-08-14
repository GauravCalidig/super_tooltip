import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

void main() => runApp(MyApp());

// TODO: play around with the close object. Allow position to be set.
// override outside if tooltip is upside
// make sure that the tooltip content has a border from the close object
// add blur background to content

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          const Spacer(),
          const Center(child: TargetWidget()),
          const Spacer(),
        ],
      ),
    );
  }
}

class TargetWidget extends StatefulWidget {
  const TargetWidget({Key? key}) : super(key: key);

  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  @override
  Widget build(BuildContext context) {
    return SuperTooltipBuilder(
      key: const Key('tooltip'),
      tooltip: SuperTooltip(
        elevation: 8,
        closeTipObject: const CloseTipObject.outside(),
        arrowDecoration: const ArrowDecoration(
          distanceFromCenter: 16,
          baseWidth: 40,
          height: 30,
        ),
        borderDecoration: const BorderDecoration(
          color: Colors.black,
          width: 1,
        ),
        background: TipBackground(
          absorbPointerEvents: false,
          touchThrough: TouchThrough.square(),
        ),
        tipContent: TipContent(
          // position: TipPosition.side(TipDirection.down),
          // position: TipPosition.snap(SnapAxis.vertical),
          position: TipPosition.snapSide(TipDirection.right),
          // position: TipPosition.fromLTRB(30, 30, 30, 30),
          backgroundColor: Colors.pink,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              's e d  d i a m  v o l u p t u a . A t  v e r o  e o s  e t  a c c u s a m  e t  j u s t o  d u o  d o l o r e s  e t  e a  r e b u m ',
              softWrap: true,
            ),
          ),
        ),
      ),
      targetBuilder: (context, show) {
        return GestureDetector(
          onTap: () {
            show();
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
