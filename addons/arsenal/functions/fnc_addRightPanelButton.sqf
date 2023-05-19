#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: shukari, Schwaggot, johnb43
 * Adds a right panel button for uniforms, vests and backpacks with defined misc. items.
 *
 * Arguments:
 * 0: Items, must be misc items <ARRAY of STRINGS>
 * 1: Tooltip <STRING> (default: "")
 * 2: Picture path <STRING> (default: QPATHTOF(data\iconCustom.paa))
 * 3: Override a specific button (0-9) <NUMBER> (default: -1)
 *
 * Return Value:
 * Successful: Number of the slot (0-9); Error: -1 <NUMBER>
 *
 * Example:
 * [["ACE_bloodIV_500", "ACE_Banana"], "MedicalStuff", "\z\ace\addons\arsenal\data\iconCustom.paa", 5] call ace_arsenal_fnc_addRightPanelButton
 *
 * Public: Yes
*/

params [["_items", [], [[]]], ["_tooltip", "", [""]], ["_picture", QPATHTOF(data\iconCustom.paa), [""]], ["_override", -1, [0]]];

if (isNil QGVAR(customRightPanelButtons)) then {
    GVAR(customRightPanelButtons) = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil];
};

private _position = -1;

// See if override is valid
if (_override >= 0 && {_override <= 9}) then {
    _position = _override;
} else {
    // Try to find an empty spot
    private _emptyPos = GVAR(customRightPanelButtons) findIf {isNil "_x"};

    if (_emptyPos != -1) then {
        _position = _emptyPos;
    };
};

// If spot not found, return error
if (_position < 0 || {_position > 9}) exitWith {
    -1
};

// If spot found, add items and return position
private _cfgWeapons = configFile >> "CfgWeapons";
private _configItemInfo = "";

_items = _items select {
    _configItemInfo = _cfgWeapons >> _x >> "ItemInfo";

    _x isKindOf ["CBA_MiscItem", _cfgWeapons] && {getNumber (_configItemInfo >> "type") in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD]} ||
    {getNumber (_configItemInfo >> "type") in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]} ||
    {getText (_cfgWeapons >> _x >> "simulation") == "ItemMineDetector"}
};

GVAR(customRightPanelButtons) set [_position, [_items apply {_x call EFUNC(common,getConfigName)}, _picture, _tooltip]];

_position
