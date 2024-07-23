import 'package:flutter/material.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:nutrition_app/main.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/settings_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:fl_chart/fl_chart.dart';

class PageWidget extends StatefulWidget {
  PageWidget({this.home, required this.pageName, required this.body, required this.thisUser, this.onPressed, this.lastPage, this.editPage, this.currentIndex = 0, super.key});
  String pageName;
  List<Widget> body;
  void Function()? home;
  void Function()? onPressed;
  Widget? lastPage;
  Widget? editPage;
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
            backgroundColor: Colors.grey[300],

            appBar: AppBar(actions: [
      
              IconButton(onPressed: widget.home ?? (){debugPrint("[${widget.pageName}] widget.home was empty. Navigating to default which is HomePage()...");Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(thisUser: widget.thisUser)));}, icon: Icon(Icons.home), color: Colors.white), 
              (widget.lastPage != null) ? IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => widget.lastPage!),), icon: Icon(Icons.close ), color: Colors.white) : Container(),
              
              (widget.editPage != null) ? IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => widget.editPage!),), icon: Icon(Icons.edit ),color: Colors.white) : SizedBox.shrink(),
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(thisUser: widget.thisUser)),), icon: Icon(Icons.account_circle ), color: Colors.white),

              IconButton(onPressed: () { displayDialogSignOut(context);}, icon: Icon(Icons.exit_to_app), color: Colors.white),


            ], 
            title: Text(widget.pageName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
            backgroundColor: Colors.green,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body, ),
                ),
              ],
            ),
            //bottomNavigationBar: bottomNavigationBar(currentIndex: widget.currentIndex, onTap: (index) => setState(() => widget.currentIndex = index),),
          );
  }
}

class ViewAllPageWidget extends StatefulWidget {
  ViewAllPageWidget({this.home, required this.pageName, required this.body, required this.thisUser, this.onPressed, required this.createPage, this.currentIndex = 0, super.key});
  String pageName;
  List<Widget> body;
  void Function()? home;
  void Function()? onPressed;
  Widget createPage;
  int currentIndex;
  User thisUser;

  @override
  State<ViewAllPageWidget> createState() => _ViewAllPageWidgetState();
}

class _ViewAllPageWidgetState extends State<ViewAllPageWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
            resizeToAvoidBottomInset : true,
            appBar: AppBar(actions: [
              IconButton(onPressed: widget.home ?? (){debugPrint("[${widget.pageName}] widget.home was empty. Navigating to default which is HomePage()...");Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(thisUser: widget.thisUser)));}, icon: Icon(Icons.home)), 
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(thisUser: widget.thisUser)),), icon: Icon(Icons.account_circle ))
            ], 
            title: Text(widget.pageName)),
            body: Column(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body, ),
                ),
              ],
            ),
            floatingActionButton: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => widget.createPage),);}, child: const Icon(Icons.add)),
            //bottomNavigationBar: bottomNavigationBar(currentIndex: widget.currentIndex, onTap: (index) => setState(() => widget.currentIndex = index),),
          );
  }
}


class CardWidget extends StatefulWidget {
  CardWidget(
      {required this.title,
      required this.body,
      this.cardColor = const Color.fromARGB(135, 63, 41, 207),
      this.appBarColor = const Color.fromARGB(160, 18, 0, 138),
      this.onCardTap,
      super.key});
  Color cardColor;
  Color appBarColor;
  String title;
  List<Widget> body;
  void Function()? onCardTap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Card(
      
      color: widget.cardColor,
      elevation: 30,
      // clipBehavior is necessary because, without it, the InkWell's animation
      // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
      // This comes with a small performance cost, and you should not set [clipBehavior]
      // unless you need it.
      clipBehavior: Clip.hardEdge,


      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),

        onDoubleTap: widget.onCardTap,
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: widget.appBarColor,
                toolbarHeight: 25,
                title: Text(title), titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                automaticallyImplyLeading: false,
              ),
              ...widget.body,
            ],
          ),
        ),
      ),
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
        
        Container( height: widget.height, width: widget.width, child: OutlinedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll <Color>(Colors.green),), onPressed: widget.onPressed, child: Text(widget.text, style: TextStyle(color: Colors.white))),),
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
class WeightLineGraph extends StatefulWidget {
  const WeightLineGraph({super.key});

  @override
  State<WeightLineGraph> createState() => _WeightLineGraphState();
}

class _WeightLineGraphState extends State<WeightLineGraph> {
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
            color: Colors.green
      
           
          
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

void displayDialogSignOut(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        content: Text("Are you sure you want to sign out?"),

        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Sign Out", style: TextStyle(color: Colors.green),),
            
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/loginpage');
            },
            
          ),
        ],
      );
    },
  );
}

class CalorieLineGraph extends StatefulWidget {
  CalorieLineGraph({required this.spots, super.key});
  List<FlSpot> spots;

  @override
  State<CalorieLineGraph> createState() => _CalorieLineGraphState();
}

class _CalorieLineGraphState extends State<CalorieLineGraph> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
             spots: widget.spots,
            isCurved: true,
            color: Colors.green
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
class BMILineGraph extends StatefulWidget {
  BMILineGraph ({required this.spots, required this.minX, required this.maxX, super.key});
  List<FlSpot> spots;
  double minX;
  double maxX;

  @override
  State<BMILineGraph> createState() => _BMILineGraphState();
}

class _BMILineGraphState extends State<BMILineGraph> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      LineChartData(
        minX: 1,
        maxX: 10,
        lineBarsData: [
          LineChartBarData(
             spots: widget.spots,
            isCurved: true,
            color: Colors.green
      
           
          
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
                  return Text('January1');
                case 2:
                  return Text('February2');
                case 3:
                  return Text('March3');
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
                  return Text('Decemberrr');
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
                case 11.0:
                  return Text('11');
                case 12.0:
                  return Text('12');
                case 13.0:
                  return Text('13');
                case 14.0:
                  return Text('14');
                case 15.0:
                  return Text('15');
                case 16.0:
                  return Text('16');
                
                default:
                  return Container();
              }
            },
            interval: 1,
            ),
          ),
        ),
      ),

    );
  }
}

// Future <void> showTime(BuildContext context) async{
//     TimeOfDay userSelectedTime = TimeOfDay.now();
//    final TimeOfDay? time = await showTimePicker(context: context, initialTime: userSelectedTime, initialEntryMode: TimePickerEntryMode.dial);
//                       if(time != null){
//                         setState(() {
//                           userSelectedTime = time;
//                         });
//                       }
//                     }

