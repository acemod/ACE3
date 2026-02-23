#include "..\script_component.hpp"
/*
 * Author: Jonpas, LinkIsGrim
 * Returns base optic for CBA scripted optics (PIP and 2D)
 *
 * Arguments:
 * 0: Optic <STRING>
 *
 * Return Value:
 * Base optic <STRING>
 *
 * Example:
 * "CUP_optic_Elcan_SpecterDR_black_PIP" call ace_arsenal_fnc_baseOptic
 *
 * Public: Yes
 */

params [["_optic", "", [""]]];

// PIP
private _baseClasses = configProperties [configFile >> "CBA_PIPItems", "getText _x == _optic"];

if (_baseClasses isNotEqualTo []) exitWith {
    configName (_baseClasses select 0) // return
};

// Carry Handle
{
    _baseClasses append (configProperties [_x, "getText _x == _optic"]);
} forEach ("true" configClasses (configFile >> "CBA_CarryHandleTypes")); // CBA_CarryHandleTypes doesn't inherit, so use faster command

if (_baseClasses isNotEqualTo []) exitWith {
    configName (_baseClasses select 0) // return
};

_optic // return
