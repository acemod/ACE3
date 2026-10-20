#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Adds cracked glass effect to glasses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Succeeded <BOOL>
 *
 * Example:
 * _applied = [] call ace_goggles_fnc_applyCrackEffect
 *
 * Public: Yes
 */

if (GETBROKEN) exitWith { true };

private _unit = ACE_player;
private _config = configFile >> "CfgGlasses" >> goggles _unit;

if !(_unit call FUNC(isGogglesVisible)) exitWith {
    ["ace_glassesCracked", [_unit]] call CBA_fnc_localEvent;
    true
};

scopeName "main";

private _effects = GETGLASSES(_unit);
_effects set [BROKEN, true];

SETGLASSES(_unit,_effects);

if (getText (_config >> "ACE_OverlayCracked") != "") then {
    if ([] call FUNC(externalCamera)) exitWith {
        false breakOut "main";
    };
    if (isNull (GLASSDISPLAY)) then {
        GVAR(GogglesLayer) cutRsc ["RscACE_Goggles", "PLAIN", 1, false, false];
    };

    (GLASSDISPLAY displayCtrl IDC_GOGGLES_OVERLAY) ctrlSetText getText (_config >> "ACE_OverlayCracked");
};

["ace_glassesCracked", [_unit]] call CBA_fnc_localEvent;
true
