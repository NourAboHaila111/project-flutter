class AppLink {
  static const String server = 'http://192.168.137.1:8000';

  static const String test = "$server/test";
  //categories
  static const String categories = '$server/user/showCategory';
  //items subcategories
  static const items = "$server/user/showSubcategory";
  //products
  static const product = "$server/user/showProducts";
  static const bestproduct = "$server/user/showProductsrandom";
  //productsdetiles
  static const productdetiles = "$server/user/showProductDetails";
  //cart
  static const cartviwe = "$server/user/showcart";
  static const cartadd = "$server/user/addToCart";
  static const cartdelet = "$server/user/deleteFromCart";
  static const sellerlogin = "$server/seller/login";
  static const admainlogin = "$server/admain/login";
  static const userlogin = "$server/user/login";
  //search
  static const search = "$server/user/search";
  static const imagecolor = "$server/user/showimage";
  //buy
  static const buy = "$server/user/buyitem";
  //location
  static const  addlocation = "$server/user/addlocation";
  static const editloc = "$server/user/editlocation";
  static const deletloc = "$server/user/deletelocation";
  static const viweloc = "$server/user/showlocations";
  //coupon
  static const addcoupon = "$server/user/showproductcoupon";
  //regester
  static const register = "$server/user/createAccount";
  static const code= "$server/user/confirmation";
  static const showrating= "$server/user/showrank";
//comment
  static const addcomment = "$server/user/comments";
  static const showcomments = "$server/user/showcomments";
  static const showusercomment = "$server/showusercomments";

}
