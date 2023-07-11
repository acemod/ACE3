#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: shukari, Schwaggot
 * Adds a right panel button for uniforms, vests and backpacks with
 * defined misc items.
 *
 * Arguments:
 * 0: Items only misc items <ARRAY of STRING>
 * 1: Tooltip <STRING> (default: "")
 * 2: Picture path <STRING> (default: QPATHTOF(data\iconCustom.paa))
 * 3: Override a specific button (0-9) <NUMBER> (default: -1)
 * 4: Move button if its position is overridden <BOOL> (default: false)
 *
 * Return Value:
 * Successful: number of the slot (0-9) <NUMBER>
 * Error: -1 <NUMBER>
 *
 * Example:
 * [["ACE_bloodIV_500", "ACE_Banana"], "MedicalStuff", "\z\ace\addons\arsenal\data\iconCustom.paa", 5, false] call ace_arsenal_fnc_addRightPanelButton
 *
 * Public: Yes
*/

params [["_items", [], [[]]], ["_tooltip", "", [""]], ["_picture", QPATHTOF(data\iconCustom.paa), [""]], ["_override", -1, [0]], ["_moveOnOverwrite", false, [false]]];

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

    // check if we're overwriting a button that's being force-kept
    private _currentButtonInPosition = GVAR(customRightPanelButtons) select _position;
    if (!isNil "_currentButtonInPosition") then {
        _currentButtonInPosition params ["_cbItems", "_cbPicture", "_cbTooltip", "_cbMove"];
        if (_cbMove) then {
            [{_this call FUNC(addRightPanelButton)}, [_cbItems, _cbTooltip, _cbPicture, -1, _cbMove]] call CBA_fnc_execNextFrame;
        };
    };
    GVAR(customRightPanelButtons) set [_position, [_items apply {toLower _x}, _picture, _tooltip, _moveOnOverwrite]];
};

_return
