
class HelperClasses {

  String convertStringUrlToPokemonId(String str){
    var regex = RegExp(r'(\d+)/?$');
    var match = regex.firstMatch(str);

    if (match != null) {
      return match.group(1) ?? "0";
    } else {
      return "0";
    }
  }

}