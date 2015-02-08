// by commy2, esteldunedain
#include "script_component.hpp"

private ["_unit", "_magazines", "_ammos", "_repackTime", "_magazine", "_ammo", "_count", "_index",   "_i", "_j", "_ammoToTransfer", "_ammoAvailable", "_ammoNeeded"];

PARAMS_1(_unit);

_unitMagazines = [];
_unitMagCounts = [];

// get all mags and ammo count
{
    _xClassname = _x select 0;
    _xCount = _x select 1;
    _fullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _xClassname >> "count");

    if ((_xCount != _fullMagazineCount) && {_xCount > 1}) then {//for every partial magazine
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

systemChat format ["%1 - %2", _unitMagazines, _unitMagCounts];

{
    if ((count (_unitMagCounts select _forEachIndex)) >= 2) then {// Ignore invalid magazines types (need 2+ partial mags to do anything)
        _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        _actions = [_actions, _displayName, _picture, _x] call EFUNC(interaction,addSelectableItem);
    };
} forEach _unitMagazines;

[
_actions,
{ [ACE_player, _this] call FUNC(startRepackingMagazine); },
{
    call EFUNC(interaction,hideMenu);
    if !(profileNamespace getVariable [QGVAR(AutoCloseMenu), false]) then {"Default" call EFUNC(interaction,openMenuSelf)};
}
] call EFUNC(interaction,openSelectMenu);
