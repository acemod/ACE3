---
title: Using CBA Settings in ACE3
description: With v3.12.0 we are dropping the ACE3 Settings System and now are using CBA Settings
parent: posts
image: /img/news/171220_cbaPost2.jpg
author: Pabstmirror, bux
layout: post
---

As announced mid november the upcoming ACE3 release (v3.12.0) will make the transition to using [CBA Settings](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System){:target="_blank"} to control the many settings ACE3 has.

We have tried to make the change as smooth as possible.

<!--more-->

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">PSA for all admins: We will use CBA&#39;s settings system for the next ACE3 version (v3.12.0) and will drop ours (some backward compatibility remains)<a href="https://t.co/QOkjE2bqwv">https://t.co/QOkjE2bqwv</a><a href="https://t.co/gkCwXjFTL4">https://t.co/gkCwXjFTL4</a></p>&mdash; ACE3Mod (@ACE3Mod) <a href="https://twitter.com/ACE3Mod/status/930487182732742657?ref_src=twsrc%5Etfw">November 14, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## Players

All of your old (client settable) settings should transfer automatically.

The biggest change is how to access the settings now; from the escape menu hit `OPTIONS` and then `ADDON OPTIONS`.

## Mission Makers

Old mission should still be fully compatible with ACE3 v3.12.0.

However the old methods of changing settings (Setting Modules and `class ace_settings` in `description.ext`) are considered deprecated (old modules will still function, but new ones are no longer placeable).

All settings are also subject to backwards incompatible changes with future ACE3 versions. We recommend switching to changing settings via the CBA Eden Editor interface and deleting any old ACE Setting modules. From Eden Editor click on the `SETTINGS` -> `ADDON OPTIONS`.

## Server Admins

`ace_server.pbo` / `ACE_ServerSettings` has been removed in ACE3 v3.12.0.

Refer to CBA's [Server Settings](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#server-settings){:target="_blank"} and [Userconfig](https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#userconfig){:target="_blank"} to change settings for your server.

### Convert your current server settings

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">A nifty tool made by cuel that converts ACE3 settings to CBA settings:<a href="https://t.co/vfPba1lvkr">https://t.co/vfPba1lvkr</a> <a href="https://t.co/8g4rJzUL0x">https://t.co/8g4rJzUL0x</a></p>&mdash; ACE3Mod (@ACE3Mod) <a href="https://twitter.com/ACE3Mod/status/940960121986998272?ref_src=twsrc%5Etfw">December 13, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


## Addon / Script Makers

- ACE3 will convert all config based settings to CBA Settings automatically (except `typeName = "ARRAY"`).
- Non-public function `ace_common_fnc_addSettings` has been removed.
- Non-public function `ace_common_fnc_setSetting` has changed and may not function as before.
- It is critical that calls to `ace_common_fnc_readSettingFromModule` are now done **globaly** instead of just on the server.

It is also recommended to deprecate `(scope = 1;)` your custom setting modules.

- ACE Events `ace_settingsInitialized` and `ace_settingChanged` will continue to work normally.
