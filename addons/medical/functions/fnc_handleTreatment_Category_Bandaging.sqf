/**
 * fnc_handleTreatment_Category_Bandaging.sqf
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

// TODO find selected data/wound in menu
_selectedData = [_this, 4, "", [""]] call BIS_fnc_Param;


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
    switch (_removeItem) do {
        case "ACE_tourniquet": {

        };
        case "ACE_splint": {

        };
        default {
            [_caller, "STR_ACE_BANDAGING", "STR_ACE_APPLY_BANDAGE", 0, [[_target] call EFUNC(common,getName), _selectionName]] call EFUNC(common,sendDisplayMessageTo);
        };
    };
    // Displaying the treatment icon action
    [QGVAR(treatmentIconID), true, QUOTE(PATHTOF(data\icons\bandage_fracture_small.paa)), [1,1,1,1]] call EFUNC(common,displayIcon);
};

// Get the current position for the treatment person
_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];

if (isnil QGVAR(setting_bandageWaitingTime)) then {
    GVAR(setting_bandageWaitingTime) = 5;
};

[GVAR(setting_bandageWaitingTime), // the time to wait
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition
    {
        private ["_caller","_target","_selectedData", "_selectionName", "_prevAnim"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;
        _removeItem = _this select 3;

        switch (_removeItem) do {
            case "ACE_tourniquet": {
                [_caller, _target, _selectionName, _removeItem] call FUNC(handleTreatment_Action_tourniquet);
            };
            case "ACE_splint": {
                // TODO implement splints
            };
            default {
                [[_caller, _target, _selectionName, _removeItem], QUOTE(FUNC(handleTreatment_Action_BandageLocal)), _target] call EFUNC(common,execRemoteFnc);
                [_caller, _target, _removeItem] call FUNC(useEquipment);
            };
        };

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };
        ["Medical_handleTreatment_Bandaging", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    }, // on success
    {
        private ["_caller","_target","_selectedData", "_selectionName", "_prevAnim"];
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };
        ["Medical_handleTreatment_Bandaging", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    },    // on failure
    [_caller, _target, _selectionName, _removeItem, _prevAnim] // arguments
] call EFUNC(common,loadingBar);

true;