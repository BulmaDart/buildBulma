import 'src/sassCompiler.dart';

List<String> customCSS;
void compileCSS() {
  var customCSS = directoryList("CustomCSS");
  for(int i = 0; i < customCSS.length; i++){
  new TLMCSSConverter(customCSS[i]);
  }

}
void compilePlugins(){
  var customPlugins = directoryList("PluginsCSS");
  for(int i = 0; i < customPlugins.length; i++){
    new TLMCSSConverter(customPlugins[i], "Plugins");
  }
}
void compileFontAwesome(){
  var customPlugins = directoryList("FontAwesome");
  for(int i = 0; i < customPlugins.length; i++){
    new TLMCSSConverter(customPlugins[i], "FontAwesome");
  }
}

void _compile(String SourceCSSDirectory, [String CSSExportDirectory]){
  var customPlugins = directoryList(SourceCSSDirectory);
  for(int i = 0; i < customPlugins.length; i++){
    new TLMCSSConverter(customPlugins[i], CSSExportDirectory);
  }
}
void _copySupportFiles(String SourceCSSDirectory, [String CSSExportDirectory]){
  var customPlugins = directoryList(SourceCSSDirectory);
  for(int i = 0; i < customPlugins.length; i++){
    new CopySupportFiles(customPlugins[i], CSSExportDirectory);
  }
}

void compile(){
  for (int i = 0; i < DirSrcDst.length; i++){
    _compile(DirSrcDst[i]["SourceCSSDirectory"], DirSrcDst[i]["CSSExportDirectory"]);
  }
  for (int i = 0; i < SupportFiles.length; i++){
    _copySupportFiles(SupportFiles[i]["AssestDirectorySource"], SupportFiles[i]["AssestDirectoryDest"]);
  }

}
