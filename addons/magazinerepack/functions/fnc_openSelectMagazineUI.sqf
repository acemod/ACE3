/*
 * Author: PabstMirror (based on repack from commy2, esteldunedain, Ruthberg)
 * Opens the selectMenu UI to chose which magazine to repack.
 * Only shows classnames that have 2+ partial magazines
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_player] call ace_magazinerepack_fnc_openSelectMagazineUI
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unitMagazines", "_unitMagCounts", "_xFullMagazineCount", "_index", "_actions", "_displayName", "_picture"];

PARAMS_1(_unit);

_unitMagazines = [];
_unitMagCounts = [];

// get all mags and ammo count
{
    EXPLODE_2_PVT(_x,_xClassname,_xCount);
    _xFullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _xClassname >> "count");

    if ((_xCount != _xFullMagazineCount) && {_xCount > 0}) then {//for every partial magazine
        _index = _unitMagazines find _xClassname;
        if (_index == -1) then {
            _unitMagazines pushBack _xClassname;
            _unitMagCounts pushBack [_xCount];
        } else {
            (_unitMagCounts select _index) pushBack _xCount;
        };
    };
} forEach magazinesAmmoFull _unit;

_actions = [localize "STR_ACE_MagazineRepack_SelectMagazineMenu", localize "STR_ACE_MagazineRepack_SelectMagazine"] call EFUNC(interaction,prepareSelectMenu);

{
    if ((count (_unitMagCounts select _forEachIndex)) >= 2) then {// Ignore invalid magazines types (need 2+ partial mags to do anything)
        _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        _actions = [_actions, _displayName, _picture, _x] call EFUNC(interaction,addSelectableItem);
    };
} forEach _unitMagazines;

[
_actions,
{ [_this] call FUNC(startRepackingMagazine); },
{
    call EFUNC(interaction,hideMenu);
    if !(profileNamespace getVariable [QGVAR(AutoCloseMenu), false]) then {"Default" call EFUNC(interaction,openMenuSelf)};
}
] call EFUNC(interaction,openSelectMenu);
