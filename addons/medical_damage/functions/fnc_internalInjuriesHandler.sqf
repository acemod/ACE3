/*
 * Author: Glowbal
 * Handling of the internal injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Body Part <STRING>
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

params ["_unit", "_bodyPart", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage"];

// private  _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
// TODO implement internal injuries
