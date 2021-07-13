import 'dart:async';
import 'dart:io';

const editStr = '-i';
bool editFile = false;
String? findWhat, replaceWith, fName, oName;

Future<void> main(List<String> args) async {
  ///Walk arguments searching for -i keyword and trim everything
  int i = 0;
  while (i < args.length) {
    args[i] = args[i].trim();
    if(args[i].toLowerCase() == editStr) editFile = true;
     else if (args[i].startsWith('s/') && args[i].contains('/')) {
       ///Deal with substitution here (We don't need the first '/s'
       final l = args[i].substring(2).split('/');
       if (l.length < 2)
         throw Exception('Not enough values to make replacement!');
       findWhat = l.first;
       replaceWith = l[1];
       ///Should be the name of the file if not some of the others
    } else if (fName == null) fName = args[i];
       ///Or the name of the output file
        else oName = args[i];
    i++;
  }

  ///Are the strings specified
  if (findWhat == null || replaceWith == null)
    throw Exception('No values to find and replace!');

  ///Is the file name specified
  if (fName == null)
    throw Exception('No file is specified');

  final f = File(fName!);
  ///File exists?
  if (!f.existsSync())
    throw Exception('File $fName doesn\'t exist!');

  ///Read file
  var contents = await f.readAsString();
  ///Replace value with new value everywhere it's met in the text
  contents = contents.replaceAll(findWhat!, replaceWith!);

  ///If we have edit specified then replace contents in file
  if (editFile) await f.writeAsString(contents);
  ///Otherwise just print new contents in the standard output
   else if (oName != null)
     await File(oName!).writeAsString(contents);
     else print(contents);
}