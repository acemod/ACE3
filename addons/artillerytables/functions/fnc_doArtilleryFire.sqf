#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Wrapper for engine doArtilleryFire, fires barrage one round at a time.
 * Handles CSW magazines.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Target Position (AGL) <ARRAY>
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
params [["_vehicle", objNull, [objNull]], ["_position", [0, 0, 0], [[]]], ["_magazine", "", [""]], ["_rounds", 0, [0]]];

if (isNull _vehicle || {_rounds isEqualTo 0} || {_magazine isEqualTo ""}) exitWith {false};

// Needs to be config case
_magazine = configName (configFile >> "CfgMagazines" >> _magazine);
if (_magazine isEqualTo "") exitWith {false};

private _usingCSW = false;
if (["ace_csw"] call EFUNC(common,isModLoaded)) then {
    _usingCSW = EGVAR(csw,ammoHandling) > 0;
};

if (["ace_mk6mortar"] call EFUNC(common,isModLoaded) && {_vehicle isKindOf "StaticMortar"}) then {
    _usingCSW = EGVAR(mk6mortar,useAmmoHandling);
};

_usingCSW = _usingCSW && {!(_vehicle getVariable [QEGVAR(csw,disabled), false])};

if (_usingCSW && {EGVAR(csw,ammoHandling) < 2}) exitWith {false};

if (_usingCSW) then {
    private _isCarryMag = isClass (configFile >> QEGVAR(csw,groups) >> _magazine);
    if (isCarryMag) then {
        _vehicle setVariable [QEGVAR(csw,forcedMag), _magazine, true];
        _magazine = [_vehicle, [0], _magazine] call EFUNC(csw,reload_getVehicleMagazine);
    };
};

if ((_vehicle getArtilleryETA [_position, _magazine]) isEqualTo -1) exitWith {false};

[LINKFUNC(doArtilleryFirePFEH), 0, [_vehicle, _position, _magazine, _rounds, _usingCSW, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

true
