/*
 * Author: Ruthberg
 *
 * Handles huntir damage
 *
 * Arguments:
 * 0: huntir <OBJECT>
 * 1: selectionName <STRING>
 * 2: damage <NUMBER>
 * 3: source <OBJECT>
 * 4: projectile <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_5(_huntir,_selectionName,_damage,_source,_projectile);

systemChat format["Selection: %1; Damage: %2", _selectionName, _damage];

_damage
