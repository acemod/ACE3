#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns a copy of unit's bandaged wounds on a body part.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Wounds <ARRAY of ARRAY>:
 *    0: Wound Class ID <NUMBER>
 *    1: Wound Bandaged Amount <NUMBER>
 *    2: Wound Bleeding Coef <NUMBER>
 *    3: Wound Damage <NUMBER>
 *
 * Example:
 * [player, "head"] call ace_medical_fnc_getBandagedWounds
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_bodyPart", "", [""]]];

if (isNull _unit) exitWith {
    ERROR("getBandagedWounds - null unit");

    []
};

if !(_unit isKindOf "CAManBase") exitWith {
    ERROR_2("getBandagedWounds - unit %1 is not child of CAManBase - type %2",_unit,typeOf _unit);

    []
};

_bodyPart = toLowerANSI _bodyPart;

if !(_bodyPart in ALL_BODY_PARTS) exitWith {
    ERROR_2("getBandagedWounds - invalid body part %1, expected one of %2",_bodyPart,ALL_BODY_PARTS);

    []
};

private _bandagedWounds = [];

{
    _bandagedWounds pushBack +_x; // manual deep copy so modification doesn't affect unit state
} forEach (GET_OPEN_WOUNDS(_unit) getOrDefault [_bodyPart, []]);

_bandagedWounds
