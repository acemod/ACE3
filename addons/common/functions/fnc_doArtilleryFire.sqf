#include "script_component.hpp"
/*
 * Author: LinkIsGrim, mharris001
 * Wrapper for engine doArtilleryFire, fires barrage one round at a time.
 * Handles and accepts CSW carry magazines.
 *
 * Arguments:
 * 0: Vehicle, gunner must be local <OBJECT>
 * 1: Target <OBJECT, STRING or POSITION AGL>
 * 2: Magazine Type <STRING>
 * 3: Rounds to fire <NUMBER>
 * 4: Spread around target position, in meters <NUMBER> (default: 0)
 *
 * Return Value:
 * Barrage Started <BOOL>
 *
 * Example:
 * [cursorObject, [0, 0, 0], "8Rnd_82mm_Mo_shells", 2, 25] call ace_common_fnc_doArtilleryFire
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_position", [0, 0, 0], [[], objNull, ""], 3], ["_magazine", "", [""]], ["_rounds", 0, [0]], ["_spread", 0, [0]]];

if (isNull _vehicle || {_rounds isEqualTo 0} || {_magazine isEqualTo ""} || {!(_vehicle turretLocal [0])} || {isNull (gunner _vehicle)}) exitWith {false};

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
};

if !(_position inRangeOfArtillery [[_vehicle], _magazine]) exitWith {false};

_vehicle doWatch _position;

[{
    params ["_vehicle", "_position", "_magazine", "_roundsLeft", "_spread", "_lastFired"];
    if (CBA_missionTime - _lastFired > 30) exitWith {true};

    (weaponState [_vehicle, [0]]) params ["", "", "", "_loadedMag", "_ammoCount", "_roundReloadPhase", "_magazineReloadPhase"];
    if (
        _loadedMag isEqualTo _magazine &&
        {_ammoCount > 0} &&
        {_roundReloadPhase isEqualTo 0} &&
        {_magazineReloadPhase isEqualTo 0} &&
        {unitReady _vehicle}
    ) then {
        _vehicle doArtilleryFire [[_position, _spread] call CBA_fnc_randPos, _magazine, 1];
        _roundsLeft = _roundsLeft - 1;
        _this set [3, _roundsLeft];
        _this set [5, CBA_missionTime];
    };

    if (_roundsLeft <= 0 || {!alive _vehicle} || {!alive (gunner _vehicle)} || {objectParent (gunner _vehicle) isNotEqualTo _vehicle}) exitWith {
        [QGVAR(doArtilleryFireComplete), [_vehicle, _magazine, _roundsLeft]] call CBA_fnc_globalEvent;
        [{_this doWatch objNull}, _vehicle, 5] call CBA_fnc_waitAndExecute;
        true
    };
    false
}, {}, [_vehicle, _position, _magazine, _rounds, _spread, CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;

true
