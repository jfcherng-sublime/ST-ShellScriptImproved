ShellScript Improved 1.0.10
===========================

- Add executables: `tac`.
- Use NEWS.md as changelogs.

ShellScript Improved 1.0.9
==========================

- Fix a regression in `case` block.
- Add executables: `systemctl`.

ShellScript Improved 1.0.8
==========================

- Add executables about `apt-*`.
- Resolve some lookbehinds and negative lookbehinds.


ShellScript Improved 1.0.7
==========================

- Add executables: `fusermount`.
- Remove heredocs that involves backref.
- Add highlight for interpolation in heredoc.


ShellScript Improved 1.0.6
==========================

- Add keywords: `endif`.
- Add extensions: `csh` and `tcsh`.
- Fix a highlight for tcsh in the `if` condition.

```tcsh
if ( "a" != "b" )
         ^^ this should be a logic operator
```


ShellScript Improved 1.0.5
==========================

- Add some executables: `column`, `realpath`, `test`, `unlink`, `xxd` and `yes`.


ShellScript Improved 1.0.4
==========================

- Fix an wrong highlight caused by nested interpolations.

```bash
  echo `echo git --version` echo | grep -P 'c354a80'
  #                         ^^^^
  #                         This 'echo' should be a plain text.
```

ShellScript Improved 1.0.3
==========================

- Update readme.


ShellScript Improved 1.0.2
==========================

- Remove `.no-sublime-package`.


ShellScript Improved 1.0.1
==========================

- Rename syntax name to `ShellScript Improved`.


ShellScript Improved 1.0.0
==========================

- Initial release
