import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/jwt_controller.dart';
import 'package:frontend/views/base_view.dart';
import 'package:frontend/views/mypage/modify_info_view.dart';
import 'package:frontend/widgets/line.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/modal/custom_modal.dart';

class MypageView extends StatelessWidget {
  MypageView({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());
  final JwtController jwtController = Get.put(JwtController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _authController.fetchUserInfo();

    return BaseView(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 56,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Container(
                height: 119,
                width: 119,
                decoration: BoxDecoration(
                    color: Color(0xFFE4E4E4),
                    border: Border.all(color: Color(0xFFE4E4E4), width: 2),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Obx(() => Text(
                    '${_authController.nickname.value}',
                    style: const TextStyle(
                      color: Color(0xFF1C1516),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            SizedBox(height: 10),
            Center(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color((0xFFA0A0A0)),
                    side: BorderSide(color: Color(0xFFA0A0A0)),
                    minimumSize: Size(77, 30),
                    maximumSize: Size(100, 40),
                  ),
                  onPressed: () {
                    _authController.logout();
                  },
                  child: Text("로그아웃")),
            ),
            Line(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '개인 상세 정보',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF1EA6FC)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ModifyInfoView()));
                      },
                      child: const Text(
                        '회원 정보 수정',
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        '${_authController.birthDate.value}',
                        style: const TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  SizedBox(height: 10),
                  Obx(() => Text(
                        '${_authController.height.value}',
                        style: const TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  SizedBox(height: 10),
                  Obx(() => Text(
                        '${_authController.weight.value}',
                        style: const TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  SizedBox(height: 10),
                  Obx(() => Text(
                        '${_authController.selectedGender.value}',
                        style: const TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomModal(
                              title: '회원탈퇴',
                              content: '정말로 회원탈퇴를 하시겠습니까?',
                              onConfirm: () {
                                _authController.remove();
                                Get.toNamed('/login');
                              },
                              confirmText: '확인',
                            );
                          });
                    },
                    child: Text(
                      '회원탈퇴',
                      style: TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )))
          ],
        ),
      ),
    ));
  }
}
