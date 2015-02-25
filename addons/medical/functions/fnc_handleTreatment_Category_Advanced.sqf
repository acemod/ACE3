/**
 * fnc_handleTreatment_Category_Advanced.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

// Time in seconds
#define ADVANCED_TREATMENT_TIME    5

private ["_caller","_target","_selectedData", "_selectionName", "_prevAnim", "_displayingIcon"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

// TODO add fake weapon for treatment, in case no primairy weapon is present
// Handle the animations
_prevAnim = "";
if (vehicle _caller == _caller && (vehicle _target == _target) && !(stance _caller == "PRONE")) then {
    if (primaryWeapon _caller == "") then {
         _prevAnim = animationState _caller;
     };
    [_caller,"AinvPknlMstpSlayWrflDnon_medic", 1] call EFUNC(common,doAnimation);
};

if (ACE_player == _caller) then {
    // Displaying the treatment icon action
    [QGVAR(treatmentIconID), true, QUOTE(PATHTOF(data\icons\icon_advanced_treatment.paa)), [1,1,1,1]] call EFUNC(common,displayIcon);
};

_isHandled = switch (_removeItem) do {
    case "ACE_personal_aid_kit": {
        ([_caller, _target, _selectionName, _removeItem, _prevAnim] call FUNC(handleTreatment_Action_FullHeal));
    };
    case "ACE_surgical_kit": {
        ([_caller, _target, _selectionName, _removeItem, _prevAnim] call FUNC(handleTreatment_Action_Stitching));
    };
    case "ACE_CPR": {
        ([_caller, _target, _selectionName, _removeItem, _prevAnim] call FUNC(handleTreatment_Action_CPR));
    };
    default {
        // handle it ourself

        // Get the current position for the treatment person
        _caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];

        [ADVANCED_TREATMENT_TIME, // the time to wait
            {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition, called every frame
            {
                private ["_caller","_target", "_selectionName", "_prevAnim", "_removeItem"];
                _caller = _this select 0;
                _target = _this select 1;
                _selectionName = _this select 2;
                _removeItem = _this select 3;
                _prevAnim = _this select 4;

                [_caller, _target, _removeItem] call FUNC(useEquipment);
                [[_caller, _target, _selectionName, _removeItem], QUOTE(FUNC(handleTreatment_Action_AdvancedLocal)), _target] call EFUNC(common,execRemoteFnc);

                if (_prevAnim != "") then {
                    [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
                };

                ["Medical_handleTreatment_Advanced", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
                ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
            }, // on success
            {
                private ["_caller","_target", "_selectionName", "_prevAnim", "_removeItem"];
                _caller = _this select 0;
                _target = _this select 1;
                _selectionName = _this select 2;
                _removeItem = _this select 3;
                _prevAnim = _this select 4;
                [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);

                if (_prevAnim != "") then {
                    [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
                };

                ["Medical_handleTreatment_Advanced", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
                ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
            },    // on failure
            [_caller, _target, _selectionName, _removeItem, _prevAnim] // arguments
        ] call EFUNC(common,loadingBar);
        true;
    };
};
_isHandled;
