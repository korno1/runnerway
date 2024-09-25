import 'package:flutter/material.dart';

class SignupInput extends StatelessWidget {
  final String inputType;

  const SignupInput({Key? key, required this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;
    String suffixText;
    final double screenWidth = MediaQuery.of(context).size.width;
    // 조건에 따라 달라짐
    if (inputType == 'height') {
      text = '키';
      suffixText = 'cm';
    } else if (inputType == 'weight') {
      text = '몸무게';
      suffixText = 'kg';
    } else {
      text = '';
      suffixText = '';
    }

    return Container(
      width: (screenWidth - 150) / 2,
      padding: EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF1C1516),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    filled: true,
                    hintText: text,
                    hintStyle: TextStyle(
                      color: Color(0xFF72777A),
                    ),
                    fillColor: Color(0xFFE3E5E5).withOpacity(0.4),
                  ),
                  cursorColor: Colors.blueAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  suffixText,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
