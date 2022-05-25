#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Get the extended loadout of a unit, including identity options if enabled
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * CBA Extended Loadout <ARRAY>
 *
 * Example:
 * [_unit] call ace_arsenal_fnc_getLoadout
 *
 * Public: Yes
*/

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

([_unit] call CBA_fnc_getLoadout) params ["_loadout", "_extendedInfo"];

if (GVAR(loadoutsSaveFace)) then {
    _extendedInfo set [QGVAR(face), face _unit];
};
if (GVAR(loadoutsSaveVoice)) then {
    _extendedInfo set [QGVAR(voice), speaker _unit];
};
if (GVAR(loadoutsSaveInsignia)) then {
    private _insignia = _unit getVariable ["BIS_fnc_setUnitInsignia_class", ""];
    if (_insignia != "") then {
        _extendedInfo set [QGVAR(insignia), _insignia];
    };
};

[_loadout, _extendedInfo]
