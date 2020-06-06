abstract class ClientHttpInterface {
  void addToken(String token);
  Future get(String url);
}
