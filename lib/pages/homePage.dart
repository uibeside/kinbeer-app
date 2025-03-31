import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kinbeer_app/assets/solar_icons_icons.dart';
import 'package:kinbeer_app/pages/history.dart';
import 'package:kinbeer_app/pages/rules.dart';

import '../widgets/dialog.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int remainingCards = 52; // Initial remaining cards count
  int openedCards = 0; // Initial opened cards count
  List<Map<String, String>> history = []; // Store opened cards history
  String currentCardImage =
      "assets/images/card_black.png"; // Default card image

  // List of card images (You can replace with actual card images)
  final List<String> cardImages = [
    // Diamonds
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

    // Clubs
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

    // Hearts
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

    // Spades
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

  ];

  // Function to decrement the remaining cards and increment the opened cards
  void openCard() {
    if (remainingCards > 0) {
      // Randomly select a card image
      Random random = Random();
      String selectedCard = cardImages[random.nextInt(cardImages.length)];

      setState(() {
        remainingCards -= 1; // Decrease the remaining cards by 1
        openedCards += 1; // Increase the opened cards by 1
        currentCardImage = selectedCard; // Set the current card image
        history.add({
          'card': selectedCard,
        });

        // Remove the selected card from the cardImages list
        cardImages.remove(selectedCard); // Removes the selected card
      });
    } else {
      // Show the "No remaining cards" popup if remaining cards are 0
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    SolarIcons.solar_shield_warning_bold_duotone,
                    color: Color(0xFFF2C94C),
                    size: 96.0,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'ໄພ້ໝົດແລ້ວ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'ໄພ່ຖືກເປີດຫມົດແລ້ວ. ກະລຸນາ Reset ເພື່ອເລີ່ມເກມໃໝ່',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                SizedBox(height: 20),
                buildButton(
                  context,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: SolarIcons.solar_history_bold_duotone,
                  text: 'ຕົກລົງ',
                  gradientColors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: currentHeight * 0.07),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(),
                child: Image.asset("assets/images/kinbeer_logo.png",
                    height: currentHeight * 0.12),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: currentHeight * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      currentCardImage, // Swap the image based on the selected card
                      height: currentHeight * 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                'ໄພ້ທີ່ຍັງເຫຼືອ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '$remainingCards', // Display the remaining cards
                                style: TextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        Color(0xFFF2C94C),
                                        Color(0xFFF5B67A)
                                      ],
                                    ).createShader(
                                        Rect.fromLTWH(0, 0, 200, 50)),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              openCard(); // Call the openCard function when the button is tapped
                            },
                            child: Container(
                              margin: EdgeInsets.all(9.0),
                              child: Container(
                                width: 114.0,
                                height: 114.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFF2C94C),
                                      Color(0xFFF5B67A)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFF2C94C),
                                      spreadRadius: 1,
                                      blurRadius: 14,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(400),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      SolarIcons
                                          .solar_star_fall_minimalistic_2_bold_duotone,
                                      color: Colors.white,
                                      size: 48.0,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'ເປີດໄພ້',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                'ໄພ້ທີ່ເປີດແລ້ວ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '$openedCards', // Display the opened cards
                                style: TextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        Color(0xFFF2C94C),
                                        Color(0xFFF5B67A)
                                      ],
                                    ).createShader(
                                        Rect.fromLTWH(0, 0, 200, 50)),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    context,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RulesPage()));
                    },
                    icon: SolarIcons.solar_documents_bold_duotone,
                    text: 'ກະຕິກາ',
                    gradientColors: [Color(0xFF4AE396), Color(0xFF27AE60)],
                  ),
                  buildButton(
                    context,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(history: history), // Pass the history list
                        ),
                      );

                    },
                    icon: SolarIcons.solar_history_bold_duotone,
                    text: 'ປະຫວັດ',
                    gradientColors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
                  ),
                  buildButton(
                    context,
                    onTap: () {
                      setState(() {
                        remainingCards = 52; // Reset to the initial number of remaining cards
                        openedCards = 0; // Reset opened cards to 0
                        history.clear(); // Clear history
                        // Reset the cardImages list to the original set of 52 cards
                        cardImages.clear();  // Clear the current list of cards
                        cardImages.addAll([
                          // Re-add all 52 cards to the list
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
                        ]);
                        currentCardImage = "assets/images/card_black.png"; // Reset currentCardImage to its default value
                      });
                    },

                    icon: SolarIcons.solar_restart_bold_duotone,
                    text: 'ຄືນຄ່າ',
                    gradientColors: [Color(0xFFED6981), Color(0xFFEB5757)],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context,
      {required VoidCallback onTap,
      required IconData icon,
      required String text,
      required List<Color> gradientColors}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: 2.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
