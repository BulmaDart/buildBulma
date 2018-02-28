import 'src/sassCompiler.dart';

List<String> customCSS;
void compileCSS() {
  var customCSS = directoryList("CustomCSS");
  for(int i = 0; i < customCSS.length; i++){
  new TLMcssConverter(customCSS[i]);
  }

}
void compilePlugins(){
  var customPlugns = directoryList("PluginsCSS");
  for(int i = 0; i < customPlugns.length; i++){
    new TLMcssConverter(customPlugns[i], "Plugins");
  }
}