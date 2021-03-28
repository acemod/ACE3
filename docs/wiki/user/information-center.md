---
layout: wiki
title: Information Center
description: Downloaded ACE3 and have no idea where to start? This page serves as a document to help new players get started with things or get an answer to some of your questions.
group: user
order: 3
parent: wiki
---

Downloaded ACE3 and have no idea where to start? This page serves as a starting point to help new players and mission makers understand what's available to them.

**Q:** Don't know where to begin your ACE3 journey?  
**A:** [**Check out ACE3 features**]({{ site.baseurl }}/wiki/feature/)

**Q:** Looking for information on ACE3 class names?  
**A:** [**Here they are**]({{ site.baseurl }}/wiki/class-names.html)

## 1. FAQ

### 1.1 Features

**Q:** Feature X was in ACE2/AGM/CSE where is it?  
**A:** It's going to be ported at some point.

**Q:** Why was my feature request closed on GitHub?  
**A:** Feature requests should initially be added to [issue #3594](https://github.com/acemod/ACE3/issues/3594/) for easy tracking.

**Q:** I want to disable feature X, how do I do that?  
**A:** Remove the associated module (delete its PBO). Note, however, that some features might depend on others; make sure to check dependencies before disabling anything.

### 1.2 Issues

**Q:** Experiencing extension errors.  
**A:** Start the game once with the Arma 3 Launcher, close it, then start the game with your usual launcher (ArmA3Sync, Play withSix, etc &hellip;).  

>The simple explanation is that the BattlEye process wasn't ended properly and is unable to start again properly, launching it with the Arma 3 Launcher is the only known solution to fix it.

**Q:** ACE3 fonts are outdated.  
**A:** This happens because you have file patching enabled, restart your game without the `-filePatching` param.

### 1.3 Compatibility

**Q:** (mod) doesn't have some ACE3 features.  
**A:** ACE3 isn't and can't be responsible for compatibility with every (mod), due it's size other (mod) authors are strongly encouraged to provide that from their side. Compatibility PBO's currently in ACE3 are there to kick-start and provide examples for (mod) authors.

**Q:** ACE3 causes issues in (mod).  
**A:** If you've found an issue with ACE3 please make sure that ACE3 is really the cause of the problem. To do this try to reproduce the issue with using only `@CBA_A3` and `@ace` on a newly created mission. ACE3 isn't and can't be responsible for all mod conflicts, due it's size other mod authors are strongly encouraged to provide that from their side.
