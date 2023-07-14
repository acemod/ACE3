#include "script_component.hpp"
/*
 * Author: LinkIsGrim, mharris001
 * Wrapper for engine doArtilleryFire, fires barrage one round at a time.
 * Handles CSW magazines.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Target <OBJECT, STRING or POSITION AGL>
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
params [["_vehicle", objNull, [objNull]], ["_position", [0, 0, 0], [[], objNull, ""], 3], ["_magazine", "", [""]], ["_rounds", 0, [0]]];

if (isNull _vehicle || {_rounds isEqualTo 0} || {_magazine isEqualTo ""} || {!(_vehicle turretLocal [0])}) exitWith {false};

if (_position isEqualType objNull) then {
    _position = ASLtoAGL getPosASL _position;
};

if (_position isEqualType "") then {
    _position = [_position, true] call CBA_fnc_mapGridToPos;
};

// Magazine must be configCase
_magazine = configName (configFile >> "CfgMagazines" >> _magazine);
if (_magazine isEqualTo "") exitWith {false};

if (["ace_csw"] call EFUNC(common,isModLoaded)) then {
    [_vehicle, _magazine] call EFUNC(csw,handleDoArtilleryFire) params ["_cswHandled", "_newMagazine"];
    if !(_cswHandled) exitWith {false};
    _magazine = _newMagazine;
} else {
};

if !(_position inRangeOfArtillery [[_vehicle], _magazine]) exitWith {false};

_vehicle doWatch _position;

[{
    params ["_vehicle", "_position", "_magazine", "_roundsLeft", "_lastFired"];
    if (CBA_missionTime - _lastFired > 30) exitWith {true};

    (weaponState [_vehicle, [0]]) params ["", "", "", "_loadedMag", "_ammoCount", "_roundReloadPhase", "_magazineReloadPhase"];
    if (
        _loadedMag isEqualTo _magazine &&
        {_ammoCount > 0} &&
        {_roundReloadPhase isEqualTo 0} &&
        {_magazineReloadPhase isEqualTo 0} &&
        {unitReady _vehicle}
    ) then {
        _vehicle doArtilleryFire [_position, _magazine, 1];
        _roundsLeft = _roundsLeft - 1;
        _this set [3, _roundsLeft];
        _this set [4, CBA_missionTime];
    };

    if (_roundsLeft <= 0 || {!alive _vehicle} || {!alive (gunner _vehicle)} || {objectParent (gunner _vehicle) isNotEqualTo _vehicle}) exitWith {
        [QGVAR(doArtilleryFireComplete), [_vehicle, _magazine, _roundsLeft]] call CBA_fnc_globalEvent;
        [{_this doWatch objNull}, _vehicle, 5] call CBA_fnc_waitAndExecute;
        true
    };
    false
}, {}, [_vehicle, _position, _magazine, _rounds, CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;

true
