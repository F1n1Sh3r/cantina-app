// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'dashboard_provider.dart';
//
// class Dashboard extends StatelessWidget {
//   const Dashboard({required Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DashboardProvider>(
//       create: (context) => DashboardProvider(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Http Gateway"),
//         ),
//         body: Consumer<DashboardProvider>(
//           builder: (context, dashboardProvider, _) {
//             if (dashboardProvider.isLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(dashboardProvider.post.title),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
