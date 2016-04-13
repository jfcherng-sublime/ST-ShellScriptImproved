Sublime-ShellScriptImproved
===========================

A better ShellScript (Bash) syntax highlight for Sublime Text >= 3092.


Screenshots
===========

Left / Right = ShellScript (Bash) / ShellScript Improved
![screenshot](https://raw.githubusercontent.com/jfcherng/Sublime-ShellScriptImproved/gh-pages/images/screenshot.png)


Optional
========

Note that an extra rule is added to my `.tmTheme` in above screenshots in order to set text to its default color, i.e., white on dark theme and black on light theme mostly. (I just can not find other way to set text to the default text color...) This resets the color of `TEXT` in `$(echo TEXT)` and other things like that.

```xml
<dict>
    <key>name</key>
    <string>Reset Color</string>
    <key>scope</key>
    <string>string meta.reset.color, meta.reset.color</string>
    <key>settings</key>
    <dict>
        <key>foreground</key>
        <string>#FFFFFF</string>
    </dict>
</dict>
```

Also, those scopes may be missing in your theme. You may add/adjust them to get a better color highlighting.

```xml
<dict>
    <key>name</key>
    <string>Shell - variable</string>
    <key>scope</key>
    <string>variable.other.normal.shell, variable.other.positional.shell, variable.other.bracket.shell, variable.other.special.shell, variable.other.loop.shell, variable.other.c-style.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#AE81FF</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - true</string>
    <key>scope</key>
    <string>variable.other.true.shell</string>
    <key>settings</key>
    <dict>
        <key>foreground</key>
        <string>#AAFFFF</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - false</string>
    <key>scope</key>
    <string>variable.other.false.shell</string>
    <key>settings</key>
    <dict>
        <key>foreground</key>
        <string>#FFAAFF</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - built-in command</string>
    <key>scope</key>
    <string>support.function.builtin.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#50AAFF</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - external command</string>
    <key>scope</key>
    <string>support.function.external.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#0684F4</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - pipe-sign/parentheses in "case"</string>
    <key>scope</key>
    <string>punctuation.separator.pipe-sign.shell, punctuation.definition.case-pattern.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#F92672</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - ;; in "case"</string>
    <key>scope</key>
    <string>punctuation.terminator.case-clause.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#F92672</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - command switch</string>
    <key>scope</key>
    <string>support.command-switch.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold italic</string>
    </dict>
</dict>
```


See Also
========

- [SublimeLinter-shellcheck](https://packagecontrol.io/packages/SublimeLinter-shellcheck)


License
=======

The MIT License (MIT)

Copyright (c) 2016 Jack Cherng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
