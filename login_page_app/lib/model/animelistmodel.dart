class AnimeList {
  late final List<Anime> animeList;
  
  AnimeList({required this.animeList});
  
  AnimeList.fromJson(Map<String,dynamic> json){
    if(json['data']!=null){
      animeList= [];
      for(var model in json['data']) {
        animeList.add(Anime.fromJson(model));
      }
    }   
  }
  List<Anime> get getList => animeList;
}


class Anime{
  late final String title;
  late final String synopsis;
  late final String imageUrl;
  Anime({
    required this.title,
    required this.synopsis,
    required this.imageUrl,
  });
  Anime.fromJson(Map<String,dynamic> json) {
    title = json['title'] ?? "";
    synopsis = json['synopsis'] ?? ""; 
    imageUrl = json['images']['jpg']['large_image_url'] ?? "";
  }
}

