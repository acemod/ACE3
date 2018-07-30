#include "script_component.hpp"
/*
 * Author: Glowbal
 * IV Treatment local callback
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment class name <STRING>
 * 2: Body part <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

params ["_target", "_treatmentClassname", "_bodyPart"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { false };

private _bloodVolume = GET_BLOOD_VOLUME(_target);

if (_bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {};

// Find the proper attributes for the used IV
private _config = configFile >> QUOTE(ADDON) >> "IV";
private _volumeAdded = getNumber (_config >> "volume");
private _type = getText (_config >> "type");

if (isClass (_config >> _treatmentClassname)) then {
    _config = _config >> _treatmentClassname;

    if (isNumber (_config >> "volume")) then {
        _volumeAdded = getNumber (_config >> "volume");
    };

    if (isText (_config >> "type")) then {
        _type = getText (_config >> "type");
    };
} else {
    ERROR("IV Treatment Classname not found");
};

private _bloodBags = _target getVariable [QEGVAR(medical,ivBags), []];
_bloodBags pushBack [_volumeAdded, _type, _partIndex];

_target setVariable [QEGVAR(medical,ivBags), _bloodBags, true];
