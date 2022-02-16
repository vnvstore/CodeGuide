import '../DemoShapeScreen.dart';

class PainterScreenModal {
  String? shapeName;
  PaintType? paint;

  PainterScreenModal({this.shapeName, this.paint});


  static List<PainterScreenModal> getData(){

    List<PainterScreenModal> list = [];

    list.add(PainterScreenModal(shapeName: "Circle",paint: PaintType.CIRCLE));
    list.add(PainterScreenModal(shapeName: "Rectangle",paint: PaintType.RECTANGLE));
    list.add(PainterScreenModal(shapeName: "RoundRectangle",paint: PaintType.ROUND_RECTANGLE));
    list.add(PainterScreenModal(shapeName: "Triangle",paint: PaintType.TRIANGLE));
    list.add(PainterScreenModal(shapeName: "Line",paint: PaintType.LINE));


    return list;
  }
}
