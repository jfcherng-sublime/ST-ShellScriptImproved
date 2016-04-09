ShellScript Improved 1.0.14
===========================

- Update readme.
  You may want to add some new scopes to your color scheme.
  They are `variable.other.c-style.shell`,
  `punctuation.separator.pipe-sign.shell`,
  `punctuation.definition.case-pattern.shell` and
  `punctuation.terminator.case-clause.shell`.
- Fix `/` in a path is wrongly scoped/highlighted in (...).

```bash
if ( command > /dev/null 2>&1 ); then
    #          ^   ^ they are not division
    echo Condition True
fi
```

- Highlight variables without `$` in $((...)) and ((...)).

```bash
$(( ( RANDOM * 100 ) / 5 ))
#     ^^^^^^ this is a variable
```

- Parenthesis in $((...)) is now no color along with parenthesis balancing.

```bash
a=$(( (2*(250+1))/5 ))
#     ^  ^     ^^ these parenthesis are no color
```

- File descriptors in redirection are now highlighted like a number.

```bash
echo Text 1>&2
echo Text 1>   filename
#         ^  ^ file descriptors are highlighted like a number.
#              scope: constant.numeric.file-descriptor.shell
```

- Fix the space before a comment is treated as if it is in comment.

```bash
echo Text    # this line will print "Text"
#           ^ this space is not a part of comment
```

- Add executables: `info`.


ShellScript Improved 1.0.13
===========================

- Revert "Fix highlighting for the heredoc ending token."
  (A space padding raises a warning but not an error.)
- Fix heredoc in a non-compact command which does not start in a newline.
  (An regression which is introduced in 1.0.12.)

```bash
fun () { cat <<EOF
    Some text with a curly bracket }
    Some text with a semicolon and a curly bracket; }
    Even more text
EOF
}

if [ true ]; then cat <<EOF
    Condition is met.
EOF
fi
```


ShellScript Improved 1.0.12
===========================

- Fix a missing capture.
- Fix ']' are wrongly recognized as a command argument in a compound command.
- Fix highlighting for the heredoc ending token. (EOF should not be padded.)
- Fix #2. (wrong ending scopes for heredoc in a compact command)

```bash
print_info_text () {
    cat <<EOF
This is some info text.
EOF
}

# scope before this line should be `source.shell`

print_info_text_compact () { cat <<EOF; }
This is some info text.
EOF

# scope before this line should be `source.shell`

if [ true ]; then
    cat <<EOF
Condition is met.
EOF
fi

# scope before this line should be `source.shell`

if [ true ]; then cat <<EOF; fi
Condition is met.
EOF

# scope before this line should be `source.shell`
```


ShellScript Improved 1.0.11
===========================

- Fix #1. (a heredoc highlighting)

```bash
if [[ $(pwd) == $HOME ]]; then cat <<-EOF ; fi
        Hey, I\`m an indented heredoc in home. Btw', \$HOME is $HOME
                I\`m amazed that you read all this text.
    EOF
```

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
