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
 * Public: No
 */

#include "script_component.hpp"

private "_bodyPartn";
params ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage"];
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

// TODO implement internal injuries
