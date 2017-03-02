/*
 * Author: bux, PabstMirror
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#define DRAW_ZEUS_INFO
#include "script_component.hpp"

if (canSuspend) exitWith {[FUNC(moduleSuppressiveFire), _this] call CBA_fnc_directCall;};

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
TRACE_3("moduleSuppressiveFire placed",_unit,typeOf _unit,_logic);

private _displayName = getText (configFile >> "CfgVehicles" >> (typeOf _logic) >> "displayName");
deleteVehicle _logic; // cleanup logic now, we just needed it for the attached unit

if (isNull _unit) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _unit) exitWith {
    [localize LSTRING(OnlyAlive)] call FUNC(showMessage);
};
if ([_unit] call EFUNC(common,isPlayer)) exitWith {
    ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage);
};

[_unit, {
    params ["_successful", "_unit", "_mousePosASL"];
    TRACE_3("getModuleDestination return",_successful,_unit,_mousePosASL);
    if (!_successful) exitWith {};
    if (!alive _unit) exitWith {};
    private _vehicle = vehicle _unit;

    private _targetASL = _mousePosASL vectorAdd [0,0,0.6]; // mouse pos is at ground level zero, raise up a bit;
    private _lis = lineIntersectsSurfaces [eyePos _unit, _targetASL, _unit, _vehicle];
    if ((count _lis) > 0) then { // If point is hidden, unit won't fire, do a ray cast to find where they should shoot at
        _targetASL = ((_lis select 0) select 0);
        TRACE_1("using ray cast pos",_mousePosASL distance _targetASL);
    };

    if (_unit isEqualTo _vehicle) then { // Max range a unit can fire seems to be based on the weapon's config
        private _distance =  _targetASL vectorDistance eyePos _unit;
        private _maxWeaponRange = getNumber (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "maxRange");
        TRACE_3("",_distance,_maxWeaponRange,currentWeapon _unit);
        if (_distance > _maxWeaponRange) then {
            if (_distance > (2 * _maxWeaponRange)) then {
                _targetASL = [];
                [ELSTRING(Interaction,NotInRange)] call FUNC(showMessage);
            } else {
                // 1-2x the weapon max range, find a virtual point the AI can shoot at (won't have accurate elevation, but it will put rounds downrange)
                _targetASL = (eyePos _unit) vectorAdd (((eyePos _unit) vectorFromTo _targetASL) vectorMultiply (_maxWeaponRange - 10)) vectorAdd [0,0,5];
                TRACE_1("using virtual halfway point",_mousePosASL distance _targetASL);
            };
        };
    };
    if (_targetASL isEqualTo []) exitWith {};

    TRACE_2("sending event",_unit,_targetASL);
    [QGVAR(suppressiveFire), [_unit, _targetASL], _unit] call CBA_fnc_targetEvent;

#ifdef DRAW_ZEUS_INFO
    [eyePos _unit, _mousePosASL, [0,0,1,1]] call EFUNC(common,addLineToDebugDraw);
    [eyePos _unit, _targetASL, [1,0,0,1]] call EFUNC(common,addLineToDebugDraw);
    [_vehicle] call CBA_fnc_addUnitTrackProjectiles;
#endif

}, _displayName] call FUNC(getModuleDestination);
