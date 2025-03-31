import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String? path;
  const EmptyState({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/data_not_found.png', width: 96,),
            SizedBox(
              height: 12,
            ),
            Text('ຍັງບໍ່ມີປະຫວັດເທື່ອ', style: TextStyle(
              fontSize: 16,
            ),)
          ],
        ) );
  }
}
