class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: "Pick your food from our menu\n    More than 35 times",
      image: "assets/images/vegetables3.png",
      title: "Select from our\n  Best Menu"),
  UnboardingContent(
      description:
          "You can pay via Cash on delivery and online Payment methods",
      image: "assets/images/payment.png",
      title: "Easy and Online Payment"),
  UnboardingContent(
      description: "Delievering your food at your door steps",
      image: "assets/images/delivery.png",
      title: "Quick delivery at your door step")
];
