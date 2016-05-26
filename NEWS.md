ShellScript Improved 1.2.5
==========================

- Add a scope for `+=` as `keyword.operator.append.shell`.

```bash
foo+=" baz"
#  ^^ keyword.operator.append.shell
```


ShellScript Improved 1.2.4
==========================

- Add an executables: `sudoedit`.
- Privilege executables now have an exclusive scope: `support.function.privilege.shell`

```bash
sudo ls -alHf /
# <- support.function.privilege.shell
```

- Fix the scope for file descriptor in a interpolation.

```bash
$(curl -I "https://google.com" 2> /dev/null)
#                              ^ constant.numeric.file-descriptor.shell
```

- Fix subshell can be used in `$((...))`.

```bash
plus=$(( $(echo "$errorCode") ))
#          ^ support.function.builtin.shell
```


ShellScript Improved 1.2.3
==========================

- Add executables: `ldconfig` and `ssh-keygen`.
- Fix highlighting within `[...]`.

```bash
[ ! -f foo.$foo ]
# <- punctuation.definition.logical-expression.shell
# ^ keyword.operator.logical.shell
#   ^^ keyword.operator.logical.shell
#          ^ punctuation.definition.variable.shell
#          ^^^^ variable.other.normal.shell
#               ^ punctuation.definition.logical-expression.shell

[ ! -f foo.$foo -a $foo -le 500 ]
# <- punctuation.definition.logical-expression.shell
# ^ keyword.operator.logical.shell
#   ^^ keyword.operator.logical.shell
#          ^ punctuation.definition.variable.shell
#          ^^^^ variable.other.normal.shell
#               ^^ keyword.operator.logical.shell
#                  ^ punctuation.definition.variable.shell
#                  ^^^^ variable.other.normal.shell
#                        ^^ keyword.operator.logical.shell
#                               ^ punctuation.definition.logical-expression.shell
```

- Fix the scope for command switches at the beginning of a new line.

```bash
echo \
-e Hello
# <- punctuation.definition.command-switch.shell
#^ support.command-switch.shell
```


ShellScript Improved 1.2.2
==========================

- Fix some typos in the syntax test file.
- Fix keywords in case patterns are wrongly highlighted.

```bash
case "${foo}" in
    do ) foo ;;
#   ^^ - keyword.control.shell
    *) bar
esac
```

- Fix the scope for `:` which is next to `;`.

```bash
while :; do
#     ^ support.function.builtin.shell
    break
done
```

- Fix the scope for non-closed `;;` in the last case block.

```bash
case "${foo}" in
    *) bar
esac

# <- - meta.scope.case-block.shell
```


ShellScript Improved 1.2.1
==========================

- Fix a regression introduced when introducing `=true/false` highlighting.

```bash
cd=cat
# <- - support.function
#  ^^^ - support.function
```

- Fix scope for `;then`.

```bash
if [ true ];then
    #       ^^^^ meta.scope.if-block.shell keyword.control.shell
    echo "HELLO"
fi
```


ShellScript Improved 1.2.0
==========================

- Compatible with the new Regex engine in Sublime Text 3.
  That is, use no backref and no lookbehind.


ShellScript Improved 1.1.6
==========================

- Fix scopes about function definition.

```bash
function x() {
    #     ^^ punctuation.definition.arguments.shell
    echo "Hello"
}
```

- Fix some issues within a backtick interpolation.

```bash
if [[ ! "`git status 2> /dev/null`" ]]; then
    # Sublime bug fix: `
    return
# <- - string.quoted.double.shell
fi
```


ShellScript Improved 1.1.5
==========================

- Add executables: `gksu` and `gksudo`.
- Drop support for `csh` and `tcsh`.
  Because the current support is not good and there is a
  [plugin](https://packagecontrol.io/packages/Tcsh%20and%20Csh%20Mode)
  just for that.


ShellScript Improved 1.1.4
==========================

- Update syntax test file.
- Fix the scope of `true` in `var=true;` and so does `false`.
- Fix a wrong parsing path issue in a nested `$(...)` interpolation.

```bash
# The scope is correct just because of luck hence this fix.
# There cannot be nested backtick interpolation but $(...) can be.
$( foo $( bar $( baz ) ) )
#      ^^ punctuation.definition.string.begin.shell
```


ShellScript Improved 1.1.3
==========================

- Update syntax test file.
- There must be a space after a `[` and before a `]` command.
- Highlight the `-` in `-eq` and etc...
- Add highlight for regex in `[[ ... =~ REGEX ]]`.

```bash
[[ $str =~ ^(bar|baz)[abc0-9]{1,2}$ ]]
#          ^^^^^^^^^^^^^^^^^^^^^^^^ this is a regex
```

- Fix some highlighting involving `[[` or `]]`.

```bash
# this command actually prints: [[  != bar ]]
# so '[[', '!=' and ']]' should be plain text
echo [[ "${foo}" != 'bar' ]]

echo ]] echo
#       ^^^^ this 'echo' is plain text
```


ShellScript Improved 1.1.2
==========================

- Update readme about color scheme.
- Add a selectable dark color scheme.
  (If you are lazy customizing your own, you may use mine directly.)


ShellScript Improved 1.1.1
==========================

- Update syntax test file.
- Add highlight for `true` and `false` in command switches.

```bash
executable --switch=true
```


ShellScript Improved 1.1.0
==========================

- Update readme.
  You may want to add some new scopes to your color scheme.
  They are `variable.other.true.shell` and `variable.other.false.shell`.
- Rename `syntax_test_shellscript_human_eyes.sh` to `demo.sh`.
- Add executables: `pkg-config` and `pkgdata`.
- Add a syntax test file to prevent from regressions.
- Fix a regression. (#7)
- Fix a regression which is caused by removing backslash for escaping `-`.
- Add scopes for `true` and `false` in assignment. (#7)

```bash
var=true
var=false
```


ShellScript Improved 1.0.21
===========================

- Fix error loading syntax file for ST 3103. (#6)

```
Error loading syntax file "Packages/ShellScriptImproved/Shell-Unix-Generic.sublime-syntax": Error in regex: empty range in char class in regex \+{1,2}|-{1,2}|!|~|\*{1,2}|/|%|([=!*/%+-&^|]|<<?|>>?)?=|^|\|{1,2}|&{1,2}|[?:,<>]
```


ShellScript Improved 1.0.20
===========================

- Fix a wrong ending scope caused by redirection in backticks.

```bash
`echo "Hello" > output.txt`
# the scope after this line should be "source.shell"
```

- Fix a wrong ending scope caused by `fi` in a function.

```bash
msg () { if [ true ]; then echo "Hello"; fi; }
# scope after this line should be "source.shell"
```


ShellScript Improved 1.0.19
===========================

- Fix scopes for `}` and `fi`.

```bash
print_info_text () { cat <<EOF
This is some info text.
EOF
} # this "}" should has scope "punctuation.definition.group.shell"

if [ true ]; then cat <<EOF
Condition is met.
EOF
fi # this "fi" should has scope "meta.scope.if-block.shell"
```


ShellScript Improved 1.0.18
===========================

- Improve trailing version number matching for executable names.
- Add a scope for the `--` prefix in a command switch.
- Add highlight for `=` in a command switch assignment.

```bash
7za a -mx=9 output.7z input
#        ^ this "=" sign is scoped with "keyword.operator.assign.shell"
```

- Fix isolated `--` is not a switch

```bash
cd --
#  ^^ this is not a switch
```


ShellScript Improved 1.0.17
===========================

- Fix switch scope is not terminated if the switch is at the end of line.

```bash
./executable --switch
do_somthing
# "do_somthing" should not be recognized as a switch
```


ShellScript Improved 1.0.16
===========================

- Update readme.
  You may want to add scope `support.command-switch.shell` to your color scheme.
- Add highlight to command switches.
  Currently, it's an over-matching but I think it's okay.

```bash
rm -rf directory
#  ^^^ this is a swtich

git --version
#   ^^^^^^^^^ this is a switch

7za a -mx=9 output.7z input
#     ^^^ this is a switch

echo I want to print --version
#                    ^^^^^^^^^ mis-match! this is not a switch.
```


ShellScript Improved 1.0.15
===========================

- Rename `syntax_test_shellscript.sh` to `syntax_test_shellscript_human_eyes.sh`.
- Fix a regression caused by redirection.

```bash
echo cat > cat
#          ^^^ this "cat" is not a external executable
```


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
