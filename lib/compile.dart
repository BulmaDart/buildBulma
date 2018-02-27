import 'src/sassCompiler.dart';

List<String> customCSS;
void compileCSS() {
  var customCSS = directoryList("CustomCSS");
  for(int i = 0; i < customCSS.length; i++){
  new TLMcssConverter(customCSS[i]);
  }

}
