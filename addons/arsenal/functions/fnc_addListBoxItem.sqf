#include "script_component.hpp"
/*
 * Author: Dedmen
 * Add a listbox row.
 *
 * Arguments:
 * 0: Config category <STRING> (must be "CfgWeapons", "CfgVehicles", "CfgMagazines", "CfgVoice")
 * 1: Classname <STRING>
 * 2: Panel control <CONTROL>
 * 3: Name of the picture entry in that Cfg class <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
*/
params ["_configCategory", "_className", "_ctrlPanel", ["_pictureEntryName", "picture", [""]]];

private _cacheNamespace = _ctrlPanel; //For better readability.

private _cachedItemInfo = _cacheNamespace getVariable [_configCategory+_className, []];

//_cachedItemInfo == [_displayName, _itemPicture, _modPicture, _modID]
if (_cachedItemInfo isEqualTo []) then {//Not in cache. So get info and put into cache.

    private _configPath = configFile >> _configCategory >> _className;

    _cachedItemInfo set [0, getText (_configPath >> "displayName")];
    //if _pictureEntryName is empty then this item has no Icons. (Faces)
    _cachedItemInfo set [1, if (_pictureEntryName isEqualTo "") then {""} else {getText (_configPath >> _pictureEntryName)}];

    //get name of DLC
    private _dlcName = "";
    private _addons = configsourceaddonlist _configPath;
    if !(_addons isEqualTo []) then {
        private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);
        if !(_mods isEqualTo []) then {
            _dlcName = _mods select 0;
        };
    };

    if (_dlcName != "") then {
        _cachedItemInfo set [2, (modParams [_dlcName,["logo"]]) param [0,""]];//mod picture
        _modID = GVAR(modList) find _dlcName;
        if (_modID < 0) then {_modID = GVAR(modList) pushback _dlcName;};//We keep a ordered list of all mods for sorting later.
        _cachedItemInfo set [3, _modID];//mod ID
    } else {
        _cachedItemInfo set [2, ""];//mod picture
        _cachedItemInfo set [3, 0];//mod ID
    };
    _cacheNamespace setVariable [_configCategory+_className, _cachedItemInfo];
};

_cachedItemInfo params ["_displayName", "_itemPicture", "_modPicture", "_modID"];

private _lbAdd =  _ctrlPanel lbAdd _displayName;

_ctrlPanel lbSetData [_lbAdd, _className];
_ctrlPanel lbSetPicture [_lbAdd, _itemPicture];
_ctrlPanel lbSetPictureRight [_lbAdd,["",_modPicture] select (GVAR(enableModIcons))];
_ctrlPanel lbSetValue [_lbAdd,_modID];
_ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _className]];
