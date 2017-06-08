/*
 * Author: Garth 'L-H' de Wet, commy2
 * Handles explosions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Example:
 * [bob] call ace_goggles_fnc_handleExplosion
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (_unit != ACE_player) exitWith {true};

call FUNC(applyDirtEffect);

if (GETBROKEN) exitWith {true};

private ["_config", "_effects"];

_config = configFile >> "CfgGlasses" >> goggles _unit;

if ((_this select 1) call FUNC(GetExplosionIndex) < getNumber (_config >> "ACE_Resistance")) exitWith {true};

if !([_unit] call FUNC(isGogglesVisible)) exitWith {
    ["ace_glassesCracked", [_unit]] call CBA_fnc_localEvent;
    true
};

_effects = GETGLASSES(_unit);
_effects set [BROKEN, true];

SETGLASSES(_unit,_effects);

if (getText (_config >> "ACE_OverlayCracked") != "") then {
    if (call FUNC(ExternalCamera)) exitWith {};

    if (isNull (GLASSDISPLAY)) then {
        GVAR(GogglesLayer) cutRsc ["RscACE_Goggles", "PLAIN", 1, false];
    };

    (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText (_config >> "ACE_OverlayCracked");
};

["ace_glassesCracked", [_unit]] call CBA_fnc_localEvent;
true
