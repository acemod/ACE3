#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: shukari, Schwaggot, johnb43
 * Adds a right panel button for uniforms, vests and backpacks with defined misc. items.
 *
 * Arguments:
 * 0: Items, must be misc items <ARRAY of STRINGs>
 * 1: Tooltip <STRING> (default: "")
 * 2: Picture path <STRING> (default: QPATHTOF(data\iconCustom.paa))
 * 3: Override a specific button (0-9) <NUMBER> (default: -1)
 * 4: Move button if its position is overridden <BOOL> (default: false)
 *
 * Return Value:
 * Successful: Number of the slot (0-9) <NUMBER>
 * Error: -1 <NUMBER>
 *
 * Example:
 * [["ACE_bloodIV_500", "ACE_Banana"], "MedicalStuff", "\z\ace\addons\arsenal\data\iconCustom.paa", 5, false] call ace_arsenal_fnc_addRightPanelButton
 *
 * Public: Yes
*/

params [["_items", [], [[]]], ["_tooltip", "", [""]], ["_picture", QPATHTOF(data\iconCustom.paa), [""]], ["_override", -1, [0]], ["_moveOnOverwrite", false, [false]]];

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

// Check if we're overwriting a button that's being force-kept
private _currentButtonInPosition = GVAR(customRightPanelButtons) select _position;
if (!isNil "_currentButtonInPosition") then {
    _currentButtonInPosition params ["_cbItems", "_cbPicture", "_cbTooltip", "_cbMove"];
    if (_cbMove) then {
        [{call FUNC(addRightPanelButton)}, [_cbItems, _cbTooltip, _cbPicture, -1, _cbMove]] call CBA_fnc_execNextFrame;
    };
};

// If spot found, add items and return position
// Sanitize to configCase and drop anything that's not a misc item
_items = _items apply {_x call EFUNC(common,getConfigName)} select {_x call FUNC(isMiscItem)};

GVAR(customRightPanelButtons) set [_position, [_items, _picture, _tooltip, _moveOnOverwrite]];

_position
