// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:with_tft/home/view/home_view.dart';
// import 'package:with_tft/home/widget/draggable_button.dart';
// import 'package:with_tft/login/bloc/login_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String selectedCategory = '팀구하기';

//   @override
//   Widget build(BuildContext context) {
//     final loginBloc = BlocProvider.of<LoginBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: Text('WITH TFT',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontSize: 20)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50.0),
//               child: Text(
//                 loginBloc.state.user.name,
//                 style: const TextStyle(
//                     fontSize: 16,
//                     overflow: TextOverflow.ellipsis,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20.0),
//                   width: double.infinity,
//                   height: 50.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20.0),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.8),
//                         spreadRadius: 1, // 그림자 크기
//                         blurRadius: 0, // 블러
//                         offset: Offset(5, 6), // 그림자의 위치 (가로, 세로)
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       buildCategoryButton('팀구하기'),
//                       buildCategoryButton('시너지'),
//                       buildCategoryButton('프로필'),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               )
//             ],
//           ),
//           HomeView(),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton:
//           selectedCategory == '팀구하기' ? DraggableButton() : null,
//     );
//   }

//   Widget buildCategoryButton(String category) {
//     bool isSelected = selectedCategory == category;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedCategory = category;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.black : Colors.transparent,
//           borderRadius: BorderRadius.all(
//             Radius.circular(15.0),
//           ),
//         ),
//         child: Text(
//           category,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
