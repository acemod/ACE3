#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns a copy of unit's IVs.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * IVs <ARRAY of ARRAY>:
 *    0: IV volume remaining, in liters <STRING>
 *    1: IV type (blood, saline, plasma, etc) <STRING>
 *    2: Body part IV is attached to <STRING>
 *    3: IV classname <STRING>
 *    4: IV flow rate coef <NUMBER>
 *
 * Example:
 * player call ace_medical_fnc_getIVs
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!alive _unit) exitWith {
    ERROR_1("getIVs - null or dead unit %1",_unit);

    []
};

if !(_unit isKindOf "CAManBase") exitWith {
    ERROR_2("getIVs - unit %1 is not child of CAManBase - type %2",_unit,typeOf _unit);

    []
};

private _ivBags = [];

{
    _ivBags pushBack +_x; // manual deep copy so modification doesn't affect unit state
} forEach (_unit getVariable [QGVAR(ivBags), []]);

_ivBags
