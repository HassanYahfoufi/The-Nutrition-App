import 'package:flutter/material.dart';

class PageWidget extends StatefulWidget {
  PageWidget({required this.home, required this.pageName, required this.body, this.onPressed, super.key});
  String pageName;
  List<Widget> body;
  void Function() home;
  void Function()? onPressed;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
            appBar: AppBar(actions: [IconButton(onPressed: widget.home, icon: Icon(Icons.home))], title: Text(widget.pageName)),
            floatingActionButton: ElevatedButton(onPressed: widget.onPressed, child: const Icon(Icons.add)),
            body: Column(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body /*const [Scaffold(body: Text("[PageWidget] Test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"),)]*/),
                )
              ],
            )
          );
  }
}


class SizedOutlinedButton extends StatefulWidget {
  SizedOutlinedButton({required this.text, required this.height, required this.width, super.key});
  String text;
  double height;
  double width;


  @override
  State<SizedOutlinedButton> createState() => _SizedOutlinedButtonState();
}

class _SizedOutlinedButtonState extends State<SizedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(height: widget.height, width: widget.width, child: OutlinedButton(onPressed: () {}, child: Text(widget.text)),),
      ],
    );
  }
}
