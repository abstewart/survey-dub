import std.stdio;
import std.process;
import std.string;
import std.file;
import std.algorithm;


void main () {

  //fetch the package
  auto fetch_cmd = "dub fetch " ~ "unitthreaded";
  auto output = executeShell (fetch_cmd);
  writeln (output.output);

  
}
