class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'FOOTBALL',
      image: 'assets/football.png',
      discription:
          "Tap on the football section to see hot news and highlights from around the football world. "),
  UnbordingContent(
      title: 'BASKETBALL',
      image: 'assets/bascket00.jpg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "),
  UnbordingContent(
      title: 'TENNIS',
      image: 'assets/tennis.png',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "),
];
