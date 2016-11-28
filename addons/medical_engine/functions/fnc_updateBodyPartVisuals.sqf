/*
 * Author: commy2
 * Damages a body part of a local unit. Does not kill the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body part, can be "Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg" or "All" <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "HEAD"] call ace_medical_engine_fnc_updateBodyPartVisuals
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_bodyPart"];

if (_bodyPart == "All") exitWith {
    [_unit, "Head"] call FUNC(updateBodyPartVisuals);
    [_unit, "Body"] call FUNC(updateBodyPartVisuals);
    [_unit, "LeftArm"] call FUNC(updateBodyPartVisuals);
    [_unit, "RightArm"] call FUNC(updateBodyPartVisuals);
    [_unit, "LeftLeg"] call FUNC(updateBodyPartVisuals);
    [_unit, "RightLeg"] call FUNC(updateBodyPartVisuals);
};

private _affectedBodyParts = [_bodyPart];

switch (toLower _bodyPart) do {
    case "leftarm";
    case "rightarm": {
        _bodyPart = "Arms";
        _affectedBodyParts = ["LeftArm", "RightArm"];
    };

    case "leftleg";
    case "rightleg": {
        _bodyPart = "Legs";
        _affectedBodyParts = ["LeftLeg", "RightLeg"];
    };
};

private _openWounds = _unit getVariable QEGVAR(medical,openWounds);
private _damageOnAffectedBodyParts = 0;

{
    private _damageOnBodyPart = 0;
    private _partIndex = ALL_BODY_PARTS find toLower _x;

    {
        _x params ["", "", "_bodyPartN", "", "_bleeding", "_pain", "_damage"];

        if (_bodyPartN isEqualTo _partIndex) then {
            _damageOnBodyPart = _damageOnBodyPart + _damage;
        };
    } forEach _openWounds;

    // report maximum of both legs or arms
    _damageOnAffectedBodyParts = _damageOnAffectedBodyParts max _damageOnBodyPart;
} forEach _affectedBodyParts;

[_unit, _bodyPart, _damageOnAffectedBodyParts > 0.35] call FUNC(damageBodyPart);
