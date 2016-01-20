/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to detonate the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Max range (-1 to ignore) <NUMBER>
 * 2: Explosive <ARRAY>
 *     0: Explosive <OBJECT>
 *     1: Fuse time <NUMBER>
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

params ["_unit", "_range", "_item"];
TRACE_3("params",_unit,_range,_item);

private ["_result", "_ignoreRange", "_pos"];

_ignoreRange = (_range == -1);
_result = true;

if (!_ignoreRange && {(_unit distance (_item select 0)) > _range}) exitWith {TRACE_1("out of range",_range); false};

if (getNumber (ConfigFile >> "CfgAmmo" >> typeOf (_item select 0) >> "TriggerWhenDestroyed") == 0) then {
    private ["_exp", "_previousExp"];
    _previousExp = _item select 0;
    _exp = getText (ConfigFile >> "CfgAmmo" >> typeOf (_previousExp) >> "ACE_Explosive");
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
    params ["_explosive"];
    TRACE_1("exploding",_explosive);
    if (!isNull _explosive) then {
        _explosive setDamage 1;
    };
}, [_item select 0], (_item select 1)] call EFUNC(common,waitAndExecute);

_result
