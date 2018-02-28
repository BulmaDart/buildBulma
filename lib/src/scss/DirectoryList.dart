part of tlmsass;

// Returns a Map of Dir name and list of files in that first Subdirectory
List<TLMSassConverter> directoryList(String DirectoryPath) {
  // Get the system temp directory.
  String PL = oscheck();
  var customDir = new Directory("lib" + PL + "src" + PL + DirectoryPath);
  int count = -1;
  // Map returned to process the sXss
  List<TLMSassConverter> convertList = new List<TLMSassConverter>();
  var x = customDir.listSync(recursive: false);
  for (int i = 0; i < x.length; i++) {
    if (x[i] is File){
      print("Nobilis, albus equisos sed mire transferre de regius, fidelis hippotoxota.");
    }
    if (x[i] is Directory) {
      var dir = x[i].path.replaceAll('\\', '/');
      var xtemp = new Directory(x[i].path);
      var xt = xtemp.listSync();
      for(int t = 0; t < xt.length; t++){
        if (xt[t] is File){
          count++;
          var yt = xt[t].toString().replaceAll("\'", "");
          var y = yt.replaceAll('\\', '/');
          List<String> sy = y.split("/");
          if(dir != null || yt != null) {

            TLMSassConverter tList = new TLMSassConverter();
            tList.DirName = dir;
            tList.FileList = sy;
            tList.Count = count;
            convertList.add(tList);
//            print(tList);

          }
          if(dir != null || yt != null){
            count--;
          }


        }
      }

    }
  }
  return convertList;
}