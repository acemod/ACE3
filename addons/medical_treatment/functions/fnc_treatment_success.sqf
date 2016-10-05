/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment is completed
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

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
private _config = configFile >> QGVAR(Actions) >> CUR_LEVEL >> _className;

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
private _bloodLossOnSelection = 0;
private _partNumber = (ALL_BODY_PARTS find toLower _bodyPart) max 0;

// Add all bleeding from wounds on selection
private _openWounds = _target getvariable [QEGVAR(medical,openWounds), []];
{
    _x params ["", "", "_selectionX", "_amountOf", "_percentageOpen"];
    if (_selectionX == _partNumber) then {
        _bloodLossOnSelection = _bloodLossOnSelection + (_amountOf * _percentageOpen);
    };
} forEach _openWounds;
TRACE_1("advanced",_bloodLossOnSelection);

_args call _callback;
_args pushBack _bloodLossOnSelection;
_args call FUNC(litterCreate);

//If we're not already tracking vitals, start:
if (!(_target getVariable [QGVAR(addedToUnitLoop),false])) then {
    [_target] call FUNC(addVitalLoop);
};

["ace_treatmentSucceded", [_caller, _target, _bodyPart, _className]] call CBA_fnc_localEvent;
