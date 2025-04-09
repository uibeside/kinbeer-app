// import 'package:flutter/material.dart';
//
// class CardSelectionBottomSheet extends StatefulWidget {
//   final List<String> cardImages;
//
//   CardSelectionBottomSheet({required this.cardImages});
//
//   @override
//   _CardSelectionBottomSheetState createState() =>
//       _CardSelectionBottomSheetState();
// }
//
// class _CardSelectionBottomSheetState extends State<CardSelectionBottomSheet> {
//   Set<int> selectedItems = {}; // Store selected card indices
//   bool isSelectAll = false;
//
//   // Function to group cards by suit
//   Map<String, List<int>> groupCardsBySuit() {
//     Map<String, List<int>> grouped = {
//       "Diamonds": [],
//       "Clubs": [],
//       "Hearts": [],
//       "Spades": [],
//     };
//
//     for (int i = 0; i < widget.cardImages.length; i++) {
//       if (widget.cardImages[i].contains("Diamonds")) {
//         grouped["Diamonds"]!.add(i);
//       } else if (widget.cardImages[i].contains("Clubs")) {
//         grouped["Clubs"]!.add(i);
//       } else if (widget.cardImages[i].contains("Hearts")) {
//         grouped["Hearts"]!.add(i);
//       } else if (widget.cardImages[i].contains("Spades")) {
//         grouped["Spades"]!.add(i);
//       }
//     }
//     return grouped;
//   }
//
//   void toggleSelection(int index) {
//     setState(() {
//       if (selectedItems.contains(index)) {
//         selectedItems.remove(index); // Deselect
//       } else {
//         selectedItems.add(index); // Select
//       }
//     });
//   }
//
//   void toggleSelectAll() {
//     setState(() {
//       if (isSelectAll) {
//         selectedItems.clear();
//       } else {
//         selectedItems = Set<int>.from(
//             List.generate(widget.cardImages.length, (index) => index));
//       }
//       isSelectAll = !isSelectAll;
//     });
//   }
//
//   void toggleSelectGroup(String suit, List<int> cardIndices) {
//     setState(() {
//       bool allSelected = cardIndices.every((index) => selectedItems.contains(index));
//       if (allSelected) {
//         selectedItems.removeAll(cardIndices);
//       } else {
//         selectedItems.addAll(cardIndices);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final groupedCards = groupCardsBySuit();
//
//     return DraggableScrollableSheet(
//       expand: false,
//       initialChildSize: 0.9, // 90% of screen height
//       minChildSize: 0.3,
//       maxChildSize: 0.9,
//       builder: (context, scrollController) {
//         return Container(
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//           ),
//           child: Column(
//             children: [
//               // Title & Select All Checkbox
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "ເລືອກໄພ້",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     children: [
//                       Text("(${selectedItems.length}/52) ເລືອກແລ້ວ"),
//                       Checkbox(
//                         value: isSelectAll,
//                         onChanged: (value) => toggleSelectAll(),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//
//               SizedBox(height: 10),
//
//               // Card List Grouped by Suit
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: groupedCards.entries.map((entry) {
//                       String suit = entry.key;
//                       List<int> cardIndices = entry.value;
//                       bool isGroupSelected = cardIndices.every((index) => selectedItems.contains(index));
//
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Suit Title with "Select All" Checkbox
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   suit,
//                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                                 Checkbox(
//                                   value: isGroupSelected,
//                                   onChanged: (value) => toggleSelectGroup(suit, cardIndices),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           // Card Grid for each suit
//                           GridView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: cardIndices.length,
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4, // 4 cards per row
//                               childAspectRatio: 0.7,
//                               crossAxisSpacing: 8,
//                               mainAxisSpacing: 8,
//                             ),
//                             itemBuilder: (context, index) {
//                               int cardIndex = cardIndices[index];
//                               bool isSelected = selectedItems.contains(cardIndex);
//                               return GestureDetector(
//                                 onTap: () => toggleSelection(cardIndex),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: isSelected ? Colors.blue : Colors.transparent,
//                                       width: 2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Stack(
//                                     children: [
//                                       Image.asset(
//                                         widget.cardImages[cardIndex],
//                                         fit: BoxFit.cover,
//                                       ),
//                                       if (isSelected)
//                                         Positioned(
//                                           top: 5,
//                                           right: 5,
//                                           child: Icon(Icons.check_circle, color: Colors.blue),
//                                         )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(height: 10), // Spacing between categories
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//
//               // Bottom Confirm Button
//               SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: selectedItems.isNotEmpty ? Colors.blue : Colors.grey[400],
//                     padding: EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: selectedItems.isNotEmpty
//                       ? () {
//                     print("Selected Cards: ${selectedItems.map((i) => widget.cardImages[i]).toList()}");
//                     print("Selected length: ${selectedItems.map((i) => widget.cardImages[i]).toList().length}");
//                   }
//                       : null,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.add, color: Colors.white),
//                       SizedBox(width: 5),
//                       Text("ເພີ່ມ", style: TextStyle(fontSize: 16, color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:kinbeer_app/assets/solar_icons_icons.dart';
import 'package:kinbeer_app/pages/db_helper.dart';

class CardSelectionBottomSheet extends StatefulWidget {
  final List<String> cardImages;
  final Function(List<String>) onCardsSelected;

  const CardSelectionBottomSheet({
    Key? key,
    required this.cardImages,
    required this.onCardsSelected,
  }) : super(key: key);

  @override
  _CardSelectionBottomSheetState createState() =>
      _CardSelectionBottomSheetState();
}

class _CardSelectionBottomSheetState extends State<CardSelectionBottomSheet> {
  Set<int> selectedItems = {};
  bool isSelectAll = false;

  // Function to group cards by suit
  Map<String, List<int>> groupCardsBySuit() {
    Map<String, List<int>> grouped = {
      "ໂພດຳ": [],
      "ໂພແດງ": [],
      "ດອກຈິກ": [],
      "ເຂົ້າຫຼາມຕັດ": [],



    };

    for (int i = 0; i < widget.cardImages.length; i++) {
      if (widget.cardImages[i].contains("Diamonds")) {
        grouped["ເຂົ້າຫຼາມຕັດ"]!.add(i);
      } else if (widget.cardImages[i].contains("Clubs")) {
        grouped["ດອກຈິກ"]!.add(i);
      } else if (widget.cardImages[i].contains("Hearts")) {
        grouped["ໂພແດງ"]!.add(i);
      } else if (widget.cardImages[i].contains("Spades")) {
        grouped["ໂພດຳ"]!.add(i);
      }
    }
    return grouped;
  }


  void toggleSelection(int index) {
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index); // Deselect
      } else {
        selectedItems.add(index); // Select
      }
    });
  }

  void toggleSelectGroup(String suit, List<int> cardIndices) {
    setState(() {
      bool allSelected = cardIndices.every((index) => selectedItems.contains(index));
      if (allSelected) {
        selectedItems.removeAll(cardIndices);
      } else {
        selectedItems.addAll(cardIndices);
      }
    });
  }

  void _confirmSelection() async {
  List<String> selectedCardImages =
      selectedItems.map((i) => widget.cardImages[i]).toList();

  await DatabaseHelper.instance.saveSelectedCards(selectedCardImages);
  widget.onCardsSelected(selectedCardImages);

  Navigator.pop(context);
}


  @override
void initState() {
  super.initState();
  _loadSelectedCards();
}

Future<void> _loadSelectedCards() async {
  List<String> savedCards = await DatabaseHelper.instance.getSelectedCards();
  setState(() {
    selectedItems = savedCards
        .map((image) => widget.cardImages.indexOf(image))
        .where((index) => index != -1)
        .toSet();
  });
}


  @override
  Widget build(BuildContext context) {
    Map<String, List<int>> groupedCards = groupCardsBySuit();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Title & Select All Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ເລືອກໄພ້",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text("(${selectedItems.length}/52) ເລືອກແລ້ວ"),
                      Checkbox(
                        value: isSelectAll,
                        onChanged: (value) => setState(() {
                          isSelectAll = value!;
                          if (isSelectAll) {
                            selectedItems = Set<int>.from(
                                List.generate(widget.cardImages.length, (index) => index));
                          } else {
                            selectedItems.clear();
                          }
                        }),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),

              // Grouped Cards with Select All option per suit
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: groupedCards.keys.map((suit) {
                    List<int> cardIndices = groupedCards[suit]!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Suit Title & Select All Checkbox for each group
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              suit,
                              style: TextStyle(fontSize: 16,),
                            ),
                            Checkbox(
                              value: cardIndices.every((index) => selectedItems.contains(index)),
                              onChanged: (value) => toggleSelectGroup(suit, cardIndices),
                            ),
                          ],
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 6,
                          ),
                          itemCount: cardIndices.length,
                          itemBuilder: (context, index) {
                            int cardIndex = cardIndices[index];
                            return GestureDetector(
                              onTap: () => toggleSelection(cardIndex),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Card Image
                                  Image.asset(
                                    widget.cardImages[cardIndex],
                                    width: 80,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                  // Gradient Border when selected
                                  if (selectedItems.contains(cardIndex))
                                    Container(
                                      width: 86,
                                      height: 116,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            colors: [
                                              Color(0xFF2F80ED),
                                              Color(0xFF4D55F0)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ).createShader(bounds);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 16),
              SizedBox(height: 8),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: selectedItems.isNotEmpty
                      ? LinearGradient(
                    colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                      : LinearGradient(
                    colors: [Colors.grey[100]!, Colors.grey[200]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.22),
                    width: 2.0,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: selectedItems.isNotEmpty ? _confirmSelection : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(SolarIcons.solar_add_circle_bold_duotone, color: Colors.white),
                      SizedBox(width: 8),
                      Text("ເພີ່ມ", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
