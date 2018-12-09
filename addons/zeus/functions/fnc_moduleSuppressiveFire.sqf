#include "script_component.hpp"
/*
 * Author: bux, PabstMirror
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleSuppressiveFire
 *
 * Public: No
 */
// #define DRAW_ZEUS_INFO

if (canSuspend) exitWith {[FUNC(moduleSuppressiveFire), _this] call CBA_fnc_directCall;};

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
TRACE_3("moduleSuppressiveFire placed",_unit,typeOf _unit,typeOf _logic);

deleteVehicle _logic; // cleanup logic now, we just needed it to get the attached unit

if (isNull _unit) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _unit) exitWith {
    [LSTRING(OnlyAlive)] call FUNC(showMessage);
};
if ([_unit] call EFUNC(common,isPlayer)) exitWith {
    ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage);
};

[_unit, {
    params ["_successful", "_unit", "_mousePosASL"];
    TRACE_3("getModuleDestination return",_successful,_unit,_mousePosASL);
    if !(_successful && {alive _unit}) exitWith {};
    private _vehicle = vehicle _unit;

    private _targetASL = _mousePosASL vectorAdd [0,0,0.6]; // mouse pos is at ground level zero, raise up a bit;
    private _artilleryMag = "";

    if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "artilleryScanner")) == 1) then {
        // Artillery - Get mortar ammo type and verify in range
        if (isNull gunner _vehicle) exitWith {_targetASL = [];};
        {
            private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
            private _hit = getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit");
            if (_hit > 20) exitWith {_artilleryMag = _x;};
        } forEach getArtilleryAmmo [_vehicle];
        TRACE_1("getArtilleryAmmo",_artilleryMag);
        if (_artilleryMag == "") exitWith {_targetASL = [];};
        private _eta = _vehicle getArtilleryETA [ASLtoAGL _targetASL, _artilleryMag];
        TRACE_1("getArtilleryETA",_eta);
        if (_eta < 0) exitWith {
            [ELSTRING(Interaction,NotInRange)] call FUNC(showMessage);
            _targetASL = [];
        };
        ["TOF: %1 sec", _eta toFixed 1] call FUNC(showMessage);
    } else {
        // Direct fire - Get a target position that will work
        private _lis = lineIntersectsSurfaces [eyePos _unit, _targetASL, _unit, _vehicle];
        if ((count _lis) > 0) then { // If point is hidden, unit won't fire, do a ray cast to find where they should shoot at
            _targetASL = ((_lis select 0) select 0);
            TRACE_1("using ray cast pos",_mousePosASL distance _targetASL);
        };
        if (_unit isEqualTo _vehicle) then { // Max range a unit can fire seems to be based on the weapon's config
            private _distance =  _targetASL vectorDistance eyePos _unit;
            private _maxWeaponRange = getNumber (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "maxRange");
            TRACE_3("",_distance,_maxWeaponRange,currentWeapon _unit);
            if (_distance > (_maxWeaponRange - 50)) then {
                if (_distance > (2.5 * _maxWeaponRange)) then {
                    _targetASL = [];
                    [ELSTRING(Interaction,NotInRange)] call FUNC(showMessage);
                } else {
                    // 1-2.5x the weapon max range, find a virtual point the AI can shoot at (won't have accurate elevation, but it will put rounds downrange)
                    private _fakeElevation = (_distance / 100000) * (_distance - _maxWeaponRange);
                    _targetASL = (eyePos _unit) vectorAdd (((eyePos _unit) vectorFromTo _targetASL) vectorMultiply (_maxWeaponRange - 50)) vectorAdd [0,0,_fakeElevation];
                    TRACE_2("using virtual halfway point",_mousePosASL distance _targetASL,_fakeElevation);
                };
            };
        };
    };

    if (_targetASL isEqualTo []) exitWith {};

    private _units = [_unit];
    if (_unit == (leader _unit)) then {_units = units _unit;};
    if (_artilleryMag != "") then {_units = [gunner _vehicle];};

    {
        if (((_unit distance _x) < 30) && {!([_x] call EFUNC(common,isPlayer))} && {[_x] call EFUNC(common,isAwake)}) then {
            TRACE_2("sending event",_x,_targetASL);
            [QGVAR(suppressiveFire), [_x, _targetASL, _artilleryMag], _x] call CBA_fnc_targetEvent;
        };
    } forEach _units;

#ifdef DRAW_ZEUS_INFO
    [eyePos _unit, _mousePosASL, [0,0,1,1]] call EFUNC(common,addLineToDebugDraw);
    [eyePos _unit, _targetASL, [1,0,0,1]] call EFUNC(common,addLineToDebugDraw);
    if (_unit != _vehicle) then {
        [_vehicle] call CBA_fnc_addUnitTrackProjectiles;
    } else {
        {
            [_x] call CBA_fnc_addUnitTrackProjectiles;
        } forEach _units;
    };
#endif

}, localize LSTRING(ModuleSuppressiveFire_DisplayName), "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1, 0, 0, 1], 45] call FUNC(getModuleDestination);
