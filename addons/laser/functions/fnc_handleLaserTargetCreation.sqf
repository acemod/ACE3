#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Associates a newly created laser target to it's owner
 *
 * Argument:
 * 0: Vanilla Laser (base type LaserTarget) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [laserTarget player] call ace_laser_fnc_handleLaserTargetCreation;
 *
 * Public: No
 */

TRACE_1("params",_this);
[{
    params ["_targetObject"];

    // Only handle locally created lasers
    if(!(local _targetObject)) exitWith {TRACE_1("not local",_targetObject);};

    private _owners = allUnits select {(lasertarget _x) == _targetObject};
    if (count _owners == 1) exitWith {
        TRACE_2("Laser target owner [allUnits]", _targetObject, _owners select 0);
        [_targetObject, _owners select 0] call FUNC(addLaserTarget);
    };

    _owners = vehicles select {(lasertarget _x) == _targetObject};
    if (count _owners == 1) exitWith {
        TRACE_2("Laser target owner [vehicles]", _targetObject, _owners select 0);
        [_targetObject, _owners select 0] call FUNC(addLaserTarget);
    };

    // Vehicle based laser designators won't be linked via laserTarget if the turret has "primaryGunner = 0"
    // This backup method just checks the player's vic - which should be reasonably safe as we know the laserTarget is local
    private _foundSource = false;
    private _vehicle = vehicle ACE_player;
    TRACE_2("",_vehicle,typeOf _vehicle);
    if ((alive ACE_player) && {_vehicle != ACE_player}) then {
        private _turretPath = if (ACE_player == (driver _vehicle)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
        TRACE_1("",_turretPath);
        if (!(_turretPath isEqualTo [])) then {
            private _currentWeapon = _vehicle currentWeaponTurret _turretPath;
            TRACE_1("",_currentWeapon);
            if ((getNumber (configFile >> "CfgWeapons" >> _currentWeapon >> "laser")) == 1) then {
                #ifdef DEBUG_MODE_FULL
                private _turretConfig = [_vehicle, _turretPath] call CBA_fnc_getTurret;
                private _primaryGunner = getNumber (_turretConfig >> "primaryGunner");
                TRACE_1("",_primaryGunner);
                #endif
                TRACE_2("Laser target owner [backup method]",_targetObject,_vehicle);
                [_targetObject, _vehicle] call FUNC(addLaserTarget);
                _foundSource = true;
            };
        };
    };
    if (!_foundSource) then {
        WARNING_1("Laser target doesn't have owner", _targetObject);
    };

}, _this] call CBA_fnc_execNextFrame;
