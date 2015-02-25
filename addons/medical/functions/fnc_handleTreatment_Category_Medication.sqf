/**
 * fnc_handleTreatment_Category_Medication.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

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
    [QGVAR(treatmentIconID), true, QUOTE(PATHTOF(data\icons\medication_small.paa)), [1,1,1,1]] call EFUNC(common,displayIcon);
};

// Get the current position for the treatment person
_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];

[4, // the time to wait
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition
    {
        private ["_caller","_target", "_selectionName", "_prevAnim"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;
        _removeItem = _this select 3;
        [_caller, _target, _removeItem] call FUNC(useEquipment);

        [[_caller, _target, _selectionName, _removeItem], QUOTE(FUNC(handleTreatment_Action_MedicationLocal)), _target] call EFUNC(common,execRemoteFnc);
        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };

        ["Medical_handleTreatment_Medication", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    }, // on success
    {
        private ["_caller","_target", "_selectionName", "_prevAnim"];
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };

        ["Medical_handleTreatment_Medication", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    },    // on failure
    [_caller, _target, _selectionName, _removeItem, _prevAnim] // arguments
] call EFUNC(common,loadingBar);

true;
