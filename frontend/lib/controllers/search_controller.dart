import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/course.dart';
import '../models/search_result.dart';
import '../services/search_service.dart';

class SearchBarController extends GetxController {
  var searchText = ''.obs;
  var suggestions = <String>[].obs;
  var isFocus = false.obs;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  // 검색 결과 관련 상태관리
  var searchResults = <Course>[].obs;

  var currentPage = 1.obs; // 현재 페이지
  var totalPages = 1.obs; // 전체 페이지 수

  var isLoading = false.obs;

  final SearchService _searchService = SearchService();

  @override
  void onInit() {
    super.onInit();

    // 현재 라우트 감지
    textEditingController.addListener(() {
      searchText.value = textEditingController.text;
      fetchSuggestions(textEditingController.text);
    });

    setFocus(true);
  }

  // 검색바 focus 상태 전환
  void setFocus(bool value) {
    isFocus.value = value;

    if (value) {
      // focus 요청
      focusNode.requestFocus();
    } else {
      // focus 해제
      focusNode.unfocus();
    }
  }

  // 검색어 초기화
  void clearSearch() {
    textEditingController.clear();
    searchText.value = ''; // Also reset the observable variable
    setFocus(false);
    suggestions.clear();
  }

  // 검색 자동완성 데이터 요청
  void fetchSuggestions(String query) async {
    log(query);
    if (query.isNotEmpty) {
      final results = await _searchService.getSuggestions(query);

      suggestions.assignAll(results);
    } else {
      suggestions.clear();
    }
  }

  // 공식 및 유저 검색 결과 가져오기
  void fetchSearchResults(String query) async {
    // 데이터를 가져오기 전까지 로딩 상태
    isLoading.value = true;

    try {
      if (query.isNotEmpty) {
        // 서비스로 검색 결과 리스트 요청
        final results = await _searchService.getCourseResults(query);
        log('검색 결과 controller : $results');

        // 공식 검색 결과 가져오기
        searchResults.assignAll(results);
      } else {
        searchResults.clear();
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // 페이지를 떠날 때 검색어 초기화
    focusNode.dispose();
    textEditingController.dispose();
    super.onClose();
  }
}
