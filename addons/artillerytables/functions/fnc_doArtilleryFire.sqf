#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Wrapper for engine doArtilleryFire, fires barrage one round at a time.
 * Handles CSW magazines.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Target <OBJECT or POSITION AGL>
 * 2: Magazine Type <STRING>
 * 3: Rounds to fire <NUMBER>
 *
 * Return Value:
 * Barrage Started <BOOL>
 *
 * Example:
 * [cursorObject] call ace_artillerytables_fnc_doArtilleryFire
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_position", [0, 0, 0], [[], objNull]], ["_magazine", "", [""]], ["_rounds", 0, [0]]];

if (isNull _vehicle || {_rounds isEqualTo 0} || {_magazine isEqualTo ""} || {!(_vehicle turretLocal [0])}) exitWith {false};

if (_position isEqualType objNull) then {
    _position = getPos _objNull;
};

private _usingCSW = false;
if (["ace_csw"] call EFUNC(common,isModLoaded)) then {
    _usingCSW = EGVAR(csw,ammoHandling) > 0;
};

if (["ace_mk6mortar"] call EFUNC(common,isModLoaded) && {_vehicle isKindOf "StaticMortar"}) then {
    _usingCSW = EGVAR(mk6mortar,useAmmoHandling);
};

_usingCSW = _usingCSW && {!(_vehicle getVariable [QEGVAR(csw,disabled), false])};

if (_usingCSW && {EGVAR(csw,ammoHandling) < 2}) exitWith {false};

private _vehicleMagazine = _magazine;
if (_usingCSW) then {
    private _isCarryMag = isClass (configFile >> QEGVAR(csw,groups) >> _magazine);
    if (_isCarryMag) then {
        _vehicle setVariable [QEGVAR(csw,forcedMag), _magazine, true];
        _vehicleMagazine = [_vehicle, [0], _magazine] call EFUNC(csw,reload_getVehicleMagazine);
    } else {
        _vehicle setVariable [QEGVAR(csw,forcedMag), [_magazine] call EFUNC(csw,getCarryMagazine), true];
    };

    if !(_vehicleMagazine in (getArtilleryAmmo [_vehicle])) then {
        // TODO: use public functions for this
        private _currentMagazine = currentMagazine _vehicle;
        private _currentCarryMagazine = [_currentMagazine] call EFUNC(csw,getCarryMagazine);
        [_vehicle, [0], _currentCarryMagazine, _currentMagazine, _vehicle] call EFUNC(csw,reload_handleRemoveTurretMag);
        [_vehicle, gunner _vehicle, "", true] call EFUNC(csw,ai_reload);
    };
};

// Needs to be config case
_vehicleMagazine = configName (configFile >> "CfgMagazines" >> _vehicleMagazine);
if (_vehicleMagazine isEqualTo "") exitWith {false};

if ((_vehicle getArtilleryETA [_position, _vehicleMagazine]) isEqualTo -1) exitWith {false};

_vehicle doWatch _position;

[LINKFUNC(doArtilleryFirePFEH), 0, [_vehicle, _position, _vehicleMagazine, _rounds, _usingCSW, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

true
