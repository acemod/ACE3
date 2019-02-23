---
layout: wiki
title: Field Rations Framework
description: Explains how to set-up ACEX Field Rations.
group: framework
parent: wiki
mod: acex
version:
  major: 3
  minor: 4
  patch: 0
---

## 1. Config Values

### 1.1 Consumable Items

Config Name | Type | Description
----------- | ---- | -----------
`acex_field_rations_thirstQuenched` | Number | Amount of thirst quenched when item is consumed*
`acex_field_rations_hungerSatiated` | Number | Amount of hunger satiated when item is consumed*
`acex_field_rations_consumeTime` | Number | Time required to consume the item (in seconds)
`acex_field_rations_consumeText` | String | Progress bar text (OPTIONAL)
`acex_field_rations_consumeAnims` | Array | Animations to play when consuming item** (OPTIONAL)
`acex_field_rations_consumeSounds` | Array | Sounds to play when consuming item** (OPTIONAL)
`acex_field_rations_replacementItem` | String | Class name of replacement item to add on consumption (OPTIONAL)
`acex_field_rations_refillItem` | String | Makes an item refillable, class name of item added when refilled (OPTIONAL)
`acex_field_rations_refillAmount` | Number | Amount of water required to refill item (OPTIONAL)
`acex_field_rations_refillTime` | Number | Time required to refill item (in seconds) (OPTIONAL)


_* Value range is 0 to 100 and can be modified by the corresponding coefficient setting._

_** Array is in format: STAND, CROUCH, PRONE. If player is in vehicle, the first element is used._

### 1.2 Water Sources

Config Name | Type | Description
----------- | ---- | -----------
`acex_field_rations_waterSupply` | Number | Amount of water inside the object (-1 - disabled, -10 - infinite) (OPTIONAL)
`acex_field_rations_offset` | Array | Refill action offset relative to model (OPTIONAL)

## 2. Events

Event Name | Passed Parameter(s) | Locality | Description
---------- | ------------------- | -------- | -----------
`acex_rationConsumed` | [_player, _consumeItem, _replacementItem, _thirstQuenched, _hungerSatiated] | Local | Item consumed
`acex_rationRefilled` | [_source, _player, _item, _refillItem, _refillAmount] | Local | Item refilled

## 3. Scripting

### 3.1 Getting water supply

`acex_field_rations_fnc_getRemainingWater`

```cpp
* Returns the remaining water in a source.
*
* Arguments:
* 0: Water source <OBJECT>
*
* Return Value:
* Remaining water <NUMBER>
*
* Example:
* [_source] call acex_field_rations_fnc_getRemainingWater
```

### 3.2 Setting water supply

`acex_field_rations_fnc_setRemainingWater`

```cpp
* Sets the remaining water supply for given water source.
*
* Arguments:
* 0: Water source <OBJECT>
* 1: Amount (-10 - Infinite, -1 - Disabled) <NUMBER>
*
* Return Value:
* None
*
* Example:
* [_source, 1000] call acex_field_rations_fnc_setRemainingWater
```

### 3.3 Adding a status modifier

`acex_field_rations_fnc_addStatusModifier`

```cpp
* Adds a status modifier. Should be called on all machines.
* Code must return a NUMBER which will be applied additively with other status changes.
*
* Arguments:
* 0: Status to modify (0 - Thirst, 1 - Hunger, 2 - Both) <NUMBER>
* 1: Code (is passed the unit <OBJECT>) <CODE>
*
* Return Value:
* None
*
* Example:
* [0, {random 1}] call acex_field_rations_fnc_addStatusModifier
```
