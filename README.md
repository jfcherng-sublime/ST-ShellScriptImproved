# Sublime-ShellScriptImproved
A better ShellScript (Bash) syntax highlight for Sublime Text >= 3092

# Screenshot
Left / Right = ShellScript (Bash) / ShellScript Improved
![screenshot](https://raw.githubusercontent.com/jfcherng/Sublime-ShellScriptImproved/gh-pages/images/screenshot.png)

# Optional
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

# License

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
