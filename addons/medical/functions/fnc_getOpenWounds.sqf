#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns a copy of unit's open wounds on a body part.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Wounds <ARRAY of ARRAY>:
 *    0: Wound Class ID <NUMBER>
 *    1: Wound Open Amount <NUMBER>
 *    2: Wound Bleeding Coef <NUMBER>
 *    3: Wound Damage <NUMBER>
 *
 * Example:
 * [player, "head"] call ace_medical_fnc_getOpenWounds
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_bodyPart", "", [""]]];

if (isNull _unit) exitWith {
    ERROR("getOpenWounds - null unit");

    []
};

if !(_unit isKindOf "CAManBase") exitWith {
    ERROR_2("getOpenWounds - unit %1 is not child of CAManBase - type %2",_unit,typeOf _unit);

    []
};

_bodyPart = toLowerANSI _bodyPart;

if !(_bodyPart in ALL_BODY_PARTS) exitWith {
    ERROR_2("getOpenWounds - invalid body part %1, expected one of %2",_bodyPart,ALL_BODY_PARTS);

    []
};

private _openWounds = [];

{
    _x params ["", "_xAmount"];
    if (_xAmount > 0) then { // bandaged wounds are open wounds with count 0, skip those
        _openWounds pushBack +_x; // manual deep copy so modification doesn't affect unit state
    };
} forEach (GET_OPEN_WOUNDS(_unit) getOrDefault [_bodyPart, []]);

_openWounds
