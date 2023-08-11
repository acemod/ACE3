#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets available ammo for a CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Only loaded magazines <BOOL> (default: false)
 * 2: Skip ammo from vehicles <BOOL> (default: true)
 * 3: Include CSW crew <BOOL> (default: true)
 *
 * Return Value:
 * Available Ammo <HashMap>
 *   Magazine classname <STRING>
 *   Total Ammo <NUMBER>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_getAvailableAmmo
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_onlyLoaded", false, [false]], ["_skipVehicles", true, [true]], ["_includeCrew", true, [true]]];

if (isNull _vehicle) exitWith {createHashMap};

private _availableMagazines = createHashMap;

private _fnc_addAmmo = {
    params ["_magazine", "_ammo"];
    if !(_magazine in _availableMagazines) then {
        _availableMagazines set [_magazine, _ammo];
    } else {
        _availableMagazines set [_magazine, (_availableMagazines get _magazine) + _ammo];
    };
};

{
    _x params ["_xMag", "", "_xAmmo"];

    if (_xAmmo <= 0) then {continue};

    private _carryMag = _xMag call FUNC(getCarryMagazine);
    if (_carryMag isEqualTo "") then {continue};

    [_carryMag, _xAmmo] call _fnc_addAmmo
} forEach (magazinesAllTurrets _vehicle);

if (_onlyLoaded) exitWith {_availableMagazines};

[QGVAR(clearNearbySourcesCache), []] call CBA_fnc_localEvent;
private _sources = [_vehicle, _skipVehicles, _includeCrew] call FUNC(getNearbySources);
if (_sources isEqualTo []) exitWith {_availableMagazines};

{
    private _source = _x;
    {
        _x call _fnc_addAmmo
    } forEach ([_source, _vehicle] call FUNC(getSourceCompatibleMagazines));
} forEach _sources;

_availableMagazines // return
