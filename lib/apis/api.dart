abstract class Apis{
  String baseUrl = "https://cambodai-banking-app.herokuapp.com";
  String loginUrl = "/api/oauth/token";
  String registerUrl="/api/oauth/open/account";

  Map<String,String>headers ={
    "Content-Type": "application/json"
  };
}