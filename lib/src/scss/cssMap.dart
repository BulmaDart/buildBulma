part of tlmsass;

class TLMSassConverter {
  String DirName;
  List<String> FileList;
  int Count;
}
class TLMcssConverter {
  String Brand;
  String DirName;
  String FileName;
  String Path;
  String _PL = "\\";
  bool _winos = Platform.isWindows;
  TLMSassConverter _tran;

  TLMcssConverter(TLMSassConverter SassDir){
  this._oscheck();
  if(SassDir != null){
    this._tran = SassDir;
    this._LoadData();
  }

  }
  _LoadData(){
    var fileName = this._tran.FileList[4].split(".");
    var brandName = this._tran.DirName.split("/");
    if (fileName[1] == "scss" && fileName[0].startsWith('_',0) == false){
      this.DirName = _tran.DirName.replaceAll("/", this._PL);
      this.FileName = _tran.FileList[4];
      this.Brand = brandName[3];
      this.Path = _tran.DirName;
      this.buildCSS();
    }
  }
  _oscheck(){
    if (this._winos != true){
      this._PL = "/";
    } else {
      this._PL = "\\";
    }

  }
  buildCSS() async{
    print("Building TLM " + this.Brand + " CSS");
    String css = await compile(this.Path + this._PL + this.FileName);
    new File("lib"+ this._PL+ "css" + this._PL + this.Brand +this._PL + this
        .Brand + ".css")
        .writeAsStringSync(css);
  }

}

class CreateDir {
  String DirName;
  String _PL = "\\";
  bool _winos = Platform.isWindows;
  TLMSassConverter _tran;

  CreateDir(TLMSassConverter SassDir) {
    this._oscheck();
    if(SassDir != null){
      this._tran = SassDir;
    }
//    print(SassDir.DirName);
    this._LoadData();
    this._CreateDir();

  }

  _CreateDir() {
    var fileName = this._tran.FileList[4].split(".");
    if (fileName[1] == "scss" && fileName[0].startsWith('_', 0) == false) {
      var brandName = this._tran.DirName.split("/");
      String Brand = brandName[3];
      this.DirName = _tran.DirName.replaceAll("/", this._PL);
     final myDir = new Directory('lib' + this._PL + 'css' + this._PL + Brand)
          .create(recursive: true)
      // The created directory is returned as a Future.
          .then((Directory directory) {
      });
    }
  }

  _LoadData() {
//  print(this._tran.FileList);
    var fileName = this._tran.FileList[4].split(".");
    if (fileName[1] == "scss" && fileName[0].startsWith('_', 0) == false) {
      this.DirName = _tran.DirName.replaceAll("/", this._PL);
    }
  }

  _oscheck() {
    if (this._winos != true) {
      this._PL = "/";
    } else {
      this._PL = "\\";
    }
  }
}
bool winos = Platform.isWindows;
String oscheck(){
  if (winos != true){
    return "/";
  } else {
    return "\\";
  }

}
