/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to detonate the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Max range (-1 to ignore) <NUMBER>
 * 2: Explosive <ARRAY>
 *     0: Explosive <OBJECT>
 *     1: Fuse ACE_time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 100, [Explosive, 1]] call ACE_Explosives_fnc_detonateExplosive; // has to be within range
 * [player, -1, [Explosive, 1]] call ACE_Explosives_fnc_detonateExplosive; // range ignored.
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_result", "_ignoreRange", "_helpers", "_pos"];
EXPLODE_3_PVT(_this,_unit,_range,_item);
_ignoreRange = (_range == -1);
_result = true;

if (!_ignoreRange && {(_unit distance (_item select 0)) > _range}) exitWith {false};

_helpers = attachedObjects (_item select 0);
{
    detach _x;
    deleteVehicle _x;  
} forEach _helpers;

if (getNumber (ConfigFile >> "CfgAmmo" >> typeof (_item select 0) >> "TriggerWhenDestroyed") == 0) then {
    private ["_exp", "_previousExp"];
    _previousExp = _item select 0;
    _exp = getText (ConfigFile >> "CfgAmmo" >> typeof (_previousExp) >> "ACE_Explosive");
    if (_exp != "") then {
        _exp = createVehicle [_exp, [0,0,15001], [], 0, "NONE"];
        _exp setDir (getDir _previousExp);
        _item set [0, _exp];
        _pos = getPosASL _previousExp;
        deleteVehicle _previousExp;
        _exp setPosASL _pos;
    };
};
[{
    private ["_explosive"];
    _explosive = _this;
    if (!isNull _explosive) then {
        _explosive setDamage 1;
    };
}, _item select 0, _item select 1, 0] call EFUNC(common,waitAndExecute);

_result
