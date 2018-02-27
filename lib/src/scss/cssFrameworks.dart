part of tlmsass;

animate() async {
  print("Building Animate");
  String css = await compile('bulma/bulma.sass');
  print("Saving Animate to: build/css/tlm-animate.css");
  new File('build/css/tlm-animate.css').writeAsStringSync(css);
}
customTLM() async {
  print("Building TLM CSS");
  String css = await compile('custom/tlm/tlm.scss');
  print("Saving TLM-CSS to: build/css/tlm.css ");
  new File('build/css/tlm.css').writeAsStringSync(css);
}
customTLMBrand() async {
  print("Building TLM CSS");
  String css = await compile('custom/tlm/tlm-brand.scss');
  print("Saving TLM-CSS to: build/css/tlm-brand.css ");
  new File('build/css/tlm-brand.css').writeAsStringSync(css);
}

custom(String name) async{
  String x = name;
  print("Building TLM " + x + " CSS");
  String css = await compile("custom/" + x + "/tlm-" + x + ".scss");
  print("Saving TLM-CSS to: build/css/tlm-addon-" + x + ".css");
  new File("build/css/tlm-addon-" + x + ".css").writeAsStringSync(css);
}

buildCustomSCSS(String name, brand) async{
  String x = name;
  String y = brand;
  print("Building TLM " + x + " CSS");
  String css = await compile("custom/" + x + "/" + x + ".scss");
  print("Saving TLM-CSS to: build/css/"+ y + "-" + x + ".css");
  new File("build/css/tlm-addon-" + x + ".css").writeAsStringSync(css);
}

BuildCustomSASS(String name, brand) async{
  String x = name;
  String y = brand;
  print("Building TLM " + x + " CSS");
  String css = await compile("custom/" + x + "/" + x + ".scss");
  print("Saving TLM-CSS to: build/css/"+ y + "-" + x + ".css");
  new File("build/css/tlm-addon-" + x + ".css").writeAsStringSync(css);
}