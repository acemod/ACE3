---
layout: wiki
title: How to report an issue
description: If you have found an issue with ACE3 please read this entry before reporting it.
group: user
order: 10
parent: wiki
---

### Before reporting

If you have found an issue with ACE3 please make sure that ACE3 is really the cause of the problem. To do this try to reproduce the issue with using only `@CBA_A3` and `@ace` on a newly created mission.

Indicate if the issue appears on stable or development version. In case it is the development version, please also include the commit SHA-1 hash.

<div class="panel callout">
    <h5>Please note:</h5>
    <p>It's not a valid to simply remove <code>@ace</code> from the mod list to confirm that ACE3 is the culprit.</p>
    <p>If the error happens when using a <b>third-party mod</b> contact the author of the appropriate mod and report the issue there.</p>
</div>

### Reporting the issue

Head over to the [ACE3 GitHub issue tracker]({{ site.ace.githubUrl }}/issues){:target="_blank"} and press the ["New Issue"]({{ site.ace.githubUrl }}/issues/new){:target="_blank"} button in the top right corner. Fill out the issue template. Add a link ([gist](https://gist.github.com){:target="_blank"} or [pastebin](http://pastebin.com){:target="_blank"}) to the client and/or server RPT file. An instruction to find your RPT files can be found [here](https://community.bistudio.com/wiki/Crash_Files#Arma_3){:target="_blank"}.

A short video clip of the issue might be helpful in resolving it faster.
