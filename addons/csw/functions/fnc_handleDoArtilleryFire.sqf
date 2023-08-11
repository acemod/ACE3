#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * CSW compatibility for ace_artillerytables_fnc_doArtilleryFire
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * CSW Handled <ARRAY>
 *  CSW Handled <BOOL>
 *  Vehicle Magazine <STRING>
 *
 * Public: No
 */
params ["_vehicle", "_magazine"];

if !((typeOf _vehicle) in GVAR(initializedStaticTypes)) exitWith {[true, _magazine]};

// Solve this before exiting, a carry mag can still be passed to a disabled CSW
private _carryMag = _magazine;
private _isCarryMag = isClass (configFile >> QGVAR(groups) >> _carryMag);

if (_isCarryMag) then {
    _magazine = [_vehicle, [0], _carryMag] call FUNC(reload_getVehicleMagazine);
} else {
    _carryMag = [_magazine] call FUNC(getCarryMagazine);
};

// Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select (_vehicle getVariable [QGVAR(assemblyMode), 3]);

// Not using CSW systems
if (!_assemblyMode) exitWith {[true, _magazine]};

// Ammo Handling disabled for AI
if (GVAR(ammoHandling) < 2) exitWith {[false, _magazine]};

private _canSwitch = [_vehicle, _carryMag, [0], true, false] call FUNC(ai_switchMagazine);

[_canSwitch, _magazine] // return
