#include "script_component.hpp"
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
 * 3: Trigger Item Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 100, [Explosive, 1], "ACE_Clacker"] call ACE_Explosives_fnc_detonateExplosive; // has to be within range
 * [player, -1, [Explosive, 1], "ACE_Cellphone"] call ACE_Explosives_fnc_detonateExplosive; // range ignored.
 *
 * Public: Yes
 */

params ["_unit", "_range", "_item", ["_triggerClassname", "#unknown", [""]]];
TRACE_4("detonateExplosive",_unit,_range,_item,_triggerClassname);

private _ignoreRange = (_range == -1);
if (!_ignoreRange && {(_unit distance (_item select 0)) > _range}) exitWith {TRACE_1("out of range",_range); false};

private _result = true;
{
    // Pass [Unit<OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]
    private _handlerResult = [_unit, _range, _item select 0, _item select 1, _triggerClassname] call _x;
    if (_handlerResult isEqualTo false) then {TRACE_1("Handler Failed",_forEachIndex); _result = false};
} forEach GVAR(detonationHandlers);
if (!_result) exitWith {false};

if (getNumber (ConfigFile >> "CfgAmmo" >> typeOf (_item select 0) >> "TriggerWhenDestroyed") == 0) then {
    private _previousExp = _item select 0;
    private _exp = getText (ConfigFile >> "CfgAmmo" >> typeOf (_previousExp) >> QGVAR(Explosive));
    if (_exp != "") then {
        _exp = createVehicle [_exp, [0,0,15001], [], 0, "NONE"];
        _exp setDir (getDir _previousExp);
        _item set [0, _exp];
        private _pos = getPosASL _previousExp;
        deleteVehicle _previousExp;
        _exp setPosASL _pos;
    };
};

if (isNull (_item select 0)) then {
    WARNING_1("Explosive is null [%1]",_this);
};
if ((getNumber (configFile >> "CfgAmmo" >> (typeOf (_item select 0)) >> "triggerWhenDestroyed")) != 1) then {
    WARNING_1("Explosive is not triggerWhenDestroyed [%1]",typeOf (_item select 0));
};

[QGVAR(detonate), [_unit, _item select 0, _item select 1]] call CBA_fnc_serverEvent;

_result
