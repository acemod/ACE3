/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment is completed
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_args", "_caller", "_target","_selectionName","_className","_config","_callback", "_weaponSelect", "_lastAnim"];
_args = _this select 0;
_caller = _args select 0;
_target = _args select 1;
_selectionName = _args select 2;
_className = _args select 3;

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
};
if (vehicle _caller == _caller) then {
    _lastAnim = _caller getvariable [QGVAR(treatmentPrevAnimCaller), ""];
    //Don't play another medic animation (when player is rapidily treating)
    TRACE_2("Reseting to old animation", animationState player, _lastAnim);
    switch (true) do {
        case (_lastAnim == "AinvPknlMstpSlayWrflDnon_medic"): {_lastAnim = "AmovPknlMstpSrasWrflDnon"};
        case (_lastAnim == "AinvPpneMstpSlayWrflDnon_medic"): {_lastAnim = "AmovPpneMstpSrasWrflDnon"};
        case (_lastAnim == "AinvPknlMstpSlayWnonDnon_medic"): {_lastAnim = "AmovPknlMstpSnonWnonDnon"};
        case (_lastAnim == "AinvPpneMstpSlayWpstDnon_medic"): {_lastAnim = "AinvPpneMstpSlayWpstDnon"};
        case (_lastAnim == "AinvPknlMstpSlayWpstDnon_medic"): {_lastAnim = "AmovPknlMstpSrasWpstDnon"};
    };
    [_caller, _lastAnim, 1] call EFUNC(common,doAnimation);
};
_caller setvariable [QGVAR(treatmentPrevAnimCaller), nil];

_weaponSelect = (_caller getvariable [QGVAR(selectedWeaponOnTreatment), []]);
if ((_weaponSelect params [["_previousWeapon", ""]]) && {(_previousWeapon != "") && {_previousWeapon in (weapons _caller)}}) then {
    for "_index" from 0 to 99 do {
        _caller action ["SwitchWeapon", _caller, _caller, _index];
        //Just check weapon, muzzle and mode (ignore ammo in case they were reloading)
        if (((weaponState _caller) select [0,3]) isEqualTo (_weaponSelect select [0,3])) exitWith {TRACE_1("Restoring", (weaponState _caller));};
        if ((weaponState _caller) isEqualTo ["","","","",0]) exitWith {ERROR("weaponState not found");};
    };
} else {
    _caller action ["SwitchWeapon", _caller, _caller, 99];
};

// Record specific callback
_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};

_callback = getText (_config >> "callbackSuccess");
if (isNil _callback) then {
    _callback = compile _callback;
} else {
    _callback = missionNamespace getvariable _callback;
};

_args call _callback;

_args call FUNC(createLitter);

//If we're not already tracking vitals, start:
if (!(_target getvariable [QGVAR(addedToUnitLoop),false])) then {
    [_target] call FUNC(addToInjuredCollection);
};
