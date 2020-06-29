#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: shukari, Schwaggot
 * Adds a right panel button for uniforms, vests and backpacks with
 * defined misc items.
 *
 * Arguments:
 * 0: items only misc items <ARRAY of STRING>
 * 1: tooltip <STRING> (Optional)
 * 2: picture path <STRING> (Optional)
 * 3: override a spezific button (0-9) <NUMBER> (Optional)
 *
 * Return Value:
 * successful: number of the slot; error: -1 <NUMBER>
 *
 * Example:
 * [["ACE_bloodIV_500", "ACE_Banana"], "MedicalStuff", "\z\ace\addons\arsenal\data\iconCustom.paa", 5] call ace_arsenal_fnc_addRightPanelButton
 *
 * Public: Yes
*/

params [["_items", [], [[]]], ["_tooltip", "", [""]], ["_picture", QPATHTOF(data\iconCustom.paa), [""]], ["_override", -1, [0]]];

if (isNil QGVAR(customRightPanelButtons)) then {
    GVAR(customRightPanelButtons) = [];
};

private _position = count GVAR(customRightPanelButtons);

if (_override != -1 && {_override >= 0} && {_override <= 9}) then {
    _position = _override;
} else {
    private _emptyPos = GVAR(customRightPanelButtons) findIf {isNil "_x"};
    if (_emptyPos != -1) then {
        _position = _emptyPos;
    };
};

private _return = -1;
if (_position >= 0 && _position <= 9) then {
    private _cfgWeapons = configFile >> "CfgWeapons";
    _items = _items select {
        private _configItemInfo = _cfgWeapons >> _x >> "ItemInfo";
           
        _x isKindOf ["CBA_MiscItem", _cfgWeapons] && {getNumber (_configItemInfo >> "type") in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD]} ||
        {getNumber (_configItemInfo >> "type") in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]} ||
        {getText (_cfgWeapons >> _x >> "simulation") == "ItemMineDetector"}
    };
    
    _return = _position;
    GVAR(customRightPanelButtons) set [_position, [_items apply {toLower _x}, _picture, _tooltip]];
};

_return
