import 'package:get/get.dart';
import 'package:nexus_app/models/books_model.dart';
import 'package:nexus_app/repository/book_repository.dart';

class HomeController extends GetxController {
  RxString selected = 'GSEB'.obs;
  BookModel? bookmodel;
  RxBool isLoading = false.obs;
  var selectedBook = Rx<Books?>(null);
  RxInt page = 1.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isLoading(true);
    print(isLoading.toString());
    bookmodel = await BookRepository().getBooks(page.value);

    isLoading(false);

    print(isLoading.toString());
  }

  void setSelected(String value) {
    selected.value = value;
  }

  List<String> dropdownValues = [
    'GSEB',
    'NCERT',
    'MSHB',
    // Add more options as needed
  ];
}