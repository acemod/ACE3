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
 *    2: IV body part <STRING>
 *    3: IV treatment classname <STRING>
 *    4: IV flow rate coef <NUMBER>
 *    5: IV item classname <STRING>
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
    _x params ["_bagVolume", "_bagType", "_bodyPartIndex", "_treatment", "_rateCoef", "_bagItem"]; // gotta convert body part index back to the part

    _ivBags pushBack [
        _bagVolume,
        _bagType,
        ALL_BODY_PARTS select _bodyPartIndex,
        _treatment,
        _rateCoef,
        _bagItem
    ];
} forEach (_unit getVariable [QGVAR(ivBags), []]);

_ivBags
