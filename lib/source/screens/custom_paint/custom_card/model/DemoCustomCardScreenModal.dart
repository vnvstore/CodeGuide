class DemoCustomScreenModal {
  String? name;
  String? img;

  DemoCustomScreenModal({this.name, this.img});
}

List<DemoCustomScreenModal> getData() {
  List<DemoCustomScreenModal> list = [];
  list.add(DemoCustomScreenModal(name: 'John mike', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(DemoCustomScreenModal(name: 'john Doe ', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(DemoCustomScreenModal(name: 'Mike nelson', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(DemoCustomScreenModal(name: 'henry john', img: 'images/pricingPlans/planScreen1.jpg'));
  list.add(DemoCustomScreenModal(name: 'Alex hales', img: 'images/pricingPlans/planScreen1.jpg'));
  return list;
}
