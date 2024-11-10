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

_ctrlPanel lbSetCurSel -1;
// Purge old data
lbClear _ctrlPanel;

// For every left tab except faces and voices, add "Empty" entry
if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
    private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
    _ctrlPanel lbSetValue [_addEmpty, -1];
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

    {
        [_configParent, _x, _ctrlPanel] call FUNC(addListBoxItem);
    } forEach _items;

    GVAR(currentItems) select _idxVirt
} else { // Special cases
    switch (_ctrlIDC) do {
        // Faces
        case IDC_buttonFace: {
            private _lbAdd = -1; // micro-optimization
            // Faces need to be added like this because their config path is
            // configFile >> "CfgFaces" >> face category >> className
            {
                _y params ["_displayName", "_modPicture"];
                _lbAdd = _ctrlPanel lbAdd _displayName;
                _ctrlPanel lbSetData [_lbAdd, _x];
                _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _x]];
                _ctrlPanel lbSetPictureRight [_lbAdd, ["", _modPicture] select GVAR(enableModIcons)];
            } forEach GVAR(faceCache); // HashMap, not array

            GVAR(currentFace)
        };
        // Voices
        case IDC_buttonVoice: {
            {
                ["CfgVoice", _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
            } forEach (keys GVAR(voiceCache));

            GVAR(currentVoice)
        };
        // Insignia
        case IDC_buttonInsignia: {
            {
                ["CfgUnitInsignia", _x, _ctrlPanel, "texture", _y] call FUNC(addListBoxItem);
            } forEach GVAR(insigniaCache);

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

// Try to select previously selected item again, otherwise select first item ("Empty")
if (_selectedItem != "") then {
    private _index = 0;

    for "_lbIndex" from 0 to (lbSize _ctrlPanel) - 1 do {
        if ((_ctrlPanel lbData _lbIndex) == _selectedItem) exitWith {
            _index = _lbIndex;
        };
    };

    _ctrlPanel lbSetCurSel _index;
} else {
    _ctrlPanel lbSetCurSel 0;
};
