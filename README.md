❌ [Deprecated] Sublime-ShellScriptImproved
========================================

A better ShellScript (Bash) syntax highlight for Sublime Text >= 3143.


Important Note
==============

The official `ShellScript (Bash)` syntax has been rewritten.
All following comparisons are with the one **BEFORE** rewritten.

I deprecated this plugin because the new official Bash highlighting is
much better than the former one (and better than this plugin).
Thus, this plugin is no longer needed I guess.


Pros
----

- It fixes quite lots of bugs which exist in the official `ShellScript (Bash)` syntax.
- It parses things more grammatically while the official one is just like a keyword highlighter.


Cons
----

- It is designed for Bash only while the official one is designed for general shell scripts.
- You may have to add customized scopes to your color scheme if you do not want to use the bundled one.
- Its source code is as messy as the official one's but this does not matter if you are not a maintainer.


Screenshots
===========

Left / Right = Official ShellScript (Bash) / ShellScript Improved
![screenshot](https://raw.githubusercontent.com/jfcherng/Sublime-ShellScriptImproved/gh-pages/images/screenshot/screenshot.png)


Color scheme
============

There are quite a lot of scopes that may be missing in the color scheme you are using.
If you want to add them by yourself, see the `Customization from Your Color Scheme` section.
Or, you can set the syntax specific settings to use the color scheme which is shipped with this package.

To do that,

1. Open a file with `ShellScript Improved` syntax.
1. Go to `Preferences` » `Settings - More` » `Syntax Specific - User`
1. Add the `color_scheme` item into the settings file and then save.

```javascript
{
    // use a bundled .tmTheme file while writing shell scripts
    "color_scheme": "Packages/ShellScriptImproved/color_schemes/dark.tmTheme",
    // or, if you are using Sublime Text >= 3149, using a .sublime-color-scheme file is recommended
    "color_scheme": "Packages/ShellScriptImproved/color_schemes/dark.sublime-color-scheme",
}
```

> That color scheme is the exact one I use in my Sublime Text so there is only a dark one.
> You would get the same highlighting as shown in the screenshot.


Customization from Your Color Scheme
====================================

Note that an extra rule is added to my `.tmTheme` in above screenshots in order to set text to its default color, i.e., white on dark theme and black on light theme mostly. (I just can not find other way to set text to the default text color...) This resets the color of `TEXT` in `$(echo TEXT)` and other things like that.

```xml
<dict>
    <!-- force codes to be shown as the default color (white) -->
    <key>name</key>
    <string>Embedded</string>
    <key>scope</key>
    <string>meta.embedded</string>
    <key>settings</key>
    <dict>
        <key>foreground</key>
        <string>#FFFFFF</string>
    </dict>
</dict>
<dict>
    <!-- force codes to be shown as the default color (white) -->
    <key>name</key>
    <string>Reset Color</string>
    <key>scope</key>
    <string>meta.reset.color</string>
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
    <string>variable.other.normal.shell, variable.other.positional.shell, variable.other.bracket.shell, variable.other.special.shell, variable.other.loop.shell, variable.other.c-style.shell,variable.other.positional.shell</string>
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
    <string>Shell - bracket variable in meta.reset.color</string>
    <key>scope</key>
    <string>meta.reset.color variable.other.bracket.shell, meta.reset.color variable.other.bracket.shell variable.other.bracket.shell, meta.reset.color variable.other.bracket.shell variable.other.bracket.shell variable.other.bracket.shell</string>
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
    <string>Shell - privilege command</string>
    <key>scope</key>
    <string>support.function.privilege.shell</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#FF0000</string>
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
    <string>Shell - punctuation variable</string>
    <key>scope</key>
    <string>punctuation.definition.variable.shell</string>
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
    <string>Shell - punctuation definition</string>
    <key>scope</key>
    <string>punctuation.definition.string</string>
    <key>settings</key>
    <dict>
        <key>fontStyle</key>
        <string>bold</string>
        <key>foreground</key>
        <string>#E6DB74</string>
    </dict>
</dict>
<dict>
    <key>name</key>
    <string>Shell - pipe-sign/parentheses in `case`</string>
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
    <string>Shell - `;;` in `case`</string>
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

- [Tcsh and Csh Mode](https://packagecontrol.io/packages/Tcsh%20and%20Csh%20Mode)
- [SublimeLinter-shellcheck](https://packagecontrol.io/packages/SublimeLinter-shellcheck)


Supporters <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ATXYY9Y78EQ3Y" target="_blank"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" /></a>
==========

Thank you guys for sending me some cups of coffee.

- [deterenkelt](https://github.com/deterenkelt)
