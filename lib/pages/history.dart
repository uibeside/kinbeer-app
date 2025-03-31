import 'package:flutter/material.dart';
import 'package:kinbeer_app/assets/solar_icons_icons.dart';

import '../widgets/emptyState.dart';

class HistoryPage extends StatefulWidget {
  final List<Map<String, String>> history; // List of maps containing text and image URL
  const HistoryPage({super.key, required this.history});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ປະຫວັດ"),
        centerTitle: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0.0),
            ),
            gradient: LinearGradient(
                colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: widget.history.isEmpty
          ? EmptyState() // Show empty state if history is empty
          : ListView.builder(
        itemCount: widget.history.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.05),
                  width: 1.0, // Adjust the width as needed
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              leading: widget.history[index]['card'] != null
                  ? Image.asset(
                widget.history[index]['card']!,
                width: 80,
              )
                  : SizedBox.shrink(),
              title: Text(widget.history[index]['text'] ?? 'ກິນເບຍເພື່ອເລຍເຜໃຈ'),
            ),
          );
        },
      ),
    );
  }
}
