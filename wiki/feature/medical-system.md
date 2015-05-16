---
layout: wiki
title: Medical System
description: ACE provide users with a more realistic medical system and comes in both a basic and advanced version. Both versions have overlap but each have their own unique characteristics. 
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

### 2.2 Basic medical system - recommended gear
* Soldier:
  * 10 x Bandage (basic)

* Medic:
  * 15-25 x Bandage (basic)
  * 6 x Blood IV (500ml)
  * 10 x Morphine Autoinjector
  * 10 x Epinephrine Autoinjector

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

#### 3.1.4 Types of wounds
Advanced medical system brings more different types of wounds, each with its own effects on patient. We distinguish minor, medium and large wound sizes. Below there is a list of those wounds:
* Abrasions (or scrapes)
  * Also called scrapes, they occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
  * Sources: falling, ropeburn, vehicle crashes.
  * Effects: pain - extremely light, bleeding - extremely slowly
* Avulsions
  * Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
  * Sources: explosions, vehicle crashes, grenades, artillery shells, bullets, backblast, bites.
  * Effects: pain - extremely high, bleeding - extremely fast (depends on wound size).
* Contusions
  * Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
  * Sources: bullets, backblast, punches, vehicle crashes, falling.
  * Effects: pain - light, no bleeding.
* Crush wounds
  * Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
  * Sources: falling, vehicle crashes, punches.
  * Effects: pain - light, bleeding - extremely slowly.
* Cut wounds
  * Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
  * Sources: vehicle crashes, grenades, explosions, artillery shells, backblast, stabs
  * Effects: pain - light, w zależności od głębokości i szerokości rany dosyć szybkie wykrwawianie się.
* Lacerations
  * Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
  * Sources: vehicle crashes, punches
  * Effects: pain - light, bleeding - slow to medium speed (depends on wound size).
* Velocity wounds
  * They are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
  * Sources: bullets, grenades, explosions, artillery shells.
  * Effects: pain - extremely high, bleeding - medium speed (depends on wound size).
* Puncture wounds
  * Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
  * Sources: stabs, grenades.
  * Effects: pain - light, bleeding - slowly.
  
We also distinguish different types of fractures (WIP/not implemented yet):
* Broken femur
  * Description
  * Sources: bullets, vehicle crashes, backblast, explosions, artillery shells, grenades.
  * Effects: pain - extremely high, unable to stand until healed by medic.
 
#### 3.1.5 Bandage types
Advanced medical system brings 4 different types of bandages and also properly working tourniquet. Below there is a list of all bandage types with effectiveness vs different wound types. Higher effectiveness bandages needs to be applied fewer times than ones with lower effectiveness. That depends on wound size. Applying bad type of bandage on given wound can yield wound opening after a while if not stiched fast enough.
All bandage types weights about 50 grams each.
* Bandage (basic)
  * Abrasions - highest effectiveness
  * Avulsions - lowest effectiveness
  * Contusions - highest effectiveness
  * Crush wounds - low effectiveness
  * Cut wounds - very low effectiveness
  * Lacerations - medium effectiveness
  * Velocity wounds - lowest effectiveness
  * Puncture wounds - low effectiveness
* Bandage (packing)
  * Abrasions - highest effectiveness
  * Avulsions - highest effectiveness
  * Contusions - highest effectiveness
  * Crush wounds - low effectiveness
  * Cut wounds - lowest effectiveness
  * Lacerations - lowest effectiveness
  * Velocity wounds - highest effectiveness
  * Puncture wounds - lowest effectiveness
* Bandage (elastic)
  * Abrasions - highest effectiveness
  * Avulsions - lowest effectiveness
  * Contusions - highest effectiveness
  * Crush wounds - highest effectiveness
  * Cut wounds - highest effectiveness
  * Lacerations - highest effectiveness
  * Velocity wounds - low effectiveness
  * Puncture wounds - high effectiveness
* QuikClot
  * Abrasions - medium effectiveness
  * Avulsions - high effectiveness
  * Contusions - medium effectiveness
  * Crush wounds - medium effectiveness
  * Cut wounds - medium effectiveness
  * Lacerations - medium effectiveness
  * Velocity wounds - high effectiveness
  * Puncture wounds - high effectiveness
* Tourniquet
  * Can only be applied on limbs
  * Stops bleeding from wounds
  * Should be taken off as fast as possible and applied only to give medic time to bandage all the wounds
  * If not taken off for a while it will cause pain to patient, can yield to death that way

#### 3.1.6 Transfuzions
In case of blood loss, blood could be replenished by three different types of IV: blood, plasma and saline. We distinguish 3 different sizes of IV bags: 250ml, 500ml and 1000ml.
Transfuzing 250ml of given IV takes about 1 minute to complete!

+#### 3.1.7 PAK and Surgical kit
Using Personal Aid Kit brings patient to the best possible health state. Depending on module options, PAK can be used only in specified situations, specified place and by specified person.
Surgical kit is used to stich bandaged wounds so they will never open again. Depending on module options, surgical kit can be used only in specified situations, specified place and by specified person.

### 3.2 Advanced medical system - recommended gear
 
* Soldier:
  * 4 x Bandage (basic)
  * 3 x Bandage (elastic)
  * 3 x Bandage (packing)
  * 3 x QuikClot
  * 1 x Morphine Autoinjector
  * 1 x Tourniquet
* Combat First Responder (CFR):
  * 10-15 x Bandage (basic)
  * 15-20 x Bandage (elastic)
  * 5-8 x Bandage (packing)
  * 10-15 x QuikClot
  * 3 x Tourniquet
  * 4 x Saline IV (500ml)
  * 5 x Morphine Autoinjector
  * 5 x Epinephrine Autoinjector
  * 8 x Atropine Autoinjector
* Medic:
  * 10-15 x Bandage (basic)
  * 15-20 x Bandage (elastic)
  * 8 x Bandage (packing)
  * 10-15 x QuikClot
  * 5 x Tourniquet
  * 6 x Saline IV (500ml)
  * 8 x Morphine Autoinjector
  * 8 x Epinephrine Autoinjector
  * 12 x Atropine Autoinjector
  * 1-3 x *Surgical kit*
  * 1-3 x *Personal Aid Kit*
* Paramedic:
  * 10-15 x Bandage (basic)
  * 15-20 x Bandage (elastic)
  * 8 x Bandage (packing)
  * 10-15 x QuikClot
  * 5 x Tourniquet
  * 2 x Saline IV (500ml)
  * 3 x Blood IV (1000ml) - Taken from vehicle inventory only when needed
  * 3 x Plasma IV (1000ml) - Taken from vehicle inventory only when needed
  * 8 x Morphine Autoinjector
  * 8 x Epinephrine Autoinjector
  * 12 x Atropine Autoinjector
  * 1-3 x *Surgical kit*
  * 1-3 x *Personal Aid Kit*

*medical item* - number of items that should be carried depends on module settings

## Dependencies
`ace_interaction`, `ace_modules`, `ace_apl`
