---
title: Medical Rewrite
description: Status report on the ACE3 Medical Rewrite
parent: posts
image:
author: Glowbal, mharis001
layout: post
---

One of ACE3's longest development projects (and probably most discussed) is the Medical Rewrite. Started back in July 2016, the medical rewrite received contributions by over a dozen individual contributors. Unfortunately, it has taken a bit more time than we originally hoped.

Fortunately, thanks to recent strides, the project is approaching its end. Meaning, over the next couple weeks, the focus will shift into finalizing the last bits and pieces of the rewrite.

<!--more-->

Along with this final push, a release candidate has been prepared in order to gather additional feedback (more on this below).

## Medical Rewrite?

The medical component is one of the most used features from ACE3. It does a lot of things well, however, in some areas it falls short. It is prone to weird behaviour that is difficult to fix, or features we are just not happy with.

Besides things affecting gameplay, the medical component's code is quite complex. This is a large obstacle against the introduction of fixes or new features. The medical rewrite aims to address both the issues with gameplay and the code.

It does this by removing the concept of "Basic vs Advanced Medical", instead opting to provide users a set of settings to more finely tweak the medical system to their liking. A major push has been made in cleaning up (and removing) settings that were unclear or unnecessary. Our goal was to provide settings that offer granular control of the system, all while keeping it clear exactly what each setting does.

In addition, the entire system has been split up into multiple smaller, more approachable parts (meaning you will see a couple new PBOs for medical).

## Backwards Compatibility

We have always attempted to maintain backwards compatibility whenever possible. This has been our policy for the past 4 years. We have also tried to do this for the medical rewrite, however due to significant changes to the entire system, complete backwards compatibility is not possible for the rewrite.

We know there are some communities and mods out there that depend on functions or code from ACE3 Medical. If you or your project depend on ACE3 Medical, we encourage you to try out the medical rewrite release candidate. This way, if any functionality you depend on is no longer available or is different with the new system, we can assist you in migrating over to the new system or include a patch to fix it on our side.

## Release Candidate and Feedback Survey

As mentioned earlier, a [release candidate](https://github.com/acemod/ACE3/releases/tag/v3.13.0-rc1) of the medical rewrite is available to give players and communities the opportunity to provide feedback before its public release. We will continue to utilize user feedback after release to further improve and expand the system.

In order to make it easier for both users to submit feedback and us to utilize it towards balancing the new medical system and fix any issues, a [feedback survey](https://forms.gle/5pKeXMJ5hfZYjuxZ6) is also available.

## Closing Remarks

The medical rewrite will be released publicly in ACE3 v3.13.0. It will bring an exciting, more streamlined medical system to ACE3 for players and communities to explore.

We are still in need for translations for some languages within the ACE3 project. Please have a look at [this GitHub issue to track the progress and what languages lack translations](https://github.com/acemod/ACE3/issues/367){:target="_blank"}. Any and all help with this is very appreciated.

Make sure to [follow us on twitter](https://twitter.com/intent/follow?screen_name=ace3mod&tw_p=followbutton){:target="_blank"} and to [like our facebook page](https://www.facebook.com/ACE3Mod/){:target="_blank"}.
