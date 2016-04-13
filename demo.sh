#!/bin/bash

# This file is a sort of test suite for bash syntax highlighting. It is not
# intended to be parsed or run, just viewed in an editor.


####################################################
# Strings and interpolation in parameter expansion #
####################################################

# Strings appearing in expansion constructs should be treated as such.
${foo:-bar}     # 'bar' is a literal string
${foo:='bar'}   # "'bar'" is a literal string
${foo//bar/baz} # 'bar' and 'baz' are literal strings

# Strings in expansion constructs should support interpolation.
${foo:=`bar`}        # Command substitution should be recognized
${foo:=$( bar )}     # Command substitution should be recognized
${foo:=$(( 1 + 1 ))} # Arithmetic substitution should be recognized
${foo:=$bar}         # Variables should be recognized
${foo:="$bar"}       # Variables should be recognized


#################################
# Braces in parameter expansion #
#################################

# The '\}' on the following line should be treated as a string literal (or
# escape sequence); it should NOT terminate the expansion construct.
${foo//foo\}foo\/foo/foo}
# The quoted part of the following line should be treated as a string, with the
# '${bar}' part specifically being an interpolated variable. The closing '}' in
# '${bar}' should NOT terminate the '${foo:=...}' expansion construct.
${foo:="${bar} baz"}

# Sublime bug fix: "

${!varprefix*}
${!varprefix@}

${var#Pattern}
${var##Pattern}
${var###Pattern}
${var%Pattern}
${var%%Pattern}
${var%%%Pattern}


####################################################################
# Parameter-expansion operators                                    #
# cf. http://www.tldp.org/LDP/abs/html/parameter-substitution.html #
####################################################################

# Parameter-expansion operators should be treated as such only where
# appropriate. They should NOT be treated as unqualified operators anywhere they
# appear in an expansion construct.
${foo//%/} # '%' is not an operator here
${foo//#/} # '#' is not an operator here
${foo//!/} # '!' is not an operator here
${foo//:/} # ':' is not an operator here
${foo//@/} # '@' is not an operator here

# Expansion operators which can only appear before an identifier, such as '#'
# and '!', should not be treated as expansion operators after an identifier.
${foo#} # duplicated with ${var#Pattern} where 'Pattern' is empty?
${foo!} # '!' is not a operator here indeed
${var:pos:len}

# When using the replace operators ('/' and '//'), escaped and un-escaped
# slashes in the needle and replacement strings should be handled correctly.
# Slashes need be escaped only in the needle; escaping slashes in the
# replacement is optional.
${foo//a\/b/c/d}
#      ^^    ^     These slashes are operators
#          ^   ^   These are not

# The '^' and ',' expansion operators (and friends) should be treated as such,
# where appropriate.
${foo^}  # '^'  is an operator (upper-case initial)
${foo,}  # ','  is an operator (lower-case initial)
${foo^^} # '^^' is an operator (upper-case all)
${foo,,} # ',,' is an operator (lower-case all)

${foo,,,Pattern}
${foo,,Pattern}

# The '-', '+', '=', and '?' expansion operators (and friends) should be treated
# as such, where appropriate.
${foo-bar}  # '-'  is an operator (substitute if unset)
${foo:-bar} # ':-' is an operator (substitute if unset or null)
${foo+bar}  # '+'  is an operator (substitute if set)
${foo:+bar} # ':+' is an operator (substitute if set and not null)
${foo=bar}  # '='  is an operator (set if not set)
${foo:=bar} # ':=' is an operator (set if not set or null)
${foo?bar}  # '='  is an operator (abort if not set)
${foo:?bar} # ':=' is an operator (abort if not set or null)


###################
# Misc. operators #
###################

# The '=' in a variable assignment should be recognized as an assignment
# operator.
foo='bar'

# The '=' in variable-related shell built-ins like 'export' should be recognized
# as an assignment operator.
export foo='bar'

# Conditional operators in both double and single brackets should be recognized
# as such.
[  -n "${foo}" ]
[[ -n "${foo}" ]]
[  "${foo}" != 'bar' ]
[[ "${foo}" != 'bar' ]]
echo >> a

anyprogram >>! fileb
echo [[ "${foo}" != 'bar' ]]

# Semi-colons should be highlighted as operators in C-style loop constructs.
foo; bar; baz


####################
# Identifier names #
####################

# The left side of a variable assignment should be recognized as a variable
# name.
foo='bar'

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

# The iteration variable name in a `for` loop should be treated as such.
for i in "${foo[@]}"; do # 'i' is a variable name
    :
done

# Possibly the variable names passed to other shell built-ins known to support
# them should be treated as such? (Note: What to do if they're quoted?)
printf -v foo 'bar' # 'foo' is a variable name
read -r foo bar baz # 'foo', 'bar', and 'baz' are variable names
read -a foo         # 'foo' is a variable name

# Variable names in arithmetic and C-style loop constructs should be treated as
# such.
$(( foo + 2 )) # 'foo' is a variable name
(( foo++ ))      # 'foo' is a variable name

for (( i = 0; i < RAND; i++ )); do # 'i' and 'RAND' are variable names
    :
done


################################################
# Quoting, interpolation and nested constructs #
################################################

# Regular-expression patterns should be highlighted as regular expressions, or
# at least strings.
[[ "${foo}" =~ ^(bar|baz)$ ]]

# The '<<-' heredoc operator should be recognized as such.
: <<- EOF
    foo
EOF

# Heredoc bodies should be treated as interpolated strings.
: << EOF
    $variable
    foo bar $( baz )
EOF

# Bodies of heredocs in which the delimiter is single-quoted should be treated
# as literal strings (no interpolation).
: << 'EOF'
    $variable
    foo bar $( baz )
EOF

# Redirection can be used right after heredoc
cat << EOF > /tmp/yourfilehere
    $variable
These contents will be written to the file.
        This line is indented.
EOF


################################
# Heredoc with compact-command #
################################

print_info_text_compact () { cat <<EOF; do_something; }
This is some info text.
EOF

# scope before this line should be `source.shell`

if [ true ]; then cat <<EOF; do_something; fi
Condition is met.
EOF

# scope before this line should be `source.shell`


########################
# Nomal Heredoc usages #
########################

print_info_text () { cat <<EOF
This is some info text.
EOF
}

print_info_text () {
    cat <<EOF
This is some info text.
EOF
}

if [ true ]; then cat <<EOF
Condition is met.
EOF
fi

if [ true ]; then
    cat <<EOF
Condition is met.
EOF
fi


###############
# Redirection #
###############

# Redirect stdout to file "filename."
1>filename
# Redirect and append stdout to file "filename."
1>>filename
# Redirect both stdout and stderr to file "filename."
# This operator is now functional, as of Bash 4, final release.
&>filename
# Redirects stderr to stdout.
2>&1
# Close stdin.
0<&-
<&-


############
# Subshell #
############

# Substitution constructs inside double-quotes should be recognized as such.
"$( foo )"     # $( foo ) should be interpolated
"`  foo `"     # `  foo ` should be interpolated
"$(( foo++ ))" # $(( foo++ )) should be interpolated

# Substitution constructs should support nesting.
$( foo $( bar $( baz ) ) )
$( foo ` bar ` )
$( foo "$(( bar + 1 ))" )
foo="$( bar "$( baz "$( qux )" )" )"
$(( ( RANDOM * 100 ) / 5 ))
$(( a=(2*(250+1))/5 ))


#################
# controversial #
#################

empty=$((echo hello) > output.txt)
# Sublime bug fix: ))
empty=$( (echo hello) > output.txt)

grep 'foo' <( bar "$( baz )" )


####################
# Command Switches #
####################

echo -e Hello
gcc input.c -o output.exe --verbose


##################
# Special Design #
##################

# following "true" are scoped "variable.other.true.shell"
var=true
# following "false" are scoped "variable.other.false.shell"
var=false

git --switch=true
git --switch=false

###########################
# Misc. language features #
###########################

# The `in` in a `case` statement should be highlighted as a control key word.
case "${foo}" in
    ( help | -h ) bar ;;
    *) bar ;;
esac

# `continue` and `break` should be highlighted as control key words.
while :; do
    continue
    break
done

# Key words and names of built-ins should be treated as such only where
# appropriate. It is NOT accurate to use patterns like '\bif\b'.
if-up      # 'if' is not a control key word here
foo:if:bar # 'if' is not a control key word here
func-while # 'while' is not a control key word here
func_for   # 'for' is not a control key word here
func-for   # 'for' is not a control key word here
dd if=/dev/hda of=/dev/hdb # 'if' is not a control key word here

# Test cases for shell grammar.
rm -rf mkdir                # 'mkdir' is not a control key word here
echo do                     # 'do' is not a control key word here
export cat                  # 'cat' is not an executable here
export cat=1                # 'cat' is not an executable here
export cat=$(git --version) # 'cat' is not an executable here
cat=1                       # 'cat' is not a executable here

# Test cases for 'echo'. Things following 'echo' may be considered as strings.
echo git rev-list "$(echo --all)" | grep -P 'c354a80'
echo $(echo git --version) echo `$(echo git --version)` "$(echo git --version)"
echo `echo git --version`
echo echo $(git) "$(git)" `$(git)` `git` | grep -P 'c354a80'

echo cat \
     cat
cat

echo cat > cat \
     cat
cat

echo `echo git --version` echo | grep -P 'c354a80'
#                         ^^^^
#                         This 'echo' should be a plain text.
