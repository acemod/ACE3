/**
 * fn_heal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_caller", "_selectionName", "_removeItem", "_prevAnim"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_prevAnim = _this select 4;

if !((GVAR(setting_aidKitRestrictions) == 0 && ([_caller] call FUNC(inMedicalFacility))) || (GVAR(setting_aidKitRestrictions) == 1 && ([_caller] call FUNC(inMedicalFacility)) && (!([_unit] call FUNC(hasOpenWounds)))) || (GVAR(setting_aidKitRestrictions) == 2) || (GVAR(setting_aidKitRestrictions) == 3 && (!([_unit] call FUNC(hasOpenWounds))))) exitwith {false};


// Get the current position for the treatment person
_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];

[7, // the time to wait
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition, called every frame
    {
        private ["_caller","_target", "_selectionName", "_prevAnim", "_removeItem"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;
        _removeItem = _this select 3;
        _prevAnim = _this select 4;

        if (GVAR(setting_removeAidKitOnUse)) then {
            [_caller, _target, _removeItem] call FUNC(useEquipment);
        };
        [[_caller, _target], QUOTE(FUNC(handleTreatment_Action_HealLocal)), _target] call EFUNC(common,execRemoteFnc);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };

        [QGVAR(treatmentIconID), false, "", [1,1,1,1]] call EFUNC(gui,displayIcon);
        ["Medical_handleTreatment_FullHeal", [_caller, _target, _selectionName, _removeItem, true]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    }, // on success
    {
        private ["_caller","_target", "_selectionName", "_prevAnim", "_removeItem"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;
        _removeItem = _this select 3;
        _prevAnim = _this select 4;

        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(gui,sendDisplayInformationTo);

        if (_prevAnim != "") then {
            [_caller,_prevAnim, 0] call EFUNC(common,doAnimation);
        };

        [QGVAR(treatmentIconID), false, "", [1,1,1,1]] call EFUNC(gui,displayIcon);
        ["Medical_handleTreatment_FullHeal", [_caller, _target, _selectionName, _removeItem, false]] call ace_common_fnc_localEvent;
        ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _removeItem]] call ace_common_fnc_localEvent;
    },    // on failure
    [_caller, _target, _selectionName, _removeItem, _prevAnim] // arguments
] call EFUNC(gui,loadingBar);


if (!(_unit getvariable [QEGVAR(common,isDead),false]) && alive _unit) then {
    [[_unit,_caller], QUOTE(FUNC(healLocal)), _unit] call EFUNC(common,execRemoteFnc);
};
true;