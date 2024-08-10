#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Unloads and returns magazines from a CSW.
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

if (!alive _vehicle) exitWith {};

private _magsToRemove = [];
private _carryMagazines = createHashMap;

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if (_xTurret isNotEqualTo _turretPath && {_turretPath isNotEqualTo true}) then {continue};
    private _carryMag = _xMag call FUNC(getCarryMagazine);
    if (_carryMag != "") then {
        _magsToRemove pushBackUnique [_xMag, _xTurret];
        _carryMagazines set [_carryMag, (_carryMagazines getOrDefault [_carryMag, 0]) + _xAmmo];
    };
} forEach (magazinesAllTurrets _vehicle);

{
    [QEGVAR(common,removeMagazinesTurret), [_vehicle, _x select 0, _x select 1], _vehicle, _x select 1] call CBA_fnc_turretEvent;
} forEach _magsToRemove;

if (_returnMags) then {
    {
        [_vehicle, _x, _y] call FUNC(reload_handleReturnAmmo);
    } forEach _carryMagazines;
};
