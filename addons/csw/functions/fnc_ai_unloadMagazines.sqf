#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Switch loaded magazine on an AI CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Gunner <OBJECT>
 * 2: Turret Path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_vehicle", "_gunner", "_turretPath"];

private _magsToRemove = [];
private _containerMagazineClassnames = [];
private _containerMagazineCount = [];

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if (_xTurret isNotEqualTo _turretPath) then {continue};
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
} forEach (_vehicle magazinesAllTurrets _vehicle);

{
    _vehicle removeMagazinesTurret _x;
} forEach _magsToRemove;

{
    [_vehicle, _x, _containerMagazineCount select _forEachIndex] call FUNC(reload_handleReturnAmmo);
} forEach _containerMagazineClassnames;
