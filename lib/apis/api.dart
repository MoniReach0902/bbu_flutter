abstract class Apis{
  String baseUrl = "http://143.198.88.147:20022";
  String loginUrl = "/api/oauth/token";
  String registerUrl="/api/oauth/open/account";
  String getCategoryUrl="/api/app/category/list";
  Map<String,String>headers ={
    "Content-Type": "application/json",

  };

  Map<String, String> headerWithToken(String token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }
}