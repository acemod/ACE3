#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment is completed
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_args"];
_args params ["_caller", "_target", "_bodyPart", "_className", "_items", "_usersOfItems"];

// switch to end anim immediately
private _endInAnim = _caller getVariable QGVAR(endInAnim);

if (!isNil "_endInAnim") then {
    if (animationState _caller != _endInAnim) then {
        [_caller, _endInAnim, 2] call EFUNC(common,doAnimation);
    };
    _caller setVariable [QGVAR(endInAnim), nil];
    TRACE_1("abort",_endInAnim);
};

// reset sped up animations
[QEGVAR(common,setAnimSpeedCoef), [_caller, 1]] call CBA_fnc_globalEvent;

// Record specific callback
private _config = configFile >> QGVAR(Actions) >> _className;

private _callback = getText (_config >> "callbackSuccess");

if (isNil _callback) then {
    _callback = compile _callback;
} else {
    _callback = missionNamespace getVariable _callback;
};

if !(_callback isEqualType {}) then {
    _callback = {TRACE_1("callback was NOT code",_callback)};
};

//Get current blood loose on limb (for "bloody" litter)
private _bloodLossOnBodyPart = 0;
private _partIndex = (ALL_BODY_PARTS find toLower _bodyPart) max 0;

// Add all bleeding from wounds on selection
private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];

{
    _x params ["", "", "_bodyPartN", "_amountOf", "_percentageOpen"];

    if (_bodyPartN isEqualTo _partIndex) then {
        _bloodLossOnBodyPart = _bloodLossOnBodyPart + (_amountOf * _percentageOpen);
    };
} forEach _openWounds;
TRACE_1("advanced",_bloodLossOnBodyPart);

_args call _callback;
_args pushBack _bloodLossOnBodyPart;
_args call FUNC(litterCreate);

["ace_treatmentSucceded", [_caller, _target, _bodyPart, _className]] call CBA_fnc_localEvent;
