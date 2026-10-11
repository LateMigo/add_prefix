# File prefix renamer

Bash script that adds a prefix to all files with a given extension
in the current directory. If no prefix is given, today's date
(YYYY-MM-DD) is used.

## Usage

```bash
chmod +x add_prefix.sh
./add_prefix.sh
```

The script asks for:
1. a file extension (e.g. `jpg`)
2. a prefix (press ENTER to use today's date)

## Example

```
$ ls
mycat.jpg  dog.jpg  notes.txt

$ ./add_prefix.sh
Please enter a file extension:
jpg
Please enter a file prefix: (Press ENTER for 2026-10-11)
vacation
Renaming dog.jpg to vacation-dog.jpg
Renaming mycat.jpg to vacation-mycat.jpg
```

## Features

- uses today's date as the default prefix
- never overwrites existing files: if the new name is already taken,
  the file is skipped with a warning
- handles directories with no matching files (`nullglob`)
- errors are printed to stderr and the script exits with code 1