// import 'package:e_store/services/app_methods.dart';
// import 'package:flutter/material.dart';

// class ClearButtonWidget extends StatelessWidget {
//   const ClearButtonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//               onPressed: () {
//                 AppMethods.showMessageDialog(
//                   context,
//                   title: 'Clearing Wishlist!',
//                   message: 'Are you sure you want to clear your wishlist?',
//                   errorMessage: '',
//                   isError: false,
//                   fct: () {
//                     wishlistProvider.clearLocalWishlist();
//                     Navigator.pop(context);
//                   },
//                 );
//               },
//               icon: const Icon(
//                 Icons.delete_forever_rounded,
//                 color: Colors.red,
//               ),
//             ),;
//   }
// }