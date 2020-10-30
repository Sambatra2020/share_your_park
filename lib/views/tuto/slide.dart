class Slide {
  String title;
  String image;
  String description;
  Slide(this.title, this.image, this.description);
}

List<Slide> listSlide = [
  Slide(
      'Partage ton stationnement lors de ton départ ! 😎🚗',
      'assets/images/anim1.gif',
      'Au moment de partir, tu avertis la communauté qu’une place de stationnement vient de se libérer'),
  Slide(
      'Tu aideras ainsi ceux qui cherchent une place 🔍 🚙',
      'assets/images/anim2.gif',
      'Proche de sa destination, un automobiliste en recherche de stationnement se verra avertir de la disponibilité de ta place !'),
  Slide(
      'Et le schéma s’appliquera pour toi aussi ! 😎',
      'assets/images/anim3.gif',
      'L’automobiliste en recherche de stationnement peut alors se garer sur l’emplacement que tu as liberé !')
];
