import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  void gotoMainScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/tab-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/images/foodbg.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Delicious Meal'),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton.icon(
                //   onPressed: () => {gotoMainScreen(context)},
                //   icon: Icon(Icons.search),
                //   label: Text(
                //     'Let Start !',
                //     style: TextStyle(fontSize: 25),
                //   ),
                //   style: ButtonStyle(
                //       minimumSize: MaterialStateProperty.all(Size(150, 35)),
                //       foregroundColor:
                //           MaterialStateProperty.all<Color>(Colors.black),
                //       backgroundColor:
                //           MaterialStateProperty.all<Color>(Colors.orange),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15),
                //               side: BorderSide(color: Colors.red)))),
                // ),
                InkWell(
                  onTap: () => {gotoMainScreen(context)},
                  splashColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        'Let Start',
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orangeAccent.withOpacity(0.8), Colors.redAccent],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
