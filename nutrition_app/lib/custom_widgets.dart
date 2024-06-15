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

class bottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const bottomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
       items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
            ),
         BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining),
            label: 'Add New Food',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Add New \n Recipie',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.breakfast_dining),
            label: 'Add Consumed \n        Food',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Update Status',
            backgroundColor: Colors.green,
          ),
        ],
      

    );
  }
}