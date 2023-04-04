import 'package:family_financial_planning/utils/routes.dart';
import 'package:flutter/material.dart';

class MyNavBarFul extends StatefulWidget {
  const MyNavBarFul({Key? key});

  @override
  State<MyNavBarFul> createState() => _MyNavBarFulState();
}

class _MyNavBarFulState extends State<MyNavBarFul> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.indigo[900],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.indigo,
          tooltip: "Home Page",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet_outlined),
          label: "Financial Details",
          backgroundColor: Colors.indigo,
          tooltip:
              "Enter Your Financial Details and get to know more about plans of Family",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_outlined),
          label: "Goals",
          backgroundColor: Colors.indigo,
          tooltip: "Get to know your Goals! ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_sharp),
          label: "Profile",
          backgroundColor: Colors.indigo,
          tooltip: "Profile Page",
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          // Navigate to a new page when a BottomNavigationBarItem is tapped
          // switch (index) {
          //   // case 0:
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(builder: (context) => HomePage()),
          //   //   );
          //   //   break;
          //   // case 1:
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(builder: (context) => FinancialDetailsPage()),
          //   //   );
          //   //   break;
          //   // case 2:
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(builder: (context) => GoalsPage()),
          //   //   );
          //   //   break;
          //   case 3:
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ProfilePage()),
          //     );

          //     break;
          // }
        });
      },
    );
  }
}

// // Define your new pages as separate widgets

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       body: Center(
//         child: Text("This is the Home Page"),
//       ),
//     );
//   }
// }

// class FinancialDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Financial Details"),
//       ),
//       body: Center(
//         child: Text("This is the Financial Details Page"),
//       ),
//     );
//   }
// }

// class GoalsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Goals"),
//       ),
//       body: Center(
//         child: Text("This is the Goals Page"),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProfilePage();
//   }
// }
