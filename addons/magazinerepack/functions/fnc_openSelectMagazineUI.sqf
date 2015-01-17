// by commy2
#include "script_component.hpp"

private ["_unit", "_magazines", "_repackTime", "_listIDC", "_count", "_index", "_magazine", "_time", "_displayName", "_picture"];

_unit = _this select 0;
_magazines = _this select 1;
_repackTime = _this select 2;

_count = count _magazines;

_actions = [localize "STR_ACE_MagazineRepack_SelectMagazineMenu", localize "STR_ACE_MagazineRepack_SelectMagazine"] call EFUNC(interaction,prepareSelectMenu);
for "_index" from 0 to (_count - 1) do {
    _magazine = _magazines select _index;
    _time = _repackTime select _index;
    _displayName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
    _picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");
    _actions = [
        _actions,
        _displayName,
        _picture,
        [str _unit, _magazine, _time]
    ] call EFUNC(interaction,addSelectableItem);
};

[
    _actions,
    {
        _data = _this;
        call EFUNC(interaction,hideMenu);
        if (isNil "_data") exitWith {};
        _data set [2, [_data select 2] call EFUNC(common,toNumber)];
        [_data select 2, _data, QFUNC(magazineRepackCallback), localize "STR_ACE_MagazineRepack_RepackingMagazine"] call EFUNC(common,progressBar);
        [ACE_player] call EFUNC(common,goKneeling);
    },
    {
        call EFUNC(interaction,hideMenu);
        if !(profileNamespace getVariable [QGVAR(AutoCloseMenu), false]) then {"Default" call EFUNC(interaction,openMenuSelf)};
    }
] call EFUNC(interaction,openSelectMenu);
