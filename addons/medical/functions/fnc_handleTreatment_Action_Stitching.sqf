/**
 * fn_performStitching.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define WAITING_TIME_SMALL 2.5
#define WAITING_TIME_MEDIUM 3.5
#define WAITING_TIME_LARGE 4.5

#define WAITING_TIMES_WOUNDS [WAITING_TIME_SMALL, WAITING_TIME_MEDIUM, WAITING_TIME_LARGE]

private ["_injuredPerson", "_treatingPerson", "_selectionName", "_removeItem", "_prevAnim", "_bandagedWounds", "_bodyPartN", "_allWounds", "_totalWoundsCount", "_totalTime", "_startTimeOfStitching", "_indexStitch", "_woundstoStitchOf", "_afterStitchingWoundsCount", "_waitingTime", "_i", "_startTime", "_messageSend"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_prevAnim = _this select 4;

[_caller,"STR_ACE_STITCHING","STR_ACE_START_STITCHING_INJURIES", 0, [[_injuredPerson] call EFUNC(common,getName),_selectionName]] call EFUNC(common,sendDisplayMessageTo);

_bandagedWounds = [_injuredPerson,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
_bodyPartN = [_selectionName] call FUNC(getBodyPartNumber);

_allWounds = _bandagedWounds select _bodyPartN;
_totalTime = ((_allWounds select 0) * WAITING_TIME_MEDIUM) + ((_allWounds select 1) * WAITING_TIME_MEDIUM) + ((_allWounds select 2) * WAITING_TIME_MEDIUM);


// Get the current position for the treatment person
_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];

_caller setvariable [QGVAR(lastStichPerformed), diag_tickTime];
[{
    private ["_caller","_target", "_selectionName", "_prevAnim", "_removeItem","_args"];
    _args = _this select 0;
    _caller = _args select 0;
    _target = _args select 1;
    _selectionName = _args select 2;
    _removeItem = _args select 3;
    _prevAnim = _args select 4;

    if ((vehicle _caller != _caller) || ((getPos _caller) distance (_caller getvariable GVAR(ORIGINAL_POSITION_PLAYER))) >= 1) then {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };
        [QGVAR(treatmentIconID), false, QUOTE(PATHTOF(data\icons\icon_advanced_treatment.paa)), [1,1,1,1]] call EFUNC(common,displayIcon);
        ["Medical_handleTreatment_Stitching", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;

        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };

    if (diag_tickTime - (_caller getvariable [QGVAR(lastStichPerformed), diag_tickTime - WAITING_TIME_MEDIUM]) >= WAITING_TIME_MEDIUM) then {
        _caller setvariable [QGVAR(lastStichPerformed), diag_tickTime];

        _bandagedWounds = [_target,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
        _allWounds = _bandagedWounds select _bodyPartN;
        {
            if (_x > 0) exitwith {
                _value = _x - 1;
                if (_value < 0) then {
                    _value = 0;
                };

                _allWounds set[_foreachIndex, _value];
            };
        }foreach _allWounds;

        _bandagedWounds set [_bodyPartN, _allWounds];
        [_target, QGVAR(bandagedWounds), _bandagedWounds] call EFUNC(common,setDefinedVariable);

        if (((_allWounds select 0) * 2.5) + ((_allWounds select 1) * 3.5) + ((_allWounds select 2) * 4.5) <= 0) then {
            [_target,"treatment",format["%1 has stitched up some bandages wounds",[_caller] call EFUNC(common,getName)]] call FUNC(addActivityToLog);

            if (_prevAnim != "") then {
                [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
            };
            [QGVAR(treatmentIconID), false, QUOTE(PATHTOF(data\icons\icon_advanced_treatment.paa)), [1,1,1,1]] call EFUNC(common,displayIcon);
            ["Medical_handleTreatment_Stitching", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
            ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;

            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
    };
}, 0.1, [_caller, _target, _selectionName, _removeItem, _prevAnim] ] call CBA_fnc_addPerFrameHandler;


// Necessary for showing the loading bar along side
[_totalTime, // the time to wait
    {_caller = _this select 0; ((vehicle _caller != _caller) ||((getPos _caller) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, // the condition, called every frame
    {}, // on success
    {},    // on failure
    [_caller] // arguments
] call EFUNC(common,loadingBar);

true;