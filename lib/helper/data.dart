import 'package:news/models/category_model.dart';
//import 'package:news/views/categories.dart';

List<CategoryModel> getcategories(){
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName= "Business";
  categoryModel.imgurl= "https://assets.entrepreneur.com/content/3x2/2000/20160602195129-businessman-writing-planning-working-strategy-office-focus-formal-workplace-message.jpeg?width=700&crop=2:1";
  category.add(categoryModel);
  //2
   categoryModel = new CategoryModel();
  categoryModel.categoryName= "General";
  categoryModel.imgurl= "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryModel);
  //3
   categoryModel = new CategoryModel();
  categoryModel.categoryName= "Health";
  categoryModel.imgurl= "https://www.mobihealthnews.com/sites/default/files/world%20health.jpg";
  category.add(categoryModel);
  //4
   categoryModel = new CategoryModel();
  categoryModel.categoryName= "Sports";
  categoryModel.imgurl= "https://www.adexchanger.com/wp-content/uploads/2020/04/sports-marketing-1.jpg";
  category.add(categoryModel);
  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName= "Entertainment";
  categoryModel.imgurl= "https://1yfd8w35xqq41q3ou63czp8h-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/350x215-FEAT-in-post-Entertainment.jpg";
  category.add(categoryModel);
  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName= "Technology";
  categoryModel.imgurl= "https://www.electronicsb2b.com/wp-content/uploads/2018/04/1-19.jpg";
  category.add(categoryModel);
  
  return category;
}