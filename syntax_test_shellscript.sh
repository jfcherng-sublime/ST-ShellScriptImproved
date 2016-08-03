# SYNTAX TEST "Packages/ShellScriptImproved/Shell-Unix-Generic.sublime-syntax"

####################################################
# Strings and interpolation in parameter expansion #
####################################################

${foo:-bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ punctuation.definition.variable.shell

${foo:='bar'}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ punctuation.definition.string.begin.shell
#      ^^^^^ string.quoted.single.shell
#          ^ punctuation.definition.string.end.shell
#           ^ punctuation.definition.variable.shell

${foo//bar/baz}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ keyword.operator.substringreplacement.shell
#             ^ punctuation.definition.variable.shell

${foo:=`bar`}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ punctuation.definition.string.begin.shell
#      ^^^^^ string.interpolated.backtick.shell
#          ^ punctuation.definition.string.end.shell
#           ^ punctuation.definition.variable.shell

${foo:=$( bar )}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^^ punctuation.definition.string.begin.shell
#         ^^^ string.interpolated.dollar.shell
#             ^ punctuation.definition.string.end.shell
#              ^ punctuation.definition.variable.shell

${foo:=$(( 1 + 1 ))}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^^^ punctuation.definition.string.begin.shell
#          ^ constant.numeric.integer.shell
#            ^ keyword.operator.arithmetic.shell
#              ^ constant.numeric.integer.shell
#                ^^ punctuation.definition.string.end.shell
#                  ^ punctuation.definition.variable.shell

${foo:=$bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ punctuation.definition.variable.shell
#       ^^^ variable.other.normal.shell
#          ^ punctuation.definition.variable.shell

${foo:="$bar"}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ punctuation.definition.string.begin.shell
#       ^ punctuation.definition.variable.shell
#       ^^^^ variable.other.normal.shell
#           ^ punctuation.definition.string.end.shell
#            ^ punctuation.definition.variable.shell


#################################
# Braces in parameter expansion #
#################################

${foo//foo\}foo\/foo/foo}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^^ constant.character.escape.shell
#              ^^ constant.character.escape.shell
#                   ^ keyword.operator.substringreplacement.shell
#                       ^ punctuation.definition.variable.shell

${foo:="${bar} baz"}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ punctuation.definition.string.begin.shell
#                 ^ punctuation.definition.string.end.shell
#                  ^ punctuation.definition.variable.shell

# Sublime bug fix: "
#                  ^ comment.line.number-sign.shell

${!varprefix*}
# <- punctuation.definition.variable.shell
# ^ keyword.operator.match.shell
#           ^ keyword.operator.match.shell
#            ^ punctuation.definition.variable.shell

${!varprefix@}
# <- punctuation.definition.variable.shell
# ^ keyword.operator.match.shell
#           ^ keyword.operator.match.shell
#            ^ punctuation.definition.variable.shell

${var#Pattern}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringremoval.shell
#            ^ punctuation.definition.variable.shell

${var##Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringremoval.shell
#             ^ punctuation.definition.variable.shell

${var###Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringremoval.shell
#      ^ - keyword.operator.substringremoval.shell
#              ^ punctuation.definition.variable.shell

${var%Pattern}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringremoval.shell
#            ^ punctuation.definition.variable.shell

${var%%Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringremoval.shell
#             ^ punctuation.definition.variable.shell

${var%%%Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringremoval.shell
#      ^ - keyword.operator.substringremoval.shell
#              ^ punctuation.definition.variable.shell


####################################################################
# Parameter-expansion operators                                    #
# cf. http://www.tldp.org/LDP/abs/html/parameter-substitution.html #
####################################################################

${foo//%/}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ - keyword
#       ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo//#/}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ - keyword
#       ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo//!/}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ - keyword
#       ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo//:/}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ - keyword
#       ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo//@/}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#      ^ - keyword
#       ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo#}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringremoval.shell
#     ^ punctuation.definition.variable.shell

${foo!} # "!" is not a operator here
# <- punctuation.definition.variable.shell
#    ^ variable.other.bracket.shell
#     ^ punctuation.definition.variable.shell

${var:pos:len}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.expansion.shell
#        ^ keyword.operator.expansion.shell
#            ^ punctuation.definition.variable.shell

${foo//a\/b/c/d}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#       ^^ constant.character.escape.shell
#          ^ keyword.operator.substringreplacement.shell
#            ^ - keyword.operator.substringreplacement.shell
#              ^ punctuation.definition.variable.shell

${foo^}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.uppercase.shell
#     ^ punctuation.definition.variable.shell

${foo,}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.lowercase.shell
#     ^ punctuation.definition.variable.shell

${foo^^}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.uppercase.shell
#      ^ punctuation.definition.variable.shell

${foo,,}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.lowercase.shell
#      ^ punctuation.definition.variable.shell

${foo,,,Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.lowercase.shell
#      ^ - keyword
#              ^ punctuation.definition.variable.shell

${foo,,Pattern}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.lowercase.shell
#             ^ punctuation.definition.variable.shell

${foo-bar}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo:-bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ punctuation.definition.variable.shell

${foo+bar}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo:+bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ punctuation.definition.variable.shell

${foo=bar}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo:=bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ punctuation.definition.variable.shell

${foo?bar}
# <- punctuation.definition.variable.shell
#    ^ keyword.operator.substringreplacement.shell
#        ^ punctuation.definition.variable.shell

${foo:?bar}
# <- punctuation.definition.variable.shell
#    ^^ keyword.operator.substringreplacement.shell
#         ^ punctuation.definition.variable.shell


###################
# Misc. operators #
###################

foo='bar'
#  ^ keyword.operator.assign.shell

foo[jjj]="`<$file`"
#       ^ keyword.operator.assign.shell

foo+=" baz"
#  ^^ keyword.operator.append.shell

export foo='bar'
#         ^ keyword.operator.assign.shell

[ -n "${foo}" ]
# <- punctuation.definition.logical-expression.shell
# ^ punctuation.definition.logical.shell
# ^^ keyword.operator.logical.shell
#    ^ punctuation.definition.string.begin.shell
#     ^^ punctuation.definition.variable.shell
#       ^^^ variable.other.bracket.shell
#          ^ punctuation.definition.variable.shell
#           ^ punctuation.definition.string.end.shell
#             ^ punctuation.definition.logical-expression.shell

[[ -n "${foo}" ]]
# <- meta.scope.logical-expression.shell
#  ^ punctuation.definition.logical.shell
#  ^^ keyword.operator.logical.shell
#     ^ punctuation.definition.string.begin.shell
#      ^^ punctuation.definition.variable.shell
#        ^^^ variable.other.bracket.shell
#           ^ punctuation.definition.variable.shell
#            ^ punctuation.definition.string.end.shell
#              ^^ meta.scope.logical-expression.shell

[ "${foo}" != 'bar' ]
# <- meta.scope.logical-expression.shell
# ^ punctuation.definition.string.begin.shell
#  ^^ punctuation.definition.variable.shell
#    ^^^ variable.other.bracket.shell
#       ^ punctuation.definition.variable.shell
#        ^ punctuation.definition.string.end.shell
#          ^^ keyword.operator.logical.shell
#             ^ punctuation.definition.string.begin.shell
#             ^^^^^ string.quoted.single.shell
#                 ^ punctuation.definition.string.end.shell
#                   ^ meta.scope.logical-expression.shell

[[ "${foo}" != 'bar' ]]
# <- meta.scope.logical-expression.shell
#  ^ punctuation.definition.string.begin.shell
#   ^^ punctuation.definition.variable.shell
#     ^^^ variable.other.bracket.shell
#        ^ punctuation.definition.variable.shell
#         ^ punctuation.definition.string.end.shell
#           ^^ keyword.operator.logical.shell
#              ^ punctuation.definition.string.begin.shell
#              ^^^^^ string.quoted.single.shell
#                  ^ punctuation.definition.string.end.shell
#                    ^^ meta.scope.logical-expression.shell

echo >> echo
#    ^^ keyword.operator.redirect.shell
#       ^^^^ - support.function

anyprogram >>! echo
#          ^^^ keyword.operator.redirect.shell
#              ^^^^ - support.function

echo [[ "${foo}" != 'bar' ]]
# <- support.function.builtin.shell
#    ^^ - meta.scope.logical-expression.shell
#       ^ punctuation.definition.string.begin.shell
#        ^^ punctuation.definition.variable.shell
#          ^^^ variable.other.bracket.shell
#             ^ punctuation.definition.variable.shell
#              ^ punctuation.definition.string.end.shell
#                ^^ - keyword.operator.logical.shell
#                   ^ punctuation.definition.string.begin.shell
#                   ^^^^^ string.quoted.single.shell
#                       ^ punctuation.definition.string.end.shell
#                         ^^ -  meta.scope.logical-expression.shell

echo ]] echo
#    ^^ - meta.scope.logical-expression.shell
#       ^^^^ - support.function.builtin.shell


foo; bar; baz
#  ^ keyword.operator.list.shell
#       ^ keyword.operator.list.shell

for (( i = 0; i < RAND; i++ )); do
# <- keyword.control.shell
#      ^ variable.other.c-style.shell
#        ^ keyword.operator.arithmetic.shell
#             ^ variable.other.c-style.shell
#               ^ keyword.operator.arithmetic.shell
#                 ^^^^ variable.other.c-style.shell
#                       ^ variable.other.c-style.shell
#                        ^^ keyword.operator.arithmetic.shell
#                             ^ keyword.operator.list.shell
#                               ^^ keyword.control.shell
    :
done
# <- keyword.control.shell

# <- - meta.scope.for-loop.shell


####################
# Identifier names #
####################

$(( foo + 2 ))
#   ^^^ variable.other.c-style.shell

(( foo++ ))
#  ^^^ variable.other.c-style.shell

for i in "${foo[@]}"; do
#   ^ variable.other.loop.shell
    :
done


################################################
# Quoting, interpolation and nested constructs #
################################################

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


[[ $str =~ ^$'\t' ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^^^ source.regexp

[[ $str =~ ^abc$var$ ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^ source.regexp
#              ^^^^ variable.other.normal.shell
#                  ^ source.regexp

[[ $str =~ ^abc$(echo $var)$ ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^ source.regexp
#              ^^ punctuation.definition.string.begin.shell
#                     ^^^^ variable.other.normal.shell
#                          ^ source.regexp

[[ $str =~ \ ?[a-z]\  ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^^^^^^^ source.regexp

[[ $str =~ ^(bar|baz)[abc0-9]{1,2}$ ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^^^^^^^^^^^^^^^^^^^^^ source.regexp

[[ $str =~ "^(bar|baz)[abc0-9]{1,2}$" ]]
#       ^^ keyword.operator.logical.shell
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.shell

[[ $str =~ $(echo $regex) ]]
#       ^^ keyword.operator.logical.shell
#          ^^ punctuation.definition.string.begin.shell
#            ^^^^ support.function.builtin.shell
#                 ^ punctuation.definition.variable.shell
#                 ^^^^^^ variable.other.normal.shell
#                       ^ punctuation.definition.string.end.shell

[[ $str =~ $regex ]]
#       ^^ keyword.operator.logical.shell
#          ^ punctuation.definition.variable.shell
#          ^^^^^^ variable.other.normal.shell

: <<- EOF
# ^^^ keyword.operator.heredoc.shell
#     ^^^ keyword.control.heredoc-token.shell
    foo
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell

: << EOF
# ^^ keyword.operator.heredoc.shell
#    ^^^ keyword.control.heredoc-token.shell
    $variable
#   ^ punctuation.definition.variable.shell
#   ^^^^^^^^^ variable.other.normal.shell
    foo bar $( baz )
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell

: << 'EOF'
# ^^ keyword.operator.heredoc.shell
#     ^^^ keyword.control.heredoc-token.shell
    $variable
#   ^^^^^^^^^ string.unquoted.heredoc.shell
    foo bar $( baz )
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell

cat <<<'
line 1
line 2
'
# <- string.quoted.single.herestring.shell punctuation.definition.string.end.shell

cat <<<"
line 1
line 2\"test
#     ^^ constant.character.escape.shell
line 3
"
# <- string.quoted.double.herestring.shell punctuation.definition.string.end.shell

cat << EOF > file
#          ^ keyword.operator.redirect.shell
#            ^^^^ - string.unquoted.heredoc.shell - support.function.external.shell
    $variable
#   ^ punctuation.definition.variable.shell
#   ^^^^^^^^^ variable.other.normal.shell
These contents will be written to the file.
        This line is indented.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell


################################
# Heredoc with compact-command #
################################

print_info_text_compact () { cat <<EOF; do_something; }
#                                  ^^^ keyword.control.heredoc-token.shell
#                                       ^^^^^^^^^^^^ - string.unquoted.heredoc.shell
#                                                     ^ punctuation.definition.group.shell
This is some info text.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell

# <- - string.unquoted.heredoc.shell - meta.function.shell

if [ true ]; then cat <<EOF; do_something; fi
#                       ^^^ keyword.control.heredoc-token.shell
#                            ^^^^^^^^^^^^ - string.unquoted.heredoc.shell
#                                          ^^ meta.scope.if-block.shell keyword.control.shell
Condition is met.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell

# <- - string.unquoted.heredoc.shell - meta.scope.if-block.shell


########################
# Nomal Heredoc usages #
########################

print_info_text () { cat <<EOF
This is some info text.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell
}
# <- punctuation.definition.group.shell

# <- - string.unquoted.heredoc.shell - meta.function.shell

print_info_text () {
    cat <<EOF
This is some info text.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell
}
# <- punctuation.definition.group.shell

# <- - string.unquoted.heredoc.shell - meta.function.shell

if [ true ]; then cat <<EOF
Condition is met.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell
fi
# <- meta.scope.if-block.shell keyword.control.shell

# <- - string.unquoted.heredoc.shell - meta.scope.if-block.shell

if [ true ]; then
    cat <<EOF
Condition is met.
# <- string.unquoted.heredoc.shell
EOF
# <- keyword.control.heredoc-token.shell
fi
# <- meta.scope.if-block.shell keyword.control.shell

# <- - string.unquoted.heredoc.shell - meta.scope.if-block.shell


###############
# Redirection #
###############

1>filename
# <- constant.numeric.file-descriptor.shell
#^ keyword.operator.redirect.shell

1>>filename
# <- constant.numeric.file-descriptor.shell
#^^ keyword.operator.redirect.shell

&>filename
# <- constant.numeric.file-descriptor.shell
#^ keyword.operator.redirect.shell

2>&1
# <- constant.numeric.file-descriptor.shell
#^^ keyword.operator.redirect.shell
#  ^ constant.numeric.file-descriptor.shell

0<&-
#^^ keyword.operator.redirect.shell
# <- constant.numeric.file-descriptor.shell
#  ^ constant.numeric.file-descriptor.shell

<&-
# <- keyword.operator.redirect.shell
# ^ constant.numeric.file-descriptor.shell

$(curl -I "https://google.com" 2> /dev/null)
#                              ^ constant.numeric.file-descriptor.shell


############
# Subshell #
############

"$( foo )"
#^ punctuation.definition.string.begin.shell
#       ^ punctuation.definition.string.end.shell

"` foo `"
#^ punctuation.definition.string.begin.shell
#      ^ punctuation.definition.string.end.shell

"$(( foo++ ))"
#    ^^^ variable.other.c-style.shell
#       ^^ keyword.operator.arithmetic.shell

$( foo $( bar $( baz ) ) )
# <- punctuation.definition.string.begin.shell
#      ^^ punctuation.definition.string.begin.shell
#             ^^ punctuation.definition.string.begin.shell
#                    ^ punctuation.definition.string.end.shell
#                      ^ punctuation.definition.string.end.shell
#                        ^ punctuation.definition.string.end.shell

$( foo ` bar ` )
# <- punctuation.definition.string.begin.shell
#      ^ punctuation.definition.string.begin.shell
#            ^ punctuation.definition.string.end.shell
#              ^ punctuation.definition.string.end.shell

$( foo "$(( bar + 1 ))" )
# <- punctuation.definition.string.begin.shell
#       ^^^ punctuation.definition.string.begin.shell
#                   ^^ punctuation.definition.string.end.shell
#                       ^ punctuation.definition.string.end.shell

foo="$( bar "$( baz "$( qux )" )" )"
#    ^^ punctuation.definition.string.begin.shell
#            ^^ punctuation.definition.string.begin.shell
#                    ^^ punctuation.definition.string.begin.shell
#                           ^ punctuation.definition.string.end.shell
#                              ^ punctuation.definition.string.end.shell
#                                 ^ punctuation.definition.string.end.shell

$(( ( RANDOM * 100 ) / 5 ))
# <- punctuation.definition.string.begin.shell
#     ^^^^^^ variable.other.c-style.shell
#            ^ keyword.operator.arithmetic.shell
#              ^^^ constant.numeric.integer.shell
#                    ^ keyword.operator.arithmetic.shell
#                      ^ constant.numeric.integer.shell
#                        ^^ punctuation.definition.string.end.shell

$(( a=(2*(250+1))/5 ))
# <- punctuation.definition.string.begin.shell
#   ^ variable.other.c-style.shell
#    ^ keyword.operator.arithmetic.shell
#       ^ keyword.operator.arithmetic.shell
#         ^^^ constant.numeric.integer.shell
#            ^ keyword.operator.arithmetic.shell
#             ^ constant.numeric.integer.shell
#                ^ keyword.operator.arithmetic.shell
#                 ^ constant.numeric.integer.shell
#                   ^^ punctuation.definition.string.end.shell

plus=$(( $(echo "$errorCode") ))
#          ^ support.function.builtin.shell


############
# Backtick #
############

if [[ ! "`git status 2> /dev/null`" ]]; then
    # Sublime bug fix: `
    return
# <- - string.quoted.double.shell
fi


#################
# Controversial #
#################

empty=$((echo hello) > output.txt)
# Sublime bug fix: ))
#                  ^^ comment.line.number-sign.shell

empty=$( (echo hello) > output.txt)
#         ^^^^ support.function.builtin.shell
#                     ^ keyword.operator.redirect.shell

grep 'foo' <( bar "$( baz )" )
#          ^^ punctuation.definition.string.begin.shell
#                  ^^ punctuation.definition.string.begin.shell
#                         ^ punctuation.definition.string.end.shell
#                            ^ punctuation.definition.string.end.shell


####################
# Command Switches #
####################

echo -e Hello
#    ^ punctuation.definition.command-switch.shell
#    ^^ support.command-switch.shell

echo\
 -e Hello
#^ punctuation.definition.command-switch.shell
#^^ support.command-switch.shell

echo \
 -e Hello
#^ punctuation.definition.command-switch.shell
#^^ support.command-switch.shell

echo\
-e Hello
# <- punctuation.definition.command-switch.shell
#^ support.command-switch.shell

echo \
-e Hello
# <- punctuation.definition.command-switch.shell
#^ support.command-switch.shell

gcc input.c -o output.exe --verbose
#           ^ punctuation.definition.command-switch.shell
#           ^^ support.command-switch.shell
#                         ^^ punctuation.definition.command-switch.shell
#                         ^^^^^^^^^ support.command-switch.shell


##################
# Special Design #
##################

var=true
#   ^^^^ variable.other.true.shell

var=false;
#   ^^^^^ variable.other.false.shell
#        ^ keyword.operator.list.shell

git --switch=true;
#            ^^^^ variable.other.true.shell
#                ^ keyword.operator.list.shell

git --switch=false
#            ^^^^^ variable.other.false.shell


###########################
# Misc. language features #
###########################

if [ true ];then
#           ^^^^ meta.scope.if-block.shell keyword.control.shell
    echo "HELLO"
fi

case "${foo}" in
# <- keyword.control.shell
#     ^^ punctuation.definition.variable.shell
#          ^ punctuation.definition.variable.shell
#             ^^ keyword.control.shell
    ( help | h ) bar ;;
#   ^ punctuation.definition.case-pattern.shell
#          ^ punctuation.separator.pipe-sign.shell
#              ^ punctuation.definition.case-pattern.shell
#                    ^^ punctuation.terminator.case-clause.shell
    do ) foo ;;
#   ^^ - keyword.control.shell
    *) bar
#   ^ keyword.operator.glob.shell
#    ^ punctuation.definition.case-pattern.shell
esac
# <- keyword.control.shell

# <- - meta.scope.case-block.shell

while :; do
# <- keyword.control.shell
#     ^ support.function.builtin.shell
#      ^ keyword.operator.list.shell
#        ^^ keyword.control.shell
    continue
#   ^^^^^^^^ keyword.control.shell
    break
#   ^^^^^ keyword.control.shell
done
# <- keyword.control.shell

# <- - meta.scope.while-loop.shell

if-up
# <- - keyword.control.shell
# ^ - keyword

foo:if:bar
#  ^ - keyword
#   ^^ - keyword.control.shell
#     ^ - keyword

func-while
#   ^ - keyword
#    ^^^^^ - keyword.control.shell

func_for
#    ^^^ - keyword.control.shell

func-for
#   ^ - keyword
#    ^^^ - keyword.control.shell

dd if=/dev/hda of=/dev/hdb
#  ^^ - keyword.control.shell
#    ^ keyword.operator.assign.shell
#     ^ - keyword.control.shell
#         ^ - keyword.control.shell
#                ^ keyword.operator.assign.shell
#                 ^ - keyword.control.shell
#                     ^ - keyword.control.shell

rm -rf mkdir
#      ^^^^^ - support.function

echo do
#    ^^ - keyword.control.shell

export cat
#      ^^^ - support.function

export cat=1
#      ^^^ - support.function
#         ^ keyword.operator.assign.shell

export cat=$(git --version)
#      ^^^ - support.function
#         ^ keyword.operator.assign.shell

cat=1
# <- - support.function
#  ^ keyword.operator.assign.shell

cd=cat
# <- - support.function
#  ^^^ - support.function

echo git rev-list "$(echo --all)" | grep -P 'c354a80'
# <- support.function.builtin.shell
#    ^^^ - support.function
#                  ^^ punctuation.definition.string.begin.shell
#                    ^^^^ support.function.builtin.shell
#                              ^ punctuation.definition.string.end.shell
#                                 ^ keyword.operator.pipe.shell
#                                   ^^^^ support.function.external.shell
#                                        ^^ support.command-switch.shell
#                                           ^ punctuation.definition.string.begin.shell
#                                                   ^ punctuation.definition.string.end.shell

echo $(echo git --version) echo `$(echo git --version)` "$(echo git --version)"
# <- support.function.builtin.shell
#      ^^^^ support.function.builtin.shell
#           ^^^ - support.function
#                          ^^^^ - support.function
#                                  ^^^^ support.function.builtin.shell
#                                       ^^^ - support.function
#                                                          ^^^^ support.function.builtin.shell
#                                                               ^^^ - support.function

echo `echo git --version`
# <- support.function.builtin.shell
#     ^^^^ support.function.builtin.shell

echo echo $(git) "$(git)" `$(git)` `git` | grep -P 'c354a80'
# <- support.function.builtin.shell
#    ^^^^ - support.function
#           ^^^ support.function.external.shell
#                   ^^^ support.function.external.shell
#                            ^^^ support.function.external.shell
#                                   ^^^ support.function.external.shell
#                                        ^ keyword.operator.pipe.shell
#                                          ^^^^ support.function.external.shell
#                                               ^^ support.command-switch.shell
#                                                  ^ punctuation.definition.string.begin.shell
#                                                          ^ punctuation.definition.string.end.shell

echo cat \
# <- support.function.builtin.shell
#    ^^^ - support.function
#        ^ punctuation.definition.multiline.shell
     cat
cat

echo cat \
     cat
#    ^^^ - support.function
cat
# <- support.function.external.shell

echo cat > cat \
# <- support.function.builtin.shell
#    ^^^ - support.function
#        ^ keyword.operator.redirect.shell
#          ^^^ - support.function
#              ^ punctuation.definition.multiline.shell
     cat
cat

echo cat > cat \
     cat
#    ^^^ - support.function
cat
# <- support.function.external.shell

echo `echo git --version` echo | grep -P 'c354a80'
# <- support.function.builtin.shell
#     ^^^^ support.function.builtin.shell
#          ^^^ - support.function
#                         ^^^^ - support.function
#                              ^ keyword.operator.pipe.shell
#                                ^^^^ support.function.external.shell


#####################################
#####################################
###### Not done by this syntax ######
#####################################
#####################################

####################
# Identifier names #
####################

# Variable names passed to variable-related shell built-ins like `declare`,
# `export`, `local`, `readonly`, `typeset`, and `unset` should be treated as
# such. (Note: What to do if they're quoted?)
declare foo         # 'foo' is a variable name
declare -A foo bar  # 'foo' and 'bar' are variable names
export foo          # 'foo' is a variable name
export foo bar      # 'foo' and 'bar' are variable names
export foo='bar'    # 'foo' is a variable name
local foo bar       # 'foo' and 'bar' are variable names
local foo bar='baz' # 'foo' and 'bar' are variable names
readonly foo        # 'foo' is a variable name
typeset foo         # 'foo' is a variable name
unset foo bar       # 'foo' and 'bar' are variable names

# Possibly the variable names passed to other shell built-ins known to support
# them should be treated as such? (Note: What to do if they're quoted?)
printf -v foo 'bar' # 'foo' is a variable name
read -r foo bar baz # 'foo', 'bar', and 'baz' are variable names
read -a foo         # 'foo' is a variable name
