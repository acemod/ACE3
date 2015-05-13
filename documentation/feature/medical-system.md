---
layout: wiki
title: Medical System
group: feature
order: 4
parent: wiki
---

## 1. Overview
ACE provide users with a more realistic medical system and comes in both a basic and advanced version. This page will detail the differences between both systems and what they do. It is split into two parts; basic and advanced. Both versions have overlap but each have their own unique characteristics. 


## 2. Basic Medical
ACE's basic medical system is quite a bit more complex than Arma's default system, but not really difficult to grasp. ACE basic medical is a mixture between the ACE2 and AGM medical systems.

The four main elements that basic medical introduces are:

* damage divided into different zones (head, body, left & right arm, left & right leg)
* bleeding
* unconsciousness
* pain

All interactions in the medical system are done with the interaction menu. Non-medics can - by default - not perform all actions, and their actions take more time as when performed by trained medics. These actions are using epinephrine and blood IVs.


### 2.1 How it works

When hit, units start to lose blood depending on the severity of their wounds. Once the level of blood falls below a certain threshold, the unit will fall unconscious and eventually die. Units will also fall unconscious when sustaining large amounts of damage at once.

To stop the bleeding, the combat life saver needs to bandage every wounded limb. Unconscious units can be "woken up" with Epipens. Should a unit have lost a lot of blood, it might be necessary to replace the lost blood with a blood bag before being able to wake unconscious units up.

Should a unit be in pain, materializing itself with a chromatic aberration screen effect, he can be given morphine.

## 3. Advanced Medical
The advanced medical system provides a more complex and detailed medical simulation and is based off the CSE/CMS medical system. It focuses on a more realistic model for injuries and treatment, thus resulting in a more important and prominent role for combat medics, and a bigger incentive to not get shot.

The system behind advanced medical is designed to attempt to mimic important parts of the human body, as well as react to any injuries sustained and treatments applied in a realistic manner. The available treatments and supplies in advanced medical are based off the Tactical Combat Casualty Care (TCCC) guidelines, which are the same guidelines used by real-life combat medics around the world.

Besides the 4 elements introduced by basic medical, advanced introduces the following:

* More detailed wound system
* Accurate blood loss based upon sustained injuries
* Vitals, including heart rate and blood pressure
* Cardiac Arrest
* Various treatment methods such as CPR, different kinds of IVs and tourniquets
* A basic medication simulation

### 3.1 How it works

Same as with basic, when hit an injury is sustained. Different though is that the type of injury and the severity of it are based upon how the damage was done and what caused it. This affects both blood loss and immediate consequences, such as being knocked out or being killed right away. When a player has sustained an injury, this will be indicated by flashing red of the screen; this means the player is bleeding.

#### 3.1.1 Stopping bleeding
In order to stop the bleeding, all injuries on every bodypart requires treatment. This is done by either applying a tourniquet to legs or arms as a temporarly solution, or by using bandages to stop the bleeding as a more permament fix. 

#### 3.1.2 Vitals
While a unit is bleeding however, the blood volume decreases which will result in a change of vitals.  Depending on the factors such as current blood volume, the blood loss rate, medication used, the blood pressure will start to drop. To counter this drop, also based upon the previously mentioned factors and others, the heart rate will adjust accordingly to attempt to keep blood pressure at safe levels. This means that for any patient it is required to keep an eye on the vitals. This is done through the interaction system by selecting check pulse or blood pressure on either the arms or head.

#### 3.1.3 Medication
To stabalize the vitals and to counter for example pain, a player/medic can use medication. Advanced medical has 3 different medications available:
* Atropine
* Morphine
* Epinephrine

Atropine is a vagolytic and anticholinergic drug which in low dosages reduces heart rate but in high dosages increases it, countering effects of organophosphate poisoning (in NBC scenarios; anticholinesterase poisoning) and symptomatic bradycardia (in post-ROSC care and resuscitative medicine).

Morphine is used to alleviate large amounts of pain. Has an effect similar to Heroin due to its opiate properties. Must only ever be given once, and only when bleeding has been reduced to a minimum. Morphine must never be given to a casualty with a low heart rate, as it can stop the heart.

Epinephrine is used to increase heart rate and blood pressure and alleviate unconsciousness. Epinephrine is a synthetic form of Adrenaline, which is naturally produced in the body. It can also be applied to counter-act the effects of Atropine. Be careful though, as it may only be given once.

_Epinephrine must never be given to a casualty with a high heart rate or blood pressure._

# Dependencies
`ace_interaction`, `ace_modules`, `ace_apl`