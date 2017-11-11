# SYNTAX TEST "Packages/ShellScriptImproved/Shell-Unix-Generic.sublime-syntax"


#############
# Variables #
#############

$_
#^ variable.other.special

$__
#^^ variable.other.normal

$var_0
#^^^^^ variable.other.normal

$_var0
#^^^^^ variable.other.normal

$_0var_
#^^^^^^ variable.other.normal

${foo}/${bar}/${exe}
# ^^^               variable.other.bracket
#        ^^^        variable.other.bracket
#               ^^^ variable.other.bracket


####################################################
# Strings and interpolation in parameter expansion #
####################################################

${foo:-bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ punctuation.definition.variable

${foo:='bar'}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ punctuation.definition.string.begin
#      ^^^^^ string.quoted.single
#          ^ punctuation.definition.string.end
#           ^ punctuation.definition.variable

${foo//bar/baz}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ keyword.operator.substringreplacement
#             ^ punctuation.definition.variable

${foo:=`bar`}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ punctuation.definition.string.begin
#          ^ punctuation.definition.string.end
#           ^ punctuation.definition.variable

${foo:=$( bar )}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^^ punctuation.definition.string.begin
#             ^ punctuation.definition.string.end
#              ^ punctuation.definition.variable

${foo:=$(( 1 + 1 ))}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^^^ punctuation.definition.string.begin
#          ^ constant.numeric.integer
#            ^ keyword.operator.arithmetic
#              ^ constant.numeric.integer
#                ^^ punctuation.definition.string.end
#                  ^ punctuation.definition.variable

${foo:=$bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ punctuation.definition.variable
#       ^^^ variable.other.normal
#          ^ punctuation.definition.variable

${foo:="$bar"}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ punctuation.definition.string.begin
#       ^ punctuation.definition.variable
#       ^^^^ variable.other.normal
#           ^ punctuation.definition.string.end
#            ^ punctuation.definition.variable


#################################
# Braces in parameter expansion #
#################################

${foo//foo\}foo\/foo/foo}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^^ constant.character.escape
#              ^^ constant.character.escape
#                   ^ keyword.operator.substringreplacement
#                       ^ punctuation.definition.variable

${foo:="${bar} baz"}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ punctuation.definition.string.begin
#                 ^ punctuation.definition.string.end
#                  ^ punctuation.definition.variable

# Sublime bug fix: "
#                  ^ comment.line.number-sign

${!varprefix*}
# <- punctuation.definition.variable
# ^ keyword.operator.match
#           ^ keyword.operator.match
#            ^ punctuation.definition.variable

${!varprefix@}
# <- punctuation.definition.variable
# ^ keyword.operator.match
#           ^ keyword.operator.match
#            ^ punctuation.definition.variable

${var#Pattern}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringremoval
#            ^ punctuation.definition.variable

${var##Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringremoval
#             ^ punctuation.definition.variable

${var###Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringremoval
#      ^ - keyword.operator.substringremoval
#              ^ punctuation.definition.variable

${var%Pattern}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringremoval
#            ^ punctuation.definition.variable

${var%%Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringremoval
#             ^ punctuation.definition.variable

${var%%%Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringremoval
#      ^ - keyword.operator.substringremoval
#              ^ punctuation.definition.variable


####################################################################
# Parameter-expansion operators                                    #
# cf. http://www.tldp.org/LDP/abs/html/parameter-substitution.html #
####################################################################

${foo//%/}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ - keyword
#       ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo//#/}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ - keyword
#       ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo//!/}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ - keyword
#       ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo//:/}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ - keyword
#       ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo//@/}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#      ^ - keyword
#       ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo#}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringremoval
#     ^ punctuation.definition.variable

${foo!} # "!" is not a operator here
# <- punctuation.definition.variable
#    ^ variable.other.bracket
#     ^ punctuation.definition.variable

${var:pos:len}
# <- punctuation.definition.variable
#    ^ keyword.operator.expansion
#        ^ keyword.operator.expansion
#            ^ punctuation.definition.variable

${foo//a\/b/c/d}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#       ^^ constant.character.escape
#          ^ keyword.operator.substringreplacement
#            ^ - keyword.operator.substringreplacement
#              ^ punctuation.definition.variable

${foo^}
# <- punctuation.definition.variable
#    ^ keyword.operator.uppercase
#     ^ punctuation.definition.variable

${foo,}
# <- punctuation.definition.variable
#    ^ keyword.operator.lowercase
#     ^ punctuation.definition.variable

${foo^^}
# <- punctuation.definition.variable
#    ^^ keyword.operator.uppercase
#      ^ punctuation.definition.variable

${foo,,}
# <- punctuation.definition.variable
#    ^^ keyword.operator.lowercase
#      ^ punctuation.definition.variable

${foo,,,Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.lowercase
#      ^ - keyword
#              ^ punctuation.definition.variable

${foo,,Pattern}
# <- punctuation.definition.variable
#    ^^ keyword.operator.lowercase
#             ^ punctuation.definition.variable

${foo-bar}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo:-bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ punctuation.definition.variable

${foo+bar}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo:+bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ punctuation.definition.variable

${foo=bar}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo:=bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ punctuation.definition.variable

${foo?bar}
# <- punctuation.definition.variable
#    ^ keyword.operator.substringreplacement
#        ^ punctuation.definition.variable

${foo:?bar}
# <- punctuation.definition.variable
#    ^^ keyword.operator.substringreplacement
#         ^ punctuation.definition.variable


###################
# Misc. operators #
###################

foo='bar'
#  ^ keyword.operator.assign

foo[jjj]="`<$file`"
#       ^ keyword.operator.assign

foo+=" baz"
#  ^^ keyword.operator.append

export foo='bar'
#         ^ keyword.operator.assign

[ -n "${foo}" ]
# <- punctuation.definition.logical-expression
# ^ punctuation.definition.logical
# ^^ keyword.operator.logical
#    ^ punctuation.definition.string.begin
#     ^^ punctuation.definition.variable
#       ^^^ variable.other.bracket
#          ^ punctuation.definition.variable
#           ^ punctuation.definition.string.end
#             ^ punctuation.definition.logical-expression

[[ -n "${foo}" ]]
# <- meta.scope.logical-expression
#  ^ punctuation.definition.logical
#  ^^ keyword.operator.logical
#     ^ punctuation.definition.string.begin
#      ^^ punctuation.definition.variable
#        ^^^ variable.other.bracket
#           ^ punctuation.definition.variable
#            ^ punctuation.definition.string.end
#              ^^ meta.scope.logical-expression

[ "${foo}" != 'bar' ]
# <- meta.scope.logical-expression
# ^ punctuation.definition.string.begin
#  ^^ punctuation.definition.variable
#    ^^^ variable.other.bracket
#       ^ punctuation.definition.variable
#        ^ punctuation.definition.string.end
#          ^^ keyword.operator.logical
#             ^ punctuation.definition.string.begin
#             ^^^^^ string.quoted.single
#                 ^ punctuation.definition.string.end
#                   ^ meta.scope.logical-expression

[[ "${foo}" != 'bar' ]]
# <- meta.scope.logical-expression
#  ^ punctuation.definition.string.begin
#   ^^ punctuation.definition.variable
#     ^^^ variable.other.bracket
#        ^ punctuation.definition.variable
#         ^ punctuation.definition.string.end
#           ^^ keyword.operator.logical
#              ^ punctuation.definition.string.begin
#              ^^^^^ string.quoted.single
#                  ^ punctuation.definition.string.end
#                    ^^ meta.scope.logical-expression

echo >> echo
#    ^^ keyword.operator.redirect
#       ^^^^ - support.function

anyprogram >>! echo
#          ^^^ keyword.operator.redirect
#              ^^^^ - support.function

echo [[ "${foo}" != 'bar' ]]
# <- support.function.builtin
#    ^^ - meta.scope.logical-expression
#       ^ punctuation.definition.string.begin
#        ^^ punctuation.definition.variable
#          ^^^ variable.other.bracket
#             ^ punctuation.definition.variable
#              ^ punctuation.definition.string.end
#                ^^ - keyword.operator.logical
#                   ^ punctuation.definition.string.begin
#                   ^^^^^ string.quoted.single
#                       ^ punctuation.definition.string.end
#                         ^^ -  meta.scope.logical-expression

echo ]] echo
#    ^^ - meta.scope.logical-expression
#       ^^^^ - support.function.builtin


foo; bar; baz
#  ^ keyword.operator.list
#       ^ keyword.operator.list

for (( i = 0; i < RAND; i++ )); do
# <- keyword.control
#      ^ variable.other.c-style
#        ^ keyword.operator.arithmetic
#             ^ variable.other.c-style
#               ^ keyword.operator.arithmetic
#                 ^^^^ variable.other.c-style
#                       ^ variable.other.c-style
#                        ^^ keyword.operator.arithmetic
#                             ^ keyword.operator.list
#                               ^^ keyword.control
    :
done
# <- keyword.control

# <- - meta.scope.for-loop


####################
# Identifier names #
####################

$(( foo + 2 ))
#   ^^^ variable.other.c-style

(( foo++ ))
#  ^^^ variable.other.c-style

for i in "${foo[@]}"; do
#   ^ variable.other.loop
    :
done


################################################
# Quoting, interpolation and nested constructs #
################################################

[ ! -f foo.$foo ]
# <- punctuation.definition.logical-expression
# ^ keyword.operator.logical
#   ^^ keyword.operator.logical
#          ^ punctuation.definition.variable
#          ^^^^ variable.other.normal
#               ^ punctuation.definition.logical-expression

[ ! -f foo.$foo -a $foo -le 500 ]
# <- punctuation.definition.logical-expression
# ^ keyword.operator.logical
#   ^^ keyword.operator.logical
#          ^ punctuation.definition.variable
#          ^^^^ variable.other.normal
#               ^^ keyword.operator.logical
#                  ^ punctuation.definition.variable
#                  ^^^^ variable.other.normal
#                        ^^ keyword.operator.logical
#                               ^ punctuation.definition.logical-expression

[[ $str =~ ^$'\t' ]]
#       ^^ keyword.operator.logical
#          ^^^^^^ source.regexp

[[ $str =~ ^abc$var$ ]]
#       ^^ keyword.operator.logical
#          ^^^^ source.regexp
#              ^^^^ variable.other.normal
#                  ^ source.regexp

[[ $str =~ ^abc$(echo $var)$ ]]
#       ^^ keyword.operator.logical
#          ^^^^ source.regexp
#              ^^ punctuation.definition.string.begin
#                     ^^^^ variable.other.normal
#                          ^ source.regexp

[[ $str =~ \ ?[a-z]\  ]]
#       ^^ keyword.operator.logical
#          ^^^^^^^^^^ source.regexp

[[ $str =~ ^(bar|baz)[abc0-9]{1,2}$ ]]
#       ^^ keyword.operator.logical
#          ^^^^^^^^^^^^^^^^^^^^^^^^ source.regexp

[[ $str =~ "^(bar|baz)[abc0-9]{1,2}$" ]]
#       ^^ keyword.operator.logical
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double

[[ $str =~ $(echo $regex) ]]
#       ^^ keyword.operator.logical
#          ^^ punctuation.definition.string.begin
#            ^^^^ support.function.builtin
#                 ^ punctuation.definition.variable
#                 ^^^^^^ variable.other.normal
#                       ^ punctuation.definition.string.end

[[ $str =~ $regex ]]
#       ^^ keyword.operator.logical
#          ^ punctuation.definition.variable
#          ^^^^^^ variable.other.normal

: <<- EOF
# ^^^ keyword.operator.heredoc
#     ^^^ keyword.control.heredoc-token
    foo
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token

: << EOF
# ^^ keyword.operator.heredoc
#    ^^^ keyword.control.heredoc-token
    $variable
#   ^ punctuation.definition.variable
#   ^^^^^^^^^ variable.other.normal
    foo bar $( baz )
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token

: << 'EOF'
# ^^ keyword.operator.heredoc
#     ^^^ keyword.control.heredoc-token
    $variable
#   ^^^^^^^^^ string.unquoted.heredoc
    foo bar $( baz )
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token

cat <<<'
#   ^^^ keyword.operator.herestring
line 1
line 2
'
# <- string.quoted.single.herestring punctuation.definition.string.end

cat <<<"
#   ^^^ keyword.operator.herestring
line 1
line 2\"test
#     ^^ constant.character.escape
line 3
"
# <- string.quoted.double.herestring punctuation.definition.string.end

cat <<_ACEOF;
#   ^^ keyword.operator.heredoc
#     ^^^^^^ keyword.control.heredoc-token
    $variable
# <- string.unquoted.heredoc
#   ^ punctuation.definition.variable
_ACEOF
# <- keyword.control.heredoc-token

cat << EOF > file
#   ^^ keyword.operator.heredoc
#      ^^^ keyword.control.heredoc-token
#          ^ keyword.operator.redirect
#            ^^^^ - string.unquoted.heredoc - support.function.external
    $variable
# <- string.unquoted.heredoc
#   ^ punctuation.definition.variable
#   ^^^^^^^^^ variable.other.normal
These contents will be written to the file.
        This line is indented.
EOF
# <- keyword.control.heredoc-token


################################
# Heredoc with compact-command #
################################

print_info_text_compact () { cat <<EOF; do_something; }
#                                  ^^^ keyword.control.heredoc-token
#                                       ^^^^^^^^^^^^ - string.unquoted.heredoc
#                                                     ^ punctuation.definition.group
This is some info text.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token

# <- - string.unquoted.heredoc - meta.function

if [ true ]; then cat <<EOF; do_something; fi
#                       ^^^ keyword.control.heredoc-token
#                            ^^^^^^^^^^^^ - string.unquoted.heredoc
#                                          ^^ meta.scope.if-block keyword.control
Condition is met.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token

# <- - string.unquoted.heredoc - meta.scope.if-block


########################
# Nomal Heredoc usages #
########################

print_info_text () { cat <<EOF
This is some info text.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token
}
# <- punctuation.definition.group

# <- - string.unquoted.heredoc - meta.function

print_info_text () {
    cat <<EOF
This is some info text.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token
}
# <- punctuation.definition.group

# <- - string.unquoted.heredoc - meta.function

if [ true ]; then cat <<EOF
Condition is met.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token
fi
# <- meta.scope.if-block keyword.control

# <- - string.unquoted.heredoc - meta.scope.if-block

if [ true ]; then
    cat <<EOF
Condition is met.
# <- string.unquoted.heredoc
EOF
# <- keyword.control.heredoc-token
fi
# <- meta.scope.if-block keyword.control

# <- - string.unquoted.heredoc - meta.scope.if-block


###############
# Redirection #
###############

1>filename
# <- constant.numeric.file-descriptor
#^ keyword.operator.redirect

1>>filename
# <- constant.numeric.file-descriptor
#^^ keyword.operator.redirect

&>filename
# <- constant.numeric.file-descriptor
#^ keyword.operator.redirect

2>&1
# <- constant.numeric.file-descriptor
#^^ keyword.operator.redirect
#  ^ constant.numeric.file-descriptor

0<&-
#^^ keyword.operator.redirect
# <- constant.numeric.file-descriptor
#  ^ constant.numeric.file-descriptor

<&-
# <- keyword.operator.redirect
# ^ constant.numeric.file-descriptor

`command -v autoconf >/dev/null 2>&1`
#                               ^ constant.numeric.file-descriptor
#                                ^^ keyword.operator.redirect
#                                  ^ constant.numeric.file-descriptor

$(curl -I "https://google.com" 2> /dev/null)
#                              ^ constant.numeric.file-descriptor
#                               ^ keyword.operator.redirect


############
# Subshell #
############

"$( foo )"
#^ punctuation.definition.string.begin
#       ^ punctuation.definition.string.end

"` foo `"
#^ punctuation.definition.string.begin
#      ^ punctuation.definition.string.end

"$(( foo++ ))"
#    ^^^ variable.other.c-style
#       ^^ keyword.operator.arithmetic

$( foo $( bar $( baz ) ) )
# <- punctuation.definition.string.begin
#      ^^ punctuation.definition.string.begin
#             ^^ punctuation.definition.string.begin
#                    ^ punctuation.definition.string.end
#                      ^ punctuation.definition.string.end
#                        ^ punctuation.definition.string.end

$( foo ` bar ` )
# <- punctuation.definition.string.begin
#      ^ punctuation.definition.string.begin
#            ^ punctuation.definition.string.end
#              ^ punctuation.definition.string.end

$( foo "$(( bar + 1 ))" )
# <- punctuation.definition.string.begin
#       ^^^ punctuation.definition.string.begin
#                   ^^ punctuation.definition.string.end
#                       ^ punctuation.definition.string.end

foo="$( bar "$( baz "$( qux )" )" )"
#    ^^ punctuation.definition.string.begin
#            ^^ punctuation.definition.string.begin
#                    ^^ punctuation.definition.string.begin
#                           ^ punctuation.definition.string.end
#                              ^ punctuation.definition.string.end
#                                 ^ punctuation.definition.string.end

$(( ( RANDOM * 100 ) / 5 ))
# <- punctuation.definition.string.begin
#     ^^^^^^ variable.other.c-style
#            ^ keyword.operator.arithmetic
#              ^^^ constant.numeric.integer
#                    ^ keyword.operator.arithmetic
#                      ^ constant.numeric.integer
#                        ^^ punctuation.definition.string.end

$(( a=(2*(250+1))/5 ))
# <- punctuation.definition.string.begin
#   ^ variable.other.c-style
#    ^ keyword.operator.arithmetic
#       ^ keyword.operator.arithmetic
#         ^^^ constant.numeric.integer
#            ^ keyword.operator.arithmetic
#             ^ constant.numeric.integer
#                ^ keyword.operator.arithmetic
#                 ^ constant.numeric.integer
#                   ^^ punctuation.definition.string.end

plus=$(( $(echo "$errorCode") ))
#          ^ support.function.builtin


#########
# Array #
#########

OPTS=(--prefix=$PREFIX)
#    ^ punctuation.definition.array.begin
#              ^ punctuation.definition.variable
#              ^^^^^^^ variable.other.normal
#                     ^ punctuation.definition.array.end

OPTS+=(--prefix=$PREFIX)
#     ^ punctuation.definition.array.begin
#               ^ punctuation.definition.variable
#               ^^^^^^^ variable.other.normal
#                      ^ punctuation.definition.array.end

declare -A ERROR_MESSAGES=(
#                         ^ punctuation.definition.array.begin
    ["no msg"]=''
#   ^^^^^^^^^^ meta.structure.array-section
#   ^ punctuation.section.array.begin
#    ^^^^^^^^ string.quoted.double
#            ^ punctuation.section.array.end
#             ^ keyword.operator.assign
    [unknown]='Unknown error happened.'
#   ^^^^^^^^^ meta.structure.array-section
#   ^ punctuation.section.array.begin
#           ^ punctuation.section.array.end
#            ^ keyword.operator.assign
    [no util]="‘$util’ is required but wasn’t found on this system."
#   ^^^^^^^^^ meta.structure.array-section
#   ^ punctuation.section.array.begin
#           ^ punctuation.section.array.end
#            ^ keyword.operator.assign
#               ^ punctuation.definition.variable
#               ^^^^^ variable.other.normal
)
# <- punctuation.definition.array.end



############
# Backtick #
############

if [[ ! "`git status 2> /dev/null`" ]]; then
    # Sublime bug fix: `
    return
# <- - string.quoted.double
fi


#################
# Controversial #
#################

empty=$((echo hello) > output.txt)
#        ^^^^ support.function.builtin
#                    ^ keyword.operator.redirect
# Sublime bug fix: ))

user="$((who -m) 2>&1)"
#        ^^^ support.function.external
#                 ^^ keyword.operator.redirect
# Sublime bug fix: ))
#                  ^^ comment.line.number-sign

empty=$( (echo hello) > output.txt)
#         ^^^^ support.function.builtin
#                     ^ keyword.operator.redirect

grep 'foo' <( bar "$( baz )" )
#          ^^ punctuation.definition.string.begin
#                  ^^ punctuation.definition.string.begin
#                         ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end


####################
# Command Switches #
####################

echo -e Hello
#    ^ punctuation.definition.command-switch
#    ^^ support.command-switch

echo\
 -e Hello
#^ punctuation.definition.command-switch
#^^ support.command-switch

echo \
 -e Hello
#^ punctuation.definition.command-switch
#^^ support.command-switch

echo \
-e Hello
# <- punctuation.definition.command-switch
#^ support.command-switch

gcc input.c -o output.exe --verbose
#           ^ punctuation.definition.command-switch
#           ^^ support.command-switch
#                         ^^ punctuation.definition.command-switch
#                         ^^^^^^^^^ support.command-switch

rm -f -- -filename_starts_with_dash
#  ^ punctuation.definition.command-switch
#  ^^ support.command-switch
#     ^^ punctuation.definition.command-switch-end
#        ^ - punctuation.definition.command-switch


##################
# Special Design #
##################

var=true
#   ^^^^ variable.other.true

var=false;
#   ^^^^^ variable.other.false
#        ^ keyword.operator.list

git --switch=true;
#            ^^^^ variable.other.true
#                ^ keyword.operator.list

git --switch=false
#            ^^^^^ variable.other.false

foo='bar'
#^^ meta.variable.assigned
#  ^ keyword.operator.assign

foo[$bar]="Hello"
#^^^^^^^^ meta.variable.assigned
#        ^ keyword.operator.assign

foo[hello-world]="Hi"
#^^^^^^^^^^^^^^^ meta.variable.assigned
#               ^ keyword.operator.assign

sudo -s pip --upgrade install numpy
#^^^  support.function.privilege
#    ^^ support.command-switch
#       ^^^  support.function.external
#           ^^^^^^^^^ support.command-switch


###########################
# Misc. language features #
###########################

if [ true ];then
#           ^^^^ meta.scope.if-block keyword.control
    echo "HELLO"
fi

case "${foo}" in
# <- keyword.control
#     ^^ punctuation.definition.variable
#          ^ punctuation.definition.variable
#             ^^ keyword.control
    ( help | h ) bar ;;
#   ^ punctuation.definition.case-pattern
#          ^ punctuation.separator.pipe-sign
#              ^ punctuation.definition.case-pattern
#                    ^^ punctuation.terminator.case-clause
    do1 ) foo1 ;&
#   ^^ - keyword.control
#              ^^ punctuation.terminator.case-clause
    do2 ) foo2 ;;&
#   ^^ - keyword.control
#              ^^^ punctuation.terminator.case-clause
    *) bar
#   ^ keyword.operator.glob
#    ^ punctuation.definition.case-pattern
esac
# <- keyword.control

# <- - meta.scope.case-block

while :; do
# <- keyword.control
#     ^ support.function.builtin
#      ^ keyword.operator.list
#        ^^ keyword.control
    continue
#   ^^^^^^^^ keyword.control
    break
#   ^^^^^ keyword.control
done
# <- keyword.control

# <- - meta.scope.while-loop

if-up
# <- - keyword.control
# ^ - keyword

foo:if:bar
#  ^ - keyword
#   ^^ - keyword.control
#     ^ - keyword

func-while
#   ^ - keyword
#    ^^^^^ - keyword.control

func_for
#    ^^^ - keyword.control

func-for
#   ^ - keyword
#    ^^^ - keyword.control

dd if=/dev/hda of=/dev/hdb
#  ^^ - keyword.control
#    ^ keyword.operator.assign
#     ^ - keyword.control
#         ^ - keyword.control
#                ^ keyword.operator.assign
#                 ^ - keyword.control
#                     ^ - keyword.control

rm -rf mkdir
#      ^^^^^ - support.function

echo do
#    ^^ - keyword.control

export cat
#      ^^^ - support.function

export cat=1
#      ^^^ - support.function
#         ^ keyword.operator.assign

export cat=$(git --version)
#      ^^^ - support.function
#         ^ keyword.operator.assign

cat=1
# <- - support.function
#  ^ keyword.operator.assign

cd=cat
# <- - support.function
#  ^^^ - support.function

echo git rev-list "$(echo --all)" | grep -P 'c354a80'
# <- support.function.builtin
#    ^^^ - support.function
#                  ^^ punctuation.definition.string.begin
#                    ^^^^ support.function.builtin
#                              ^ punctuation.definition.string.end
#                                 ^ keyword.operator.pipe
#                                   ^^^^ support.function.external
#                                        ^^ support.command-switch
#                                           ^ punctuation.definition.string.begin
#                                                   ^ punctuation.definition.string.end

echo $(echo git --version) echo `$(echo git --version)` "$(echo git --version)"
# <- support.function.builtin
#      ^^^^ support.function.builtin
#           ^^^ - support.function
#                          ^^^^ - support.function
#                                  ^^^^ support.function.builtin
#                                       ^^^ - support.function
#                                                          ^^^^ support.function.builtin
#                                                               ^^^ - support.function

echo `echo git --version`
# <- support.function.builtin
#     ^^^^ support.function.builtin

echo echo $(git) "$(git)" `$(git)` `git` | grep -P 'c354a80'
# <- support.function.builtin
#    ^^^^ - support.function
#           ^^^ support.function.external
#                   ^^^ support.function.external
#                            ^^^ support.function.external
#                                   ^^^ support.function.external
#                                        ^ keyword.operator.pipe
#                                          ^^^^ support.function.external
#                                               ^^ support.command-switch
#                                                  ^ punctuation.definition.string.begin
#                                                          ^ punctuation.definition.string.end

echo cat \
# <- support.function.builtin
#    ^^^ - support.function
#        ^ punctuation.definition.multiline
     cat
cat

echo cat \
     cat
#    ^^^ - support.function
cat
# <- support.function.external

echo cat > cat \
# <- support.function.builtin
#    ^^^ - support.function
#        ^ keyword.operator.redirect
#          ^^^ - support.function
#              ^ punctuation.definition.multiline
     cat
cat

echo cat > cat \
     cat
#    ^^^ - support.function
cat
# <- support.function.external

echo `echo git --version` echo | grep -P 'c354a80'
# <- support.function.builtin
#     ^^^^ support.function.builtin
#          ^^^ - support.function
#                         ^^^^ - support.function
#                              ^ keyword.operator.pipe
#                                ^^^^ support.function.external


#############################
# Others from Github issues #
#############################

` findfs UUID=00000000 `
#                       ^ -string.interpolated.backtick


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

# arbitrary heredoc identifier with extra compound commands
cat <<_ACEOF; echo hello;
    world
_ACEOF

# Note that the following is equivalent to "echo-e Hello"
# That is, the "-e" is not a command switch.
echo\
-e Hello
