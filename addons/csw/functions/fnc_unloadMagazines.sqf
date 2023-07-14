#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Unloads and returns magazines from a CSW
 *
 * Arguments:
 * 0: CSW <OBJECT> (default: objNull)
 * 1: Turret Path or True to unload all turrets <ARRAY|BOOL> (default: [0])
 * 2: Return removed magazines <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0]] call ace_csw_fnc_unloadMagazines
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_turretPath", [0], [[0], true]], ["_returnMags", true, [true]]];

if (isNull _vehicle) exitWith {};

private _magsToRemove = [];
private _containerMagazineClassnames = [];
private _containerMagazineCount = [];

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if (_xTurret isNotEqualTo _turretPath && {_turretPath isNotEqualTo true}) then {continue};
    private _carryMag = _xMag call FUNC(getCarryMagazine);
    if (_carryMag != "") then {
        _magsToRemove pushBackUnique [_xMag, _xTurret];
        private _index = _containerMagazineClassnames find _carryMag;
        if (_index < 0) then {
            _index = _containerMagazineClassnames pushBack _carryMag;
            _containerMagazineCount pushBack 0;
        };
        _containerMagazineCount set [_index, (_containerMagazineCount select _index) + _xAmmo];
    };
} forEach (magazinesAllTurrets _vehicle);

{
    _vehicle removeMagazinesTurret _x;
} forEach _magsToRemove;

if (_returnMags) then {
    {
        [_vehicle, _x, _containerMagazineCount select _forEachIndex] call FUNC(reload_handleReturnAmmo);
    } forEach _containerMagazineClassnames;
};
