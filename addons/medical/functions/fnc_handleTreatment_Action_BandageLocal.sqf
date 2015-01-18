/**
 * fn_bandageLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_Target","_selectionName","_removeItem","_part","_openWounds","_woundsArray","_highest_amount","_highestSpot","_collectiveImpact", "_highestTotal","_totalNumber", "_selectedData"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

systemChat format ["Local bandage: %1",_this];

// TODO figure this out later on
//_selectedData = [_this, 4, "", [""]] call BIS_fnc_Param;

if (!local _target) exitwith{
    ["fnc_bandageLocal called on non local machine",3] call EFUNC(common,debug);
};

if (_caller != _target) then {
    [_target,"STR_ACE_BANDAGING", "STR_ACE_IS_BANDAGING_YOU", 0, [[_treatingPerson] call EFUNC(common,getName)]] call EFUNC(gui,sendDisplayMessageTo);
};

[_target,_removeItem] call FUNC(addToTriageList);

// TODO make dynamic
_collectiveImpact =    switch (_removeItem) do    {
    case "ACE_packing_bandage":    {[1.0, 1.5, 1.2]};
    case "ACE_bandageElastic":     {[1.3, 0.9, 0.9]};
    case "ACE_bandage_basic":     {[1.5, 1.0, 0.6]};
    case "ACE_stitching":         {[2.0, 2.0, 2.0]};
    case "ACE_quikclot":         {[0.9, 0.3, 0.3]};
    default                        {[0.9, 0.5, 0.5]};
};

_part =    [_selectionName] call FUNC(getBodyPartNumber);

_openWounds = [_target,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
_woundsArray = _openWounds select _part;

// Find the type of which we have the most injures and the amount of this for the selected bodypart.
_highestSpot = 0;
_highest_amount = 0;
{
    if (_x > _highest_amount) then {
        _highestSpot = _foreachIndex;
        _highest_amount = _x;
    };
}foreach _woundsArray;

// If we have bandaging aid enabled (on easy difficulty), we will find the body part with the most injuries and use that instead.
if (GVAR(setting_enableBandagingAid)) then {
    _highestTotal = 0;
    {
        // find out how many injuries this bodypart has
        _totalNumber = 0;
        {
            _totalNumber = _totalNumber + _x;
        }foreach _x;

        // Check if this body part has the highest amount of injuries
        if (_totalNumber > _highestTotal) then {
            _part = _foreachIndex;
            _highestTotal = _totalNumber;
        };
    }foreach _openWounds;

    // Find the type of which we have the most injures and the amount of this for the selected bodypart.
    _woundsArray = _openWounds select _part;
    _highestSpot = 0;
    _highest_amount = 0;
    {
        if (_x > _highest_amount) then {
            _highestSpot = _foreachIndex;
            _highest_amount = _x;
        };
    }foreach _woundsArray;
};

// Find the amount of impact the used bandage has for the injury
_impactOfBandage = (_collectiveImpact select _highestSpot);

_wounds = _highest_amount;
_amountOfInpact = 0;

// if we have wounds, log that we have bandaged those and find the real impact of the bandage
if (_wounds > 0) then {
    [_target,"treatment",format["%2 has bandaged a wound on %1",[_part] call FUNC(fromNumberToBodyPart),[_caller] call EFUNC(common,getName)]] call FUNC(addActivityToLog);

    _amountOfInpact = _impactOfBandage;
    if (_impactOfBandage > _wounds) then {
        _amountOfInpact = _wounds;
    };
};

// Decrease the impact
_wounds = (_wounds - _impactOfBandage);
if (_wounds < 0) then {
    _wounds = 0;
};
// Adjust the wounds value for the unit
_woundsArray set[_highestSpot, _wounds];
_openWounds set [_part, _woundsArray];
[_target,QGVAR(openWounds),_openWounds] call EFUNC(common,setDefinedVariable);


// Check if we have wounds opening enabled
if (isnil QGVAR(setting_advancedWoundsSetting)) then {
    GVAR(setting_advancedWoundsSetting) = true;
};
if (_amountOfInpact > 0.0 && GVAR(setting_advancedWoundsSetting)) then {

    // Find the bandaged body part
    _bandagedWounds = [_target,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
    _bandagedPart = _bandagedWounds select _part;

    // Increase the amount of bandaged wounds
    _bandagedWound = _bandagedPart select _highestSpot;
    _bandagedPart set [_highestSpot,_bandagedWound + _amountOfInpact];
    _bandagedWounds set[_part,_bandagedPart];

    // Store the new bandaged wounds
    [_target,QGVAR(bandagedWounds),_bandagedWounds] call EFUNC(common,setDefinedVariable);

    // Do not provide the possibility for small injuries to open again
    if (_highestSpot > 0) then {
        [_target, _amountOfInpact,_part,_highestSpot, _removeItem] call FUNC(handleBandageOpening);
    };
};

// If all wounds have been bandaged, we will reset all damage to 0.
if (!([_target] call FUNC(hasOpenWounds))) then {
    _target setDamage 0;
    // TODO also set hitpoints to 0
};

true