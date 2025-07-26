#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43, LinkIsGrim
 * Fills left panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 * 2: Animate panel refresh <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", ["_animate", true]];

private _ctrlIDC = ctrlIDC _control;
private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
private _idxVirt = GVAR(idxMap) getOrDefault [_ctrlIDC, -1, true];

// Fade old control background
if (!isNil QGVAR(currentLeftPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);

    // When switching tabs, clear searchbox
    if (GVAR(currentLeftPanel) != _ctrlIDC) then {
        (_display displayCtrl IDC_leftSearchbar) ctrlSetText "";
        (_display displayCtrl IDC_rightSearchbar) ctrlSetText "";
    };
};

// Show new control background
private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
_ctrlBackground ctrlSetFade 0;
_ctrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);

// Force a "refresh" animation of the panel
if (_animate) then {
    _ctrlPanel ctrlSetFade 1;
    _ctrlPanel ctrlCommit 0;
    _ctrlPanel ctrlSetFade 0;
    _ctrlPanel ctrlCommit FADE_DELAY;
};

_ctrlPanel tvSetCurSel [];
// Purge old data
tvClear _ctrlPanel;

// For every left tab except faces and voices, add "Empty" entry as root node
if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
    private _emptyIndex = _ctrlPanel tvAdd [[], format [" <%1>", localize "str_empty"]];
    _ctrlPanel tvSetData [[_emptyIndex], ""];
};

// Don't reset the current right panel for weapons, binos and containers
if !(_idxVirt in [IDX_VIRT_PRIMARY_WEAPONS, IDX_VIRT_SECONDARY_WEAPONS, IDX_VIRT_HANDGUN_WEAPONS, IDX_VIRT_BINO, IDX_VIRT_UNIFORM, IDX_VIRT_VEST, IDX_VIRT_BACKPACK]) then {
    GVAR(currentRightPanel) = nil;
};
GVAR(currentLeftPanel) = _ctrlIDC;

// Add items to the listbox
private _selectedItem = if (_idxVirt != -1) then { // Items
    private _configParent = switch (_idxVirt) do {
        case IDX_VIRT_GOGGLES: {"CfgGlasses"};
        case IDX_VIRT_BACKPACK: {"CfgVehicles"};
        default {"CfgWeapons"};
    };

    private _items = if (_idxVirt < IDX_VIRT_HEADGEAR) then {
        keys ((GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _idxVirt)
    } else {
        keys (GVAR(virtualItems) get _idxVirt)
    };

    // Use tree structure for item organization
    [_configParent, _items, _ctrlPanel] call FUNC(fillLeftPanelTree);

    GVAR(currentItems) select _idxVirt
} else { // Special cases
    switch (_ctrlIDC) do {
        // Faces
        case IDC_buttonFace: {
            // Convert faces to items array and use tree structure
            private _faceItems = keys GVAR(faceCache);
            ["CfgFaces", _faceItems, _ctrlPanel, ""] call FUNC(fillLeftPanelTree);

            GVAR(currentFace)
        };
        // Voices
        case IDC_buttonVoice: {
            // Convert voices to items array and use tree structure
            private _voiceItems = keys GVAR(voiceCache);
            ["CfgVoice", _voiceItems, _ctrlPanel, "icon"] call FUNC(fillLeftPanelTree);

            GVAR(currentVoice)
        };
        // Insignia
        case IDC_buttonInsignia: {
            // Convert insignia to items array and use tree structure
            private _insigniaItems = keys GVAR(insigniaCache);
            ["CfgUnitInsignia", _insigniaItems, _ctrlPanel, "texture"] call FUNC(fillLeftPanelTree);

            GVAR(currentInsignia)
        };
        // Unknown
        default {
            WARNING_1("Unknown arsenal left panel with IDC %1, update ace_arsenal_idxMap and relevant macros if adding a new tab",_ctrlIDC);
            ""
        };
    };
};

// Trigger event
[QGVAR(leftPanelFilled), [_display, _ctrlIDC, GVAR(currentRightPanel)]] call CBA_fnc_localEvent;

// Sort
[_display, _control, _display displayCtrl IDC_sortLeftTab, _display displayCtrl IDC_sortLeftTabDirection] call FUNC(fillSort);

// Try to select previously selected item again, otherwise select first item
if (_selectedItem != "") then {
    private _found = false;
    private _groupCount = _ctrlPanel tvCount [];
    
    // Search through all groups and items to find the selected item
    for "_groupIndex" from 0 to (_groupCount - 1) do {
        if (_found) exitWith {};
        
        private _itemCount = _ctrlPanel tvCount [_groupIndex];
        for "_itemIndex" from 0 to (_itemCount - 1) do {
            if ((_ctrlPanel tvData [_groupIndex, _itemIndex]) == _selectedItem) exitWith {
                _ctrlPanel tvSetCurSel [_groupIndex, _itemIndex];
                _found = true;
            };
        };
    };
    
    // If not found, select empty entry or first available item
    if (!_found) then {
        if (_groupCount > 0) then {
            _ctrlPanel tvSetCurSel [0];
        };
    };
} else {
    // Select the empty entry or first group
    if ((_ctrlPanel tvCount []) > 0) then {
        _ctrlPanel tvSetCurSel [0];
    };
};
