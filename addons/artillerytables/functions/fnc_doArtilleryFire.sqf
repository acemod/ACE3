#include "script_component.hpp"
/*
 * Author: LinkIsGrim, mharris001
 * Wrapper for engine doArtilleryFire, fires barrage one round at a time.
 * Handles CSW magazines.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Target <OBJECT, STRING or POSITION AGL>
 * 2: Spread in meters
 * 3: Magazine Type <STRING>
 * 4: Rounds to fire <NUMBER>
 *
 * Return Value:
 * Barrage Started <BOOL>
 *
 * Example:
 * [cursorObject] call ace_artillerytables_fnc_doArtilleryFire
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_position", [0, 0, 0], [[], objNull, ""], 3], ["_spread", 0, [0]], ["_magazine", "", [""]], ["_rounds", 0, [0]]];

if (isNull _vehicle || {_rounds isEqualTo 0} || {_magazine isEqualTo ""} || {!(_vehicle turretLocal [0])}) exitWith {false};

if (_position isEqualType objNull) then {
    _position = ASLtoAGL getPosASL _position;
};

if (_position isEqualType "") then {
    _position = [_position, true] call CBA_fnc_mapGridToPos;
};

private _usingCSW = false;
if ((typeOf _vehicle) in GVAR(initializedStaticTypes)) then {
    if (["ace_csw"] call EFUNC(common,isModLoaded)) then {
        _usingCSW = EGVAR(csw,ammoHandling) > 0;
    };
    if (["ace_mk6mortar"] call EFUNC(common,isModLoaded) && {_vehicle isKindOf "StaticMortar"}) then {
        _usingCSW = EGVAR(mk6mortar,useAmmoHandling);
    };
    _usingCSW = _usingCSW && {_vehicle getVariable [QEGVAR(csw,assemblyMode), 3] isNotEqualTo 0}
};

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
        // reload to forced mag
        // TODO: use public functions for this
        [_vehicle, gunner _vehicle, "", true] call EFUNC(csw,ai_reload);
    };
};

// Needs to be config case
_vehicleMagazine = configName (configFile >> "CfgMagazines" >> _vehicleMagazine);
if (_vehicleMagazine isEqualTo "") exitWith {false};

if ((_vehicle getArtilleryETA [_position, _vehicleMagazine]) isEqualTo -1) exitWith {false};

_vehicle doWatch _position;

[{
    params ["_vehicle", "_position", "_spread", "_magazine", "_roundsLeft", "_lastFired"];
    if (CBA_missionTime - _lastFired > 30) exitWith {true};

    if (unitReady _vehicle) then {
        _vehicle doArtilleryFire [[_position, _spread] call CBA_fnc_randPos, _magazine, 1];
        _this set [4, _roundsLeft - 1];
        _this set [5, CBA_missionTime];
    };

    if (_rounds <= 0 || {!alive _vehicle} || {!alive (gunner _vehicle)}) exitWith {
        [{_this doWatch objNull}, _vehicle, 5] call CBA_fnc_waitAndExecute;
        _vehicle setVariable [QEGVAR(csw,forcedMag), nil, true];
        true
    };
    false
}, {}, [_vehicle, _position, _spread, _vehicleMagazine, _rounds, CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;

true
