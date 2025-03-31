import 'package:flutter/material.dart';
import '../assets/solar_icons_icons.dart';
import '../pages/rules.dart';

class CustomPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              SolarIcons.solar_shield_warning_bold_duotone,
              color: Color(0xFFF2C94C),
              size: 120.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            '‼️ ຢ່າຟ້າວ ‼️',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text('ໄປຕັ້ງກະຕິກາກ່ອນ ບໍ່ສັນສິບໍ່ມີຄົນໄດ້ກິນເບຍ'),
          SizedBox(
            height: 12,
          ),
          Text(
            '- ບອກກະຟັງແນ່ຕິ -',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                context,
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'ປິດ',
                gradientColors: [Color(0xFF4AE396), Color(0xFF27AE60)],
              ),
              buildButton(
                context,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RulesPage()),
                  );
                },
                text: 'ໄປທີ່ກະຕິກາ',
                gradientColors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildButton(
  BuildContext context, {
  required VoidCallback onTap,
  required String text,
  required List<Color> gradientColors, // Added the icon parameter
}) {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
