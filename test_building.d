import std.stdio;
import std.process;
import std.string;
import std.file;
import std.algorithm;



void main () {

  survey_package ("libasync");
  remove_package ("libasync");
}


bool survey_package (string pkgname){
  string pkgdir;
  return fetch_package (pkgname) &&
    build_package(pkgname, pkgdir) &&
    test_package (pkgname, pkgdir);

}


bool fetch_package (string pkgname){
  //fetch the package
  auto fetch_cmd = "dub fetch " ~ pkgname;
  auto output = executeShell (fetch_cmd);

  debug writeln(output.status);
  debug writeln(output.output);

  //check for success
  return output.status == 0;
}


bool build_package (string pkgname, ref string pkgdir){
  //build the package
  auto build_cmd = "dub build " ~ pkgname;
  auto output = executeShell (build_cmd);

  debug writeln(output.status);
  debug writeln(output.output);

  //get the directory the package was built from and assign to ref input
  pkgdir = output.output.splitLines()[0].split(" ")[$-1];

  //check for success
  return output.status == 0;
}


bool test_package (string pkgname, string pkgdir){
  //navigate to the dub installation & run the test command
  auto test_cmd = "dub test";
  //auto output = executeShell (test_cmd, workdir=pkgdir);
  auto output = executeShell(test_cmd, null, Config(Config.Flags.none, null), 18446744073709551615LU, pkgdir);

  debug writeln(output.status);
  debug writeln(output.output);

  return output.status == 0;
}

void remove_package (string pkgname) {
  auto remove_cmd = "dub remove " ~ pkgname;
  auto output = executeShell(remove_cmd);
  debug writeln(output.status);
  debug writeln(output.output);
}
