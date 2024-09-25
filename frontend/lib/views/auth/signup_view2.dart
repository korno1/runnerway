import 'package:flutter/material.dart';
import 'package:frontend/widgets/button/wide_button.dart';

class SignUpView2 extends StatelessWidget {
  const SignUpView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 106),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/auth/signup_course.png'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '평소에 선호하는',
                  style: TextStyle(
                    color: Color(0xFF1C1516),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '러닝 코스 태그를 골라주세요',
                  style: TextStyle(
                    color: Color(0xFF1C1516),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '러너분께 맞는 러닝 코스를 추천해드려요',
                  style: TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Expanded로 아래 내용을 화면 크기에 맞게 조정
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      // 버튼이나 다른 위젯의 크기를 적절하게 조정 가능
                      width: 100,
                      height: 50,
                      color: Colors.blue,
                      child: Center(
                        child: Text('Button'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: WideButton(
          text: '확인',
          isActive: true,
        ),
      ),
    );
  }
}
