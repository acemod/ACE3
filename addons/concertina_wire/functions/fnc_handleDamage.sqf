/*
 * Author: Ruthberg
 *
 * Handles wire damage
 *
 * Arguments:
 * 0: wire <OBJECT>
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

PARAMS_5(_wire,_selectionName,_damage,_source,_projectile);

if (_damage < 0.5) exitWith { 0 };

if (!(isNull _source)) then {
    _wire setVariable [QGVAR(lastDamager), _source];
};

_damage
