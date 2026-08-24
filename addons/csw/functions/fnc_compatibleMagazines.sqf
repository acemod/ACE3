#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets all carry magazines that can be loaded into a CSW, includes weapons added by script.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Compatible Carry Magazines <HASHMAP>
 *   Magazine classname <STRING>
 *   true <BOOL>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_compatibleMagazines
 *
 * Public: Yes
 */

params [["_csw", objNull, [objNull]]];

// Caches are filled here rather than on weapon swap, a CSW without a proxy weapon needs them too
private _fnc_cacheWeapon = {
    private _weapon = _this;

    GVAR(compatibleCarryMagsCache) getOrDefaultCall [_weapon, {
        // Vehicle magazines without a carry equivalent come back as "", they can't be loaded by hand
        // compatibleMagazines here is the engine command, not this function
        private _carryMags = ((compatibleMagazines _weapon) apply {_x call FUNC(getCarryMagazine)}) select {_x != ""};

        _carryMags createHashMapFromArray (_carryMags apply {true})
    }, true]
};

private _weapons = [];
{
    private _turret = _x;
    {
        _weapons pushBackUnique _x;
    } forEach (_csw weaponsTurret _turret);
} forEach (allTurrets _csw);

if (_weapons isEqualTo []) exitWith {createHashMap};

// Copies, so callers can't edit the cache. Single weapon is by far the most common CSW, skip the merge
if (count _weapons isEqualTo 1) exitWith {+((_weapons select 0) call _fnc_cacheWeapon)};

private _carryMagazines = createHashMap;
{
    _carryMagazines merge [_x call _fnc_cacheWeapon, true];
} forEach _weapons;

_carryMagazines // return
