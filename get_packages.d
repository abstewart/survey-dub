import std.stdio;
import std.process;
import std.string;
import std.file;
import std.algorithm;

string OUTFILE = "packages.txt";

// void main () {
//   auto ret = executeShell ("echo hithere how are you?");
//   writeln (ret.output);
//}

void main () {
  auto output = executeShell (`dub search ""`);
  auto lines = splitLines(output.output);
  string[] packages;
  foreach (string l ; lines){
    packages ~= l.split(" ")[2];
  }
  //remove the first one since it's info from the command
  //and not a valid package
  packages = packages.remove(0);

  //clear out the file in case it already exists
  if (std.file.exists(OUTFILE)){ 
    std.file.remove(OUTFILE);
  }

  //print all the packages
  std.file.append (OUTFILE, packages.join ("\n"));
  writeln (packages.length);
  // foreach (string p ; packages){
  //   writeln(p);
  //   std.file.append(OUTFILE, p);
  //   // std.file.append(OUTFILE, "\n");
  // }
  //writeln(packages[0]);

  
}
