#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handling of the internal injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter or source of the damage <OBJECT>
 * 4: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "leg", 2, kevin, "shot"] call ACE_medical_fnc_handleDamage_internalInjuries
 *
 * Public: No
 */

params ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage"];
private _bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

// TODO implement internal injuries
