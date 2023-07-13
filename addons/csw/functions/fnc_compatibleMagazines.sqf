#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets all carry magazines that can be loaded into a CSW, includes weapons added by script
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Compatible Magazines <HashMap>
 *   Magazine classname <STRING>
 *   Nothing
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_compatibleMagazines
 *
 * Public: Yes
 */
params [["_csw", objNull, [objNull]]];

private _weapons = [];

{
    private _turret = _x;
    {
        _weapons pushBackUnique _x;
    } forEach (_csw weaponsTurret _turret);
} forEach (allTurrets _csw);

if (_weapons isEqualTo []) exitWith {[]};

private _carryMagazines = createHashMap; // hashmap for constant lookup
{
    private _weapon = _x;
    if !(_weapon in GVAR(compatibleVehicleMagsCache)) then {continue};
    _carryMagazines merge [GVAR(compatibleMagsCache) get _weapon, true];
} forEach _weapons;

_carryMagazines // return
