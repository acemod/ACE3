#include "script_component.hpp"
/*
 * Author: TCVM, PabstMirror
 * Handles adding ammo to a turret
 * Called from a global event but only runs where turret is local
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Unit doing action <OBJECT>
 * 3: Vehicle Magazine <STRING>
 * 4: Ammo in magazine <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], player, "200Rnd_127x99_mag_Tracer_Red", 70] call ace_csw_fnc_reload_handleAddTurretMag
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_unit", "_carryMag" ,"_ammoRecieved"];
TRACE_5("reload_handleAddTurretMag",_vehicle,_turret,_unit,_carryMag,_ammoRecieved);

TRACE_2("",local _vehicle, _vehicle turretLocal _turret);
if (!(_vehicle turretLocal _turret)) exitWith {};

([_vehicle, _turret, _carryMag] call FUNC(reload_canLoadMagazine)) params ["_canAdd", "_loadedMag", "_neededAmmo", "_isBeltLinking"];
TRACE_4("canLoad",_canAdd,_loadedMag,_neededAmmo,_isBeltLinking);

private _ammoRemaining = _ammoRecieved;
if (_canAdd) then {
    private _ammoUsed = _neededAmmo min _ammoRecieved;
    _ammoRemaining = _ammoRemaining - _ammoUsed;

    if (_isBeltLinking) then {
        private _currentAmmo = _vehicle magazineTurretAmmo [_loadedMag, _turret];
        _currentAmmo = _currentAmmo + _ammoUsed;
        TRACE_2("Setting mag ammo",_loadedMag,_currentAmmo);
        // _vehicle setMagazineTurretAmmo [_loadedMag, _currentAmmo, _turret];

        // setMagazineTurretAmmo is broken on split locality, use setAmmo for now (this may not work for multi turret vehicles)
        private _weapon = (_vehicle weaponsTurret _turret) param [0, ""];
        TRACE_3("setAmmo",_vehicle,_weapon, _currentAmmo);
        _vehicle setAmmo [_weapon, _currentAmmo];
        private _currentAmmo = _vehicle magazineTurretAmmo [_loadedMag, _turret];
        if ((_weapon == "") || {_currentAmmo != _currentAmmo}) then { ERROR_1("failed to setAmmo - %1", _this); };

    } else {
        if (_loadedMag != "") then {
            TRACE_1("Removing emtpy mag",_loadedMag);
            _vehicle removeMagazinesTurret [_loadedMag, _turret];
        };
        [_vehicle, _turret, true, false] call FUNC(proxyWeapon); // Check if we need to add proxy weapon now
        private _newMag = [_vehicle, _turret, _carryMag] call FUNC(reload_getVehicleMagazine);
        TRACE_2("Adding new mag",_newMag,_ammoUsed);
        _vehicle addMagazineTurret [_newMag, _turret, _ammoUsed];
    };
};

if (_ammoRemaining > 0) then {
    TRACE_3("Returning ammo",_unit,_carryMag,_ammoRemaining);
    [QGVAR(returnAmmo), [_unit, _carryMag, _ammoRemaining], _unit] call CBA_fnc_targetEvent;
};

