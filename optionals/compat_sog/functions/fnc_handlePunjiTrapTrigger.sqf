#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Handler for 'detonation' of a local punji trap. Workaround for local-only ammo hit event.
 *
 * Arguments:
 * 0: Punji trap <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [trap] call ace_compat_sog_fnc_handlePunjiTrapTrigger
 *
 * Public: No
 */
params ["_trap"];
if (isNull (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

private _radius = getNumber (configOf _trap >> "indirectHitRange");
private _affectedUnits = (_trap nearEntities ["CAManBase", _radius]) select {isDamageAllowed _x};

if (_affectedUnits isEqualTo []) exitWith {};

[QGVAR(handlePunjiTrapDamage), _affectedUnits] call CBA_fnc_targetEvent;
