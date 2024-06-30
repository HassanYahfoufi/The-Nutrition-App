import 'package:flutter/material.dart';
import 'package:nutrition_app/main.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:fl_chart/fl_chart.dart';

class PageWidget extends StatefulWidget {
  PageWidget({this.home, required this.pageName, required this.body, required this.thisUser, this.onPressed, this.currentIndex = 0, super.key});
  String pageName;
  List<Widget> body;
  void Function()? home;
  void Function()? onPressed;
  int currentIndex;
  User thisUser;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
            resizeToAvoidBottomInset : true,
            appBar: AppBar(actions: [IconButton(onPressed: () => widget.home ?? Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(thisUser: widget.thisUser)),), icon: Icon(Icons.home)), /*IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUserPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),), icon: Icon(Icons.account_circle ))*/], title: Text(widget.pageName)),
            body: Column(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body /*const [Scaffold(body: Text("[PageWidget] Test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"),)]*/),
                )
              ],
            ),

            //bottomNavigationBar: bottomNavigationBar(currentIndex: widget.currentIndex, onTap: (index) => setState(() => widget.currentIndex = index),),
          );
  }
}




class SizedOutlinedButton extends StatefulWidget {
  SizedOutlinedButton({required this.text, required this.height, required this.width, this.onPressed, super.key});
  String text;
  double height;
  double width;
  void Function()? onPressed;


  @override
  State<SizedOutlinedButton> createState() => _SizedOutlinedButtonState();
}

class _SizedOutlinedButtonState extends State<SizedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(height: widget.height, width: widget.width, child: OutlinedButton(onPressed: widget.onPressed, child: Text(widget.text)),),
      ],
    );
  }
}

/*class bottomNavigationBar extends StatelessWidget {
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
            icon: Icon(Icons.home,),
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
}*/
class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
             spots: [
              FlSpot(1, 50), //temporary data
              FlSpot(2, 150),
              FlSpot(3, 100),
              FlSpot(4, 200),
              FlSpot(5, 250),
            ],
            isCurved: true,
           
      
           
          
          ),
        ],
        
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta){
              switch(value.toInt()){
                case 1:
                  return Text('January');
                case 2:
                  return Text('February');
                case 3:
                  return Text('March');
                case 4:
                  return Text('April');
                case 5:
                  return Text('May');
                case 6:
                  return Text('June');
                case 7:
                  return Text('July');
                case 8:
                  return Text('August');
                case 9:
                  return Text('September');
                case 10:
                  return Text('October');
                case 11:
                  return Text('November');
                case 12:
                  return Text('December');
                default:
                  return Container();
              }
            },
           interval: 1,
          )
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              
              showTitles: true,
            getTitlesWidget: (value, meta){
              switch(value.toInt()){
                case 50:
                  return Text('50');
                case 100:
                  return Text('100');
                case 150:
                  return Text('150');
                case 200:
                  return Text('200');
                case 250:
                  return Text('250');
                case 300:
                  return Text('300');
                
                default:
                  return Container();
              }
            },
            interval: 50,
            ),
          ),
        ),
      ),

    );
  }
}