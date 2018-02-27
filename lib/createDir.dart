import 'src/sassCompiler.dart';

List<String> customCSS;
void creatDir() {
  var customCSS = directoryList("CustomCSS");
  for(int i = 0; i < customCSS.length; i++){
    new CreateDir(customCSS[i]);
  }

}
