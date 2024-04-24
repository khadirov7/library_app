
import 'categories.dart';

class FileDataModel {
  FileDataModel({
    required this.bookName,
    required this.bookUrl,
    required this.imagePath,
    required this.categoryModel,
  });

  final String bookName;
  final String bookUrl;
  final String imagePath;
  final CategoryModel categoryModel;
}