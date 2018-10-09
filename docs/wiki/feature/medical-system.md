---
layout: wiki
title: Medical System
description: ACE3 provides users with a more realistic medical system and comes in both a basic and advanced version. Both versions have overlap but each have their own unique characteristics.
group: feature
order: 4
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---
**Disclaimer:** With the documentation for the medical system being extremely long it's highly advised to use the table of contents at the top right corner of the page.

## 1. Overview
ACE3 provides users with a more realistic medical system and comes in both a basic and an advanced version. This page will detail the differences between both systems and what they do as well as how to use them efficiently.

### 1.1 Basic medical
ACE3's basic medical system is quite a bit more complex than Arma 3's default system, but not really difficult to grasp. ACE3 basic medical is a mixture between the ACE2 and AGM medical systems.
All interactions in the medical system are done with the interaction menu. Non-medics can - by default - not perform all actions (Epinephrine and IVs) and their actions take more time as when performed by trained medics.

### 1.2 Revive system
The revive system lets you bring downed units back up.
Upon receiving a deadly amount of damage a unit will fall unconscious for a determined amount of time. In that time a medic will need to treat them and give them epinephrine to bring them back up.

### 1.3 Advanced medical

The advanced medical system provides a more complex and detailed medical simulation and is based off the CSE CMS. It focuses on a more realistic model for injuries and treatments, thus resulting in a more important and prominent role for combat medics, and a bigger incentive to avoid getting shot.

The system behind advanced medical is designed to attempt to mimic important parts of the human body, as well as react to any injuries sustained and treatments applied in a realistic manner. The available treatments and supplies in advanced medical are based off the Tactical Combat Casualty Care (TCCC) guidelines, which are the same guidelines used by real-life combat medics around the world.

Besides the 4 elements introduced by basic medical, advanced introduces the following:

- More detailed wound system.
- Accurate blood loss based upon sustained injuries.
- Vitals, including heart rate and blood pressure.
- Cardiac Arrest.
- Various treatment methods such as CPR, different kinds of IVs and a working tourniquet.
- A basic medication simulation.

### 1.4 Tweaked hitpoints
Base soldiers hitpoints values tweaked.

## 2. Usage

### 2.1 Basic

When hit, units start to lose blood depending on the severity of their wounds. Once the level of blood falls below a certain threshold, the unit will fall unconscious and eventually die. Units will also fall unconscious when sustaining large amounts of damage at once or from high amounts of pain.

#### 2.1.1 Wounds, bandages and medications


##### 2.1.1.1 Wounds

It's pretty straightforward compared to advanced, you only have two types of wounds.

- Yellow: Small - medium sized wound, a single bandage is usually enough.
- Red: Large wound, 2 or more bandages are usually needed.

##### 2.1.1.2 Bandages

- All of them have the same effect.

##### 2.1.1.3 Tourniquet

- Serves no use in basic

##### 2.1.1.4 IVs

IV | Effect
---------- | ---------- |
Saline | Serves no use in basic
Plasma | Serves no use in basic
Blood | Restores the blood of the patient

Use the appropriate amount depending on the situation (low / heavy loss of blood) (250, 500 or 1 000 mL)


##### 2.1.1.5 Autoinjectors

Autoinjector | Effect
---------- | ---------- |
Morphine | Removes pain
Epinephrine | Wakes up the patient
Atropine | Serves no use in basic
Adenosine | Serves no use in basic

#### 2.1.2 Treating the patient

**Step 1:** Is the patient responsive?

 - **Yes:** Ask him if he has wounds / he is in pain.
 - **No:** Go to step 2.


**Step 2:** Is the patient wounded?

 - **Yes:** Treat the wounds and go to step 3.
 - **No:** Skip this step.


**Step 3:** Is the patient in pain?

 - **Yes:** Give him morphine.
 - **No:** Skip this step.


**Step 4:** Did the patient lose a lot of blood?

 - **Yes:** Give blood via IV.
 - **No:** Go to step 5.
 - **No and patient responsive:** You're done.


**Step 5**

 - If at this point the patient is still not back on its feet it's time to use an epinephrine Autoinjector.

#### 2.1.3 Additional informations

- If the revive system is in place your character will not die until the revive timer is at 0. Even if a tank shoots your ass off an epinephrine shot will bring you back up after your wounds are treated. (The timer is invisible and may vary from mission to mission, it also depends on the amount of lives remaining you have.)
- You can't do an overdose in basic.

#### 2.1.4 Revive (Basic Medical)
For the following procedure to work revive need to be enabled.

- A unit in the revive state will be unconscious and will stay unconscious until it is either woken up or the revive timer runs out.
- A unit in the revive state can't die from any source of damage, only the timer reaching 0 can kill it.
- Each successful CPR will increase the time the unit can stay in the revive state.
- To wake up a patient treat all of his wounds, make sure he isn't in pain and then use epinephrine.
- Each successful revive removes a life from the unit, once the lives run out the next time the unit will take fatal damage it will not enter the revive state and will die.

### 2.2 Advanced

Same as with basic, when hit an injury is sustained. Different though is that the type of injury and the severity of it are based upon how the damage was done and what caused it. This affects both blood loss and immediate consequences, such as being knocked out or being killed right away. When a player has sustained an injury, this will be indicated by flashing red on the screen; this means the player is bleeding.

#### 2.2.1 Wounds, bandages and medications


##### 2.2.1.1 Abrasions (or scrapes)

- They occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
- Sources: falling, rope burn, vehicle crashes.
- Effects: pain - extremely light, bleeding - extremely slowly.

##### 2.2.1.2 Avulsions

- Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
- Sources: explosions, vehicle crashes, grenades, artillery shells, bullets, backblast, bites.
- Effects: pain - extremely high, bleeding - extremely fast (depends on wound size).

##### 2.2.1.3 Contusions

- Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
- Sources: bullets, backblast, punches, vehicle crashes, falling.
- Effects: pain - light, no bleeding.

##### 2.2.1.4 Crush wounds

- Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
- Sources: falling, vehicle crashes, punches.
- Effects: pain - light, bleeding - extremely slowly.

##### 2.2.1.5 Cut wounds

- Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
- Sources: vehicle crashes, grenades, explosions, artillery shells, backblast, stabs.
- Effects: pain - light, bleeding - speed depends on length and size of the wound.


##### 2.2.1.6 Lacerations (tears)

- these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source or from an external source like a punch.
- Sources: vehicle crashes, punches.
- Effects: pain - light, bleeding - slow to medium speed (depends on wound size).

##### 2.2.1.7 Velocity wound

- They are caused by an object entering the body at a high speed, typically a bullet or small pieces of shrapnel.
- Sources: bullets, grenades, explosions, artillery shells.
- Effects: pain - extremely high, bleeding - medium speed (depends on wound size).


##### 2.2.1.8 Puncture wounds

- Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
- Sources: stabs, grenades.
- Effects: pain - light, bleeding - slowly.

In order to stop the bleeding, all bleeding injuries on every body part requires treatment. This is done by either applying a tourniquet to legs or arms as a temporary solution, or by using bandages to stop the bleeding as a more permanent fix.


##### 2.2.1.9 Bandages effectiveness

(Click the image for a better view)

<ul class="clearing-thumbs small-block-grid-1" data-clearing>
    <li><a href="{{ site.baseurl }}/img/wiki/feature/medical1.jpg"><img class="th" data-caption="Bandages table" src="{{ site.baseurl }}/img/wiki/feature/medical1.jpg"></a></li>

</ul>

Table legend:

 - **Efficiency**: Bandage efficiency, _higher is better_.
 - **Reopening chance**: Reopening chance when advanced wounds are enabled, _lower is better_.

##### 2.2.1.10 Tourniquet

- Can only be applied on limbs.
- Stops bleeding from wounds.
- Should be taken off as fast as possible and applied only to give medic time to bandage all the wounds.
- If not taken off for a while it will cause pain to the patient.

##### 2.2.1.11 IVs

IV | Effect
---------- | ---------- |
Saline plasma and blood | All three restore the volume of liquid in the blood stream. as a result blood pressure is raised for all of them.

Use the appropriate amount depending on the situation (heavy loss of blood, blood pressure too low) (250, 500 or 1 000 mL)

##### 2.2.1.12 Autoinjectors

Autoinjector | Effect
---------- | ---------- |
Morphine | Decreases the blood viscosity, suppress pain
Epinephrine | Raises the heart rate of the patient
Adenosine | Lowers the heart rate
Atropine | Lowers the heart rate of the patient

Note: Morphine stays much longer in the system compared to other medications.

##### 2.2.1.13 Surgical kit

- Is only useful when advanced wounds (reopening) is enabled.
- Stitch a wound to stop it from reopening.
- It's use may be limited to a certain class and / or near a vehicle / facility.
- It's use can also be limited according to the condition of the patient, you might need to stabilize him first before using it.

##### 2.2.1.14 PAK

- Used to fully heal someone. (Removes any injury, restore vitals to a stable state and reset the medical history, clears all medication in the system.)
- It's use may be limited to a certain class and / or near a vehicle / facility.
- It's use can also be limited according to the condition of the patient, you might need to stabilize him first before using it.

#### 2.2.2 Vitals

##### 2.2.2.1 Blood pressure

 NOTE:the `systolic` blood pressure is the number on the left, the `diastolic` blood pressure is the number on the right.

- Blood pressure is affected by the amount of blood lost as well as IVs and medication.
 - **Non existent:** 0 - 20 `systolic`.
 - **Low:** 20 - 100 `systolic`.
 - **Normal:** 100 - 160 `systolic`.
 - **High:** 160 and above `systolic`.

##### 2.2.2.2 Heart rate

The heart rate (pulse) is affected by the amount of blood lost and medications.

- **Low:** 45 and below
- **Normal:** between 46 and 119
- **High:** 120 and above


##### 2.2.2.3 Cardiac arrest

A patient will enter cardiac arrest when:

- The heart rate is below 20.
- The heart rate is above 200.
- The systolic blood pressure is above 260.
- The diastolic blood pressure is below 40 and the heart rate is above 190.
- The systolic blood pressure is above 145 and the heart rate is above 150.


#### 2.2.3 Treating the patient
This is a step by step guide, follow the steps from 1 to 6 in order unless stated otherwise.

- Keeping the patient's vitals stable is your first priority.
- If advanced wounds are enabled make sure from time to time that they didn't reopen.
- If a limb has a wound with a high bleeding rate (or multiple) such as a large avulsion or large cut; use a tourniquet immediately on it, otherwise the patient might loose large amounts of blood while you try to treat it.


**Step 1:** Is the patient responsive?

 - **Yes:** Ask him if he has wounds / he is in pain and act accordingly.
 - **No:** Go to step 2.


 **Step 2:** Is the patient wounded?

  - **Yes**: Treat the wounds.
  - **No:** Skip this step.


**Step 3:** Does the patient have a pulse?

 - **Yes:** Go to step 4.
 - **No:** If you are alone provide CPR, if you have someone else get him to do CPR while you treat the patient's wounds. Skip to step 4 or 5 depending on the situation.


**Step 4:** Did the patient lose a lot of blood?

 - **Yes:** Use IVs to restore the volume of liquid in the blood stream of the patient.
 - **No:** Skip this step.


**Step 5:** Is the patient in pain?

 - **Yes and stable pulse:** Give him morphine.
 - **Yes and unstable heart rate:** Stabilize the heart rate before administrating morphine.
 - **No:** You're done.


**Step 6:** is the patient awake now?

 - **Yes:** You're done.
 - **No:** Stabilize his pulse / make sure he isn't in pain or missing blood.


#### 2.2.4 Additional informations

- As an infantryman you can use a tourniquet to stop a limb from bleeding, note that this is supposed to be a temporary solution and leaving the tourniquet more than 5 minutes will induce pain.
- Pain is only suppressed and not removed by default.
- You don't have to take epinephrine after you take morphine, just wait until your pulse stabilizes by itself (Provided that you are in a stable condition).

#### 2.2.5 Revive (Advanced Medical)
For the following procedure to work revive needs to be enabled.

- A unit in the revive state will be unconscious and will stay unconscious until it is either woken up or the revive timer runs out.
- A unit in the revive state can't die from any source of damage, only the timer reaching 0 can kill it.
- Each successful CPR will increase the time the unit can stay in the revive state.
- To wake up a patient the use of a PAK is required.
- Each successful revive removes a life from the unit, once the lives run out the next time the unit will take fatal damage it will not enter the revive state and will die.
- Each successful round of CPR (filled up completion bar) increases the time left in the revive state.

## 3. Guides

### 3.1 Example loadouts

#### 3.1.1 Basic

Soldier:

 - 10 × Bandage (Basic)
 - 3 × Morphine Autoinjector
 - 1 × Epinephrine Autoinjector

Medic:

 - 15-25 × Bandage (Basic)
 - 10 × Morphine Autoinjector
 - 10 × Epinephrine Autoinjector
 - 6 × Blood IV (500ml)

#### 3.1.2 Advanced

Soldier :

 - 3-6 × Bandage (Basic)
 - 3-6 × Bandage (Elastic)
 - 3-6 × Packing Bandage
 - 3-6 × Basic Field Dressing (QuikClot)
 - 1 × Morphine Autoinjector
 - 1 × Epinephrine Autoinjector
 - 1 × Tourniquet (CAT)
 - **Optional**: 1 × Saline IV (500ml) - used only by a qualified medic


Combat First Responder (CFR):

 - 10-15 × Bandage (Basic)
 - 10-15 × Bandage (Elastic)
 - 10-15 × Packing Bandage
 - 10-15 × Basic Field Dressing (QuikClot)
 - 8 × Atropine Autoinjector
 - 5 × Morphine Autoinjector
 - 5 × Epinephrine Autoinjector
 - 3 × Tourniquet (CAT)
 - 4 × Saline IV (500ml)


Medic:

 - 10-15 × Bandage (Basic)
 - 15-20 × Bandage (Elastic)
 - 15-20 × Packing Bandage
 - 10-15 × Basic Field Dressing (QuikClot)
 - 12 × Atropine Autoinjector
 - 8 × Morphine Autoinjector
 - 8 × Epinephrine Autoinjector
 - 5 × Tourniquet (CAT)
 - 6 × Saline IV (500ml)
 - 1-3 × *Surgical Kit*
 - 1-3 × *Personal Aid Kit*


Paramedic:

 - 10-15 × Bandage (Basic)
 - 15-20 × Bandage (Elastic)
 - 15-20 × Packing Bandage
 - 10-15 × Basic Field Dressing (QuikClot)
 - 5 × Tourniquet (CAT)
 - 2 × Saline IV (500ml)

## 4. Dependencies

{% include dependencies_list.md component="medical" %}
