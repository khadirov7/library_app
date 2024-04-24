import '../models/categories.dart';
import '../models/file_data_model.dart';
class FileRepository{

  List<FileDataModel> books = [
    FileDataModel(
      imagePath:
      "https://w7.pngwing.com/pngs/875/325/png-transparent-book-cover-graphy-old-book-bookcase-used-book-textbook-thumbnail.png",
      bookName: "Oq Ko'rfaz",
      bookUrl: "https://n.ziyouz.com/books/jahon_nasri/Anor.%20Oq%20ko'rfaz%20(qissa).pdf",
      categoryModel: CategoryModel.edukasi,
    ),
    FileDataModel(
      imagePath:
      "https://kitobxon.com/img_knigi/3942.jpg",
      bookName: "Falsafa",
      bookUrl:
      "https://n.ziyouz.com/books/lugatlar/Falsafa%20(qomusiy%20lug'at).pdf",
      categoryModel: CategoryModel.horror,
    ),
    FileDataModel(
      imagePath:
      "https://kitobxon.com/img_knigi/3544.jpg",
      bookName: "Oq Kema",
      bookUrl:
      "https://n.ziyouz.com/books/jahon_nasri/Chingiz%20Aytmatov.%20Oqkema%20(qissa).pdf",
      categoryModel: CategoryModel.horror,
    ),
    FileDataModel(
      imagePath:
      "https://kitobxon.com/img_knigi/7460.jpg",
      bookName: "Bolaligim",
      bookUrl:
      "https://n.ziyouz.com/books/jahon_nasri/Chingiz%20Aytmatov.%20Bolaligim%20(qissa,%202008).pdf",
      categoryModel: CategoryModel.horror,
    ),
    FileDataModel(
      imagePath:
      "https://kitobman.uz/media/books/book_332/sir.PNG",
      bookName: "Sirli Olam 1",
      bookUrl:
      "https://n.ziyouz.com/books/turli_kitoblar/Sirli%20olam%20(1-to'plam).pdf",
      categoryModel: CategoryModel.horror,
    ),
    FileDataModel(
      imagePath:
      "https://ziyouz.uz/wp-content/uploads/2014/03/Aleksandr-Pushkin.-Suv-parisi.jpg",
      bookName: "Suv Parisi",
      bookUrl:
      "https://n.ziyouz.com/books/jahon_nasri/Aleksandr%20Pushkin.%20Suv%20parisi.pdf",
      categoryModel: CategoryModel.horror,
    ),

  ];
}