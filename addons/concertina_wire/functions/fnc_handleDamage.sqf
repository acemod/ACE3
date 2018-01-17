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
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_wire", "", "_damage", "_source", ""];
if (_damage < 0.5) exitWith { 0 };

if (!(isNull _source)) then {
    _wire setVariable [QGVAR(lastDamager), _source];
};

_damage
