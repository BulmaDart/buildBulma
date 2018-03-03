import 'src/sassCompiler.dart';

List<String> customCSS;
void creatDir() {
  var customCSS = directoryList("CustomCSS");
  for(int i = 0; i < customCSS.length; i++){
    new CreateDir(customCSS[i]);
  }
}
void createPluginsDir(){
  var customPlugins = directoryList("PluginsCSS");
  for(int i = 0; i < customPlugins.length; i++){
    new CreateDir(customPlugins[i], "Plugins");
  }

}
void _create(String SourceCSSDirectory, [String CSSExportDirectory]){
  var customPlugins = directoryList(SourceCSSDirectory);
  for(int i = 0; i < customPlugins.length; i++){
    new CreateDir(customPlugins[i], CSSExportDirectory);
  }

}
void _createSupport(String SourceCSSDirectory, [String CSSExportDirectory]){
  var customPlugins = directoryList(SourceCSSDirectory);
  for(int i = 0; i < customPlugins.length; i++){
    new CreateSupportDir(customPlugins[i], CSSExportDirectory);
  }

}


void create(){
  for (int i = 0; i < DirSrcDst.length; i++){
    _create(DirSrcDst[i]["SourceCSSDirectory"], DirSrcDst[i]["CSSExportDirectory"]);
  }
  print("CSS Directorys created.");

  for (int i = 0; i < SupportFiles.length; i++){
    _createSupport(SupportFiles[i]["AssestDirectorySource"], SupportFiles[i]["AssestDirectoryDest"]);
  }
  print("Support Directorys as well :)");

}