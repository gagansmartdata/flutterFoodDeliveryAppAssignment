
class CategoryListResponse {
  final int statusCode;
  final String message;
  final CategoryList data;

  CategoryListResponse({this.statusCode, this.message ,this.data});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return CategoryListResponse(
        statusCode: json['statusCode'], message: json['message'], data: CategoryList.fromJson(json['data']));
  }
}

class CategoryList {
  List<CategoryListData> listX = [];
  CategoryList(this.listX);
  factory CategoryList.fromJson(Map<String, dynamic> json) {
    List<CategoryListData> data = json['data'];
    return CategoryList(data);
  }
}


class CategoryListData {
  final String description;
  final String icon;
  final String title;
  CategoryListData({this.description, this.icon, this.title});
  factory CategoryListData.fromJson(Map<String, dynamic> json) {
    return CategoryListData( description: json['description'],
        icon: json['icon'],
        title: json['title']);
  }
}
