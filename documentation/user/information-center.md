---
layout: wiki
title: Information center
description: Downloaded ACE3 and have no idea where to start? This page serves as a document to help new players get started with things or get an answer to some of your questions.
group: user
order: 0
parent: wiki
---

Downloaded ACE3 and have no idea where to start? This page serves as a starting point to help new players and mission makers understand what's available to them.


- You don't know where to begin your ACE3 journey? [**Check out ACE3 features**](http://ace3mod.com/wiki/feature/)


- You are a mission maker but you don't know what ACE3 has to offer? [**We have some documentation for you**](http://ace3mod.com/wiki/missionmaker/)


- Are you searching for ACE3 classnames ? [**Here they are**](http://ace3mod.com/wiki/missionmaker/classnames.html)


## 1. FAQ
### 1.1 Features
**Q:** Where is X feature? </br>
**A:** When it's done.</br>

**Q:** Feature X was in ACE2/AGM/CSE where is it?</br>
**A:** It's going to be ported at some point.</br>

**Q:** Why was my feature request closed on GitHub?</br>
**A:** Feature requests should initially be added to issue #414 for easy tracking.[HERE](https://github.com/acemod/ACE3/issues/414/)

**Q:** I want to disable feature X how do I do it?</br>
**A:** Simply delete the PBO.(note that some features depends on others, check dependencies before deleting anything).</br>

### 1.2 Issues

**Q:** Laser locking is broken, when are you going to fix it?</br>
**A:** Fun fact, it isn't, you need to come from the direction of the laser, (laser is pointing to the east, you come from the west) and you drop the GBU, it will then guide itself to the target. The reasoning behind that is that the vehicle or building laser designated would obstruct the laser and the GBU would then be unable to lock on it. </br>

**Q:** I take vanilla damage with ACE 3.1.1</br>
**A:** This has been fixed in 3.2.0</br>

**Q:** I am having dll errors.</br>
**A:** Start the game once with the Arma 3 Launcher, close it, then start the game with your usual launcher (ArmA3Sync or Play withSIx).</br>
The simple explanation is that BattlEye breaks itself and only starting it with the Arma 3 Launcher fixes it.</br>

**Q:** ACE3 fonts is outdated.</br>
**A:** This happens because you have ACE3 development environment set-up, which means file patching is enabled. Use `-noFilePatching` startup parameter (in the upcoming Arma 3 update this will not be needed as file patching will be disabled by default).

### 1.3 Compatibility

**Q:** (mod) doesn't have some ACE3 features.</br>
**A:** ACE3 isn't and can't be responsible for compatibility with every (mod), due it's size other (mod) authors are strongly encouraged to provide that from their side. Compatibility PBOs currently in ACE3 are there to kick-start and provide examples for (mod) authors.</br>

**Q:** ACE3 causes issues in (mod).</br>
**A:** If you've found an issue with ACE3 please make sure that ACE3 is really the cause of the problem. To do this try to reproduce the issue with using only `@CBA_A3` and `@ace` on a newly created mission. ACE3 isn't and can't be responsible for all mod conflicts, due it's size other mod authors are strongly encouraged to provide that from their side.</br>
