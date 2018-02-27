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
    var fileName = this._tran.FileList[2].split(".");
    var brandName = this._tran.DirName.split("/");
    if (fileName[1] == "scss" && fileName[0].startsWith('_',0) == false){
      this.DirName = _tran.DirName.replaceAll("/", this._PL);
      this.FileName = _tran.FileList[2];
      this.Brand = brandName[1];
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
    print(this.Brand);
    print("Building TLM " + this.Brand + " CSS");
    String css = await compile(this.Path + this._PL + this.FileName);
    var FileExt = this.FileName.split(".");
    print("Saving TLM-CSS to: build/css/"+ this.Brand + "-" + this.Brand + ".css");
    new File("build" +this._PL + "css" + this._PL + this.DirName + this._PL + this.Brand + ".css").writeAsStringSync(css);
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
    this._LoadData();
    this._CreateDir();

  }

  _CreateDir() {
    var fileName = this._tran.FileList[2].split(".");
    if (fileName[1] == "scss" && fileName[0].startsWith('_', 0) == false) {
      this.DirName = _tran.DirName.replaceAll("/", this._PL);
     final myDir = new Directory('build' + this._PL + 'css' + this._PL + this
          .DirName)
          .create(recursive: true)
      // The created directory is returned as a Future.
          .then((Directory directory) {
        print(directory.path);
      });
    }
  }

  _LoadData() {
    var fileName = this._tran.FileList[2].split(".");
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