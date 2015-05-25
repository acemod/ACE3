---
layout: wiki
title: How to report an issue
description: If you've found an issue with ACE3 please read this entry before reporting it. 
group: user
order: 10
parent: wiki
---

### Before reporting

If you've found an issue with ACE3 please make sure that ACE3 is really the cause of the problem. To do this try to reproduce the issue with using only `@cba_a3` and `@ACE3` on a newly created mission.

<div class="panel callout">
    <h5>Please note:</h5>
    <p>It's not a valid to simply remove <code>@ACE3</code> from the mod list to confirm that ACE3 is the culprit.</p>
    <p>If the error happens when using a <b>third-party mod</b> contact the author of the appropriate mod and report the issue there.</p>
</div>

### Reporting the issue

Head over to the <a href="{{ site.githubUrl }}/issues" target="_blank">ACE3 GitHub issue tracker</a> and press the <a href="{{ site.githubUrl }}/issues/new" target="_blank">"New issue"</a> button in the top right corner. Add a descriptive title and copy the following issue template in to the text area:

```
ACE3 Version: 3.x.x

**Mods:**
* @cba_a3
* @ace3

**Placed ACE3 Modules:**
* *Add the list of modules you have placed on the map. Use 'None' if the error occurs without using any modules.*

**Description:**
*Add a detailed description of the error. This makes it easier for us to fix the issue.*

**Steps to reproduce:**
* *Add the steps needed to reproduce the issue.*

**Where did the issue occur?**
*A possible answer might be "Multiplayer", "Singleplayer"*

**RPT log file:**
*Add a link (pastebin.com) to the client or server RPT file.*
```

A video of the issue might be helpful in resolving it faster.


Github uses <a href="http://daringfireball.net/projects/markdown/syntax" target="_blank">"Markdown"</a> to style the output. If you want to know more about it (e.g. how to <a href="https://help.github.com/articles/markdown-basics/#styling-text" target="_blank">turn text bold</a>, how to denote <a href="https://help.github.com/articles/markdown-basics/#inline-formats" target="_blank">code blocks</a> or <a href="https://help.github.com/articles/markdown-basics/#multiple-lines" target="_blank">inline code</a>) have a look at the <a href="https://help.github.com/articles/github-flavored-markdown/" target="_blank">GitHub markdown documentation</a>.
