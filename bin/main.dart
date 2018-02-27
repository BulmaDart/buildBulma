import 'package:buildBulma/src/sassCompiler.dart' as tlm;

List<String> customCSS;

main(List<String> arguments) {
//  customCSS = ['admin', 'feed', 'flyer', 'forum', 'hero', 'inbox', 'index', 'login'];
  tlm.directoryList("CustomCSS");
 var customCSS = tlm.directoryList("CustomCSS");
//  print(customCSS);
/*
  for (var x in customCSS) {
    tlm.buildCustomSCSS(x.toString(), "tlm");
  }
*/
  for(int i = 0; i < customCSS.length; i++){
//    tlm.buildCustomSCSS(customCSS[i][""], brand);
  if (customCSS[i] != null){
    print(customCSS[i]);
    print(i);

  }
  if (customCSS[i] == null) {
    print(customCSS[i]);
    print(i);
  }

  }
}
