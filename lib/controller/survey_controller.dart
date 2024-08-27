import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_quill/quill_delta.dart';
import 'package:get/get.dart';
import 'package:mbs/data/api/api_client.dart';
import 'package:mbs/data/model/category_model.dart';
import 'package:mbs/data/model/response/survey_model.dart';
import 'package:mbs/data/repository/survey_repo.dart';

class SurveyController extends GetxController implements GetxService {
  SurveyRepo surveyRepo;
  final ApiClient apiClient;
  SurveyController({
    required this.apiClient,
    required this.surveyRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  List<Survey> _survey = [];
  List<Survey> get survey => _survey;

  Future<bool> inistializeSurvey(BuildContext context) async {
    _isLoading = true;
    _survey = [];
    update();

    Response? response = await surveyRepo.getSurveyList(apiClient: apiClient);

    if (response?.statusCode == 201) {
      final responseData = response?.body;

      if (responseData != null) {
        if (responseData['data'] != null && responseData['data'] is List) {
          _survey = (responseData['data'] as List)
              .map((model) => Survey.fromJson(model))
              .toList();
        }
      }

      _isLoading = false;
      update();
      return true;
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }

  CategoryModel? selectSubCategories(CategoryModel category, bool isSelected,
      {int depth = -1, int maxDepth = -1}) {
    if (depth == maxDepth) return null;

    for (var subCategory in category.category) {
      subCategory.isSelected = isSelected;
      if (isSelected) {
        return subCategory;
      }
      var selectedSubCategory = selectSubCategories(subCategory, isSelected,
          depth: depth + 1, maxDepth: maxDepth);
      if (selectedSubCategory != null) {
        return selectedSubCategory;
      }
    }
    return null;
  }

  //converting formated description page to string
  // List<Map<String, dynamic>> convertDocumentToString(
  //     QuillController controller) {
  //   final Delta delta = controller.document.toDelta();
  //   final List<Map<String, dynamic>> jsonString = delta.toJson();
  //   return jsonString;
  // }
  //using it
  //String formattedDocumentString = convertDocumentToString(_controller);

  //converting string back to formated description
  // QuillController convertStringToController(String jsonString) {
  //   final Delta delta = Delta.fromJson(json.decode(jsonString));
  //   final QuillController controller = QuillController(
  //     document: Document.fromDelta(delta),
  //     selection: TextSelection.collapsed(offset: 0),
  //   );
  //   return controller;
  // }
  //using it
  //QuillController restoredController = convertStringToController(retrievedString);
}
