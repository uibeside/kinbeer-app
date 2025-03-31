import 'package:flutter/material.dart';
import 'package:kinbeer_app/assets/solar_icons_icons.dart';

import 'buttom_sheet.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPageState();
}
class _RulesPageState extends State<RulesPage> {
  final List<String> rules = [
    "ກິນໝົດແກ້ວ",
    "ກິນໝົດວົງ",
    "ເລືອກ 1 ຄົນກິນ",
    "ເລືອກ 2 ຄົນກິນ",
    "ຄົນທາງຂ້າງຊ້າຍກິນ",
    "ຄົນທາງຂ້າງຂວາກິນ",
    "ສອງຄົນທາງຂ້າງກິນ",
    "ຄຳຖາມສຸດ HOT 🔥"
  ];

  Map<int, List<String>> selectedCardsPerRule = {}; // Store selected cards for each rule

  void _showBottomSheet(BuildContext context, int ruleIndex) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return CardSelectionBottomSheet(
          cardImages: [
            "assets/images/cards/Diamonds_Ace.png",
            "assets/images/cards/Diamonds_2.png",
            "assets/images/cards/Diamonds_3.png",
            "assets/images/cards/Diamonds_4.png",
            "assets/images/cards/Diamonds_5.png",
            "assets/images/cards/Diamonds_6.png",
            "assets/images/cards/Diamonds_7.png",
            "assets/images/cards/Diamonds_8.png",
            "assets/images/cards/Diamonds_9.png",
            "assets/images/cards/Diamonds_10.png",
            "assets/images/cards/Diamonds_Jack.png",
            "assets/images/cards/Diamonds_Queen.png",
            "assets/images/cards/Diamonds_King.png",
            "assets/images/cards/Clubs_Ace.png",
            "assets/images/cards/Clubs_2.png",
            "assets/images/cards/Clubs_3.png",
            "assets/images/cards/Clubs_4.png",
            "assets/images/cards/Clubs_5.png",
            "assets/images/cards/Clubs_6.png",
            "assets/images/cards/Clubs_7.png",
            "assets/images/cards/Clubs_8.png",
            "assets/images/cards/Clubs_9.png",
            "assets/images/cards/Clubs_10.png",
            "assets/images/cards/Clubs_Jack.png",
            "assets/images/cards/Clubs_Queen.png",
            "assets/images/cards/Clubs_King.png",
            "assets/images/cards/Hearts_Ace.png",
            "assets/images/cards/Hearts_2.png",
            "assets/images/cards/Hearts_3.png",
            "assets/images/cards/Hearts_4.png",
            "assets/images/cards/Hearts_5.png",
            "assets/images/cards/Hearts_6.png",
            "assets/images/cards/Hearts_7.png",
            "assets/images/cards/Hearts_8.png",
            "assets/images/cards/Hearts_9.png",
            "assets/images/cards/Hearts_10.png",
            "assets/images/cards/Hearts_Jack.png",
            "assets/images/cards/Hearts_Queen.png",
            "assets/images/cards/Hearts_King.png",
            "assets/images/cards/Spades_Ace.png",
            "assets/images/cards/Spades_2.png",
            "assets/images/cards/Spades_3.png",
            "assets/images/cards/Spades_4.png",
            "assets/images/cards/Spades_5.png",
            "assets/images/cards/Spades_6.png",
            "assets/images/cards/Spades_7.png",
            "assets/images/cards/Spades_8.png",
            "assets/images/cards/Spades_9.png",
            "assets/images/cards/Spades_10.png",
            "assets/images/cards/Spades_Jack.png",
            "assets/images/cards/Spades_Queen.png",
            "assets/images/cards/Spades_King.png",
          ],
          onCardsSelected: (selectedCards) {
            setState(() {
              selectedCardsPerRule[ruleIndex] = selectedCards;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ກະຕິກາ"),
        centerTitle: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rules.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(rules[index]),
                      trailing: TextButton.icon(
                        onPressed: () {
                          _showBottomSheet(context, index);
                        },
                        icon: const Icon(SolarIcons.solar_add_circle_bold_duotone, color: Color(0xFF2F80ED)),
                        label: const Text("ເພີ່ມໄພ້"),
                        style: TextButton.styleFrom(foregroundColor: Color(0xFF2F80ED)),
                      ),
                    ),

                    // Show selected images for the current rule
                    if (selectedCardsPerRule.containsKey(index) && selectedCardsPerRule[index]!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: selectedCardsPerRule[index]!.map((imagePath) {
                            return Image.asset(
                              imagePath,
                              width: 80,
                              height: 120,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        ),
                      ),

                    Divider(color: Colors.black.withOpacity(0.12)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//
// class _RulesPageState extends State<RulesPage> {
//   final List<String> rules = [
//     "ກິນໝົດແກ້ວ",
//     "ກິນໝົດວົງ",
//     "ເລືອກ 1 ຄົນກິນ",
//     "ເລືອກ 2 ຄົນກິນ",
//     "ຄົນທາງຂ້າງຊ້າຍກິນ",
//     "ຄົນທາງຂ້າງຂວາກິນ",
//     "ສອງຄົນທາງຂ້າງກິນ",
//     "ຄຳຖາມສຸດ HOT 🔥"
//   ];
//   List<String> cardImagesmodkeo=[
//     "assets/images/cards/Hearts_Jack.png",
//     "assets/images/cards/Hearts_Queen.png",
//     "assets/images/cards/Hearts_King.png",
//   ];
//   // Function to show the bottom sheet
//   void _showBottomSheet(BuildContext context) {
//
//
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       isScrollControlled: true,
//       builder: (context) {
//         return CardSelectionBottomSheet(cardImages: [
//           // Diamonds
//           "assets/images/cards/Diamonds_Ace.png",
//           "assets/images/cards/Diamonds_2.png",
//           "assets/images/cards/Diamonds_3.png",
//           "assets/images/cards/Diamonds_4.png",
//           "assets/images/cards/Diamonds_5.png",
//           "assets/images/cards/Diamonds_6.png",
//           "assets/images/cards/Diamonds_7.png",
//           "assets/images/cards/Diamonds_8.png",
//           "assets/images/cards/Diamonds_9.png",
//           "assets/images/cards/Diamonds_10.png",
//           "assets/images/cards/Diamonds_Jack.png",
//           "assets/images/cards/Diamonds_Queen.png",
//           "assets/images/cards/Diamonds_King.png",
//
//           // Clubs
//           "assets/images/cards/Clubs_Ace.png",
//           "assets/images/cards/Clubs_2.png",
//           "assets/images/cards/Clubs_3.png",
//           "assets/images/cards/Clubs_4.png",
//           "assets/images/cards/Clubs_5.png",
//           "assets/images/cards/Clubs_6.png",
//           "assets/images/cards/Clubs_7.png",
//           "assets/images/cards/Clubs_8.png",
//           "assets/images/cards/Clubs_9.png",
//           "assets/images/cards/Clubs_10.png",
//           "assets/images/cards/Clubs_Jack.png",
//           "assets/images/cards/Clubs_Queen.png",
//           "assets/images/cards/Clubs_King.png",
//
//           // Hearts
//           "assets/images/cards/Hearts_Ace.png",
//           "assets/images/cards/Hearts_2.png",
//           "assets/images/cards/Hearts_3.png",
//           "assets/images/cards/Hearts_4.png",
//           "assets/images/cards/Hearts_5.png",
//           "assets/images/cards/Hearts_6.png",
//           "assets/images/cards/Hearts_7.png",
//           "assets/images/cards/Hearts_8.png",
//           "assets/images/cards/Hearts_9.png",
//           "assets/images/cards/Hearts_10.png",
//           "assets/images/cards/Hearts_Jack.png",
//           "assets/images/cards/Hearts_Queen.png",
//           "assets/images/cards/Hearts_King.png",
//
//           // Spades
//           "assets/images/cards/Spades_Ace.png",
//           "assets/images/cards/Spades_2.png",
//           "assets/images/cards/Spades_3.png",
//           "assets/images/cards/Spades_4.png",
//           "assets/images/cards/Spades_5.png",
//           "assets/images/cards/Spades_6.png",
//           "assets/images/cards/Spades_7.png",
//           "assets/images/cards/Spades_8.png",
//           "assets/images/cards/Spades_9.png",
//           "assets/images/cards/Spades_10.png",
//           "assets/images/cards/Spades_Jack.png",
//           "assets/images/cards/Spades_Queen.png",
//           "assets/images/cards/Spades_King.png",
//
//         ],);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ກະຕິກາ"),
//         centerTitle: false,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: rules.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         title: Text(rules[index]),
//                         trailing: TextButton.icon(
//                           onPressed: () {
//                             print('=====select:${rules[index]}');
//
//                              _showBottomSheet(context);
//                           },
//                           icon: const Icon(SolarIcons.solar_add_circle_bold_duotone, color: Color(0xFF2F80ED)),
//                           label: const Text("ເພີ່ມໄພ້"),
//                           style: TextButton.styleFrom(foregroundColor: Color(0xFF2F80ED)),
//                         ),
//                       ),
//
//                       // Show images only for index 0
//                       if (index == 0)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                           child: Wrap(
//                             spacing: 10,
//                             runSpacing: 10,
//                             children: cardImagesmodkeo.map((imagePath) {
//                               return Image.asset(
//                                 imagePath,
//                                 width: 40,  // Adjust size
//                                 height: 60, // Adjust size
//                                 fit: BoxFit.cover,
//                               );
//                             }).toList(),
//                           ),
//                         ),
//
//                       Divider(color: Colors.black.withOpacity(0.12)),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//
//     );
//   }
// }
