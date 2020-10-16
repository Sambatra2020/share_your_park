class SliderModel {
  String imagePath;
  String title;
  String desc;
  SliderModel({this.imagePath, this.title, this.desc});
  void setImageAssetPath(String getImagepath) {
    imagePath = getImagepath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1slide
  sliderModel.setImageAssetPath("assets/Calque 2.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //2slide
  sliderModel.setImageAssetPath("assets/Group 51.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();
  return slides;
}
