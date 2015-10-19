# Reporting an issue

## Before reporting

If you have found an issue with ACE3 please make sure that ACE3 is really the cause of the problem. To do this try to reproduce the issue with using only `@CBA_A3` and `@ace` on a newly created mission.

Indicate if the issue appears on stable or development version. In case it is the development version, please also include the commit SHA-1 hash.

<div class="panel callout">
    <h5>Please note:</h5>
    <p>It's not a valid to simply remove <code>@ace</code> from the mod list to confirm that ACE3 is the culprit.</p>
    <p>If the error happens when using a <b>third-party mod</b> contact the author of the appropriate mod and report the issue there.</p>
</div>

## Reporting the issue

Head over to the <a href="{{ site.githubUrl }}/issues" target="_blank">ACE3 GitHub issue tracker</a> and press the <a href="{{ site.githubUrl }}/issues/new" target="_blank">"New issue"</a> button in the top right corner. Add a descriptive title and copy the following issue template in to the text area:

```
ACE3 Version: 3.x.x
(indicate if stable or dev, if dev indicate the commit the version is based on)

**Mods:**
* `@CBA_A3`
* `@ace`

**Placed ACE3 Modules:**
* *Add the list of modules you have placed on the map. Use 'None' if the error occurs without using any modules.*
* You can also press the `Debug to` button in the ACE3 option menu (escape -> ACE3 options -> Debug to) and add a link (pastebin.com) to the results.

**Description:**
* Add a detailed description of the error. This makes it easier for us to fix the issue.*

**Steps to reproduce:**
* *Add the steps needed to reproduce the issue.*

**Where did the issue occur?**
* A possible answer might be "Multiplayer", "Editor" or "Singleplayer"*

**RPT log file:**
* Add a link (pastebin.com) to the client or server RPT file.*
```

A video of the issue might be helpful in resolving it faster.


Github uses <a href="http://daringfireball.net/projects/markdown/syntax" target="_blank">"Markdown"</a> to style the output. If you want to know more about it (e.g. how to <a href="https://help.github.com/articles/markdown-basics/#styling-text" target="_blank">turn text bold</a>, how to denote <a href="https://help.github.com/articles/markdown-basics/#inline-formats" target="_blank">code blocks</a> or <a href="https://help.github.com/articles/markdown-basics/#multiple-lines" target="_blank">inline code</a>) have a look at the <a href="https://help.github.com/articles/github-flavored-markdown/" target="_blank">GitHub markdown documentation</a>.

# Feature Requests

## Background
ACE2, AGM and CSE had a lot of features implemented or planned. All of them are or have been evaluated for inclusion in ACE3 itself, and we'd like to port the majority of them eventually. However, due to time constraints, we have managed to finish only a fraction of the job so far.

Please refrain from making requests for any planned or existing features from either ACE2, AGM or CSE. Most of them are already being or have been considered for porting or a rewrite.

## Requesting a feature
In order to avoid duplicates and keep the issue tracker organized, we have created a common issue for <a href="{{ site.githubUrl }}/issues/414/" target="_blank">ACE 3 Feature requests</a>. Any and all relevant requests should be submitted there, where they will also get discussed and evaluated. Before adding a new one, make sure to check the previous entries from the thread and do a quick search for similar suggestions; please don't reiterate requests for features that had already been accepted for inclusion, or those which were disregarded earlier.

Following their approval, feature requests may be moved by moderators to a separate issue for further discussion.

# Regarding Pull Requests (PRs)
- You want to help but don't know where to start ? Check the wiki entry for [setting up the development environment](http://ace3mod.com/wiki/development/setting-up-the-development-environment.html)
- [Make sure to respect the file structure](http://ace3mod.com/wiki/development/modularity-and-pbo-structure.html)
- [Make sure to respect the coding guidelines](http://ace3mod.com/wiki/development/coding-guidelines.html)
