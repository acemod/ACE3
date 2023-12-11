#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
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

// Fade old control background
if (!isNil QGVAR(currentLeftPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);
};

// Show new control background
private _ctrlIDC = ctrlIDC _control;
private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
_ctrlBackground ctrlSetFade 0;
_ctrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);

private _ctrlPanel = _display displayCtrl IDC_leftTabContent;

// Force a "refresh" animation of the panel
if (_animate) then {
    _ctrlPanel ctrlSetFade 1;
    _ctrlPanel ctrlCommit 0;
    _ctrlPanel ctrlSetFade 0;
    _ctrlPanel ctrlCommit FADE_DELAY;
};

_ctrlPanel lbSetCurSel -1;

// Handle icons and filling
private _selectedItem = switch (true) do {
    // Primary weapons, secondary weapons, handgun weapons
    case (_ctrlIDC in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]): {
        // Purge old data
        lbClear _ctrlPanel;

        // Add "Empty" entry
        private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
        _ctrlPanel lbSetValue [_addEmpty, -1];

        // Add selected tab's weapons
        private _index = [IDC_buttonPrimaryWeapon, IDC_buttonSecondaryWeapon, IDC_buttonHandgun] find _ctrlIDC;

        {
            ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
        } forEach (keys ((GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _index));

        GVAR(currentItems) select _index
    };
    // Uniforms, vests, backpacks
    case (_ctrlIDC in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]): {
        // Purge old data
        lbClear _ctrlPanel;

        // Add "Empty" entry
        private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
        _ctrlPanel lbSetValue [_addEmpty, -1];

        switch (_ctrlIDC) do {
            // Add uniforms
            case IDC_buttonUniform: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_UNIFORM));

                GVAR(currentItems) select IDX_CURR_UNIFORM
            };
            // Add vests
            case IDC_buttonVest: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_VEST));

                GVAR(currentItems) select IDX_CURR_VEST
            };
            // Add backpacks
            case IDC_buttonBackpack: {
                {
                    ["CfgVehicles", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_BACKPACK));

                GVAR(currentItems) select IDX_CURR_BACKPACK
            };
        };
    };
    // Other
    default {
        // Don't reset right panel selection if left tab is binos
        if (_ctrlIDC != IDC_buttonBinoculars) then {
            GVAR(currentRightPanel) = nil;
        };

        lbClear _ctrlPanel;

        // For every left tab except faces and voices, add "Empty" entry
        if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
            private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
            _ctrlPanel lbSetValue [_addEmpty, -1];
        };

        switch (_ctrlIDC) do {
            // Headgear
            case IDC_buttonHeadgear: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_HEADGEAR));

                GVAR(currentItems) select IDX_CURR_HEADGEAR
            };
            // Facewear
            case IDC_buttonGoggles: {
                {
                    ["CfgGlasses", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_GOGGLES));

                GVAR(currentItems) select IDX_CURR_GOGGLES
            };
            // NVGs
            case IDC_buttonNVG: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_NVG));

                GVAR(currentItems) select IDX_CURR_NVG
            };
            // Binoculars
            case IDC_buttonBinoculars: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_BINO));

                GVAR(currentItems) select IDX_CURR_BINO
            };
            // Maps
            case IDC_buttonMap: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_MAP));

                GVAR(currentItems) select IDX_CURR_MAP
            };
            // Compasses
            case IDC_buttonCompass: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_COMPASS));

                GVAR(currentItems) select IDX_CURR_COMPASS
            };
            // Radios
            case IDC_buttonRadio: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_RADIO));

                GVAR(currentItems) select IDX_CURR_RADIO
            };
            // Watches
            case IDC_buttonWatch: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_WATCH));

                GVAR(currentItems) select IDX_CURR_WATCH
            };
            // GPS and UAV Terminals
            case IDC_buttonGPS: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } forEach (keys (GVAR(virtualItems) get IDX_VIRT_COMMS));

                GVAR(currentItems) select IDX_CURR_COMMS
            };
            // Faces
            case IDC_buttonFace: {
                private _lbAdd = -1;

                {
                    _y params ["_displayName", "_modPicture"];

                    _lbAdd = _ctrlPanel lbAdd _displayName;
                    _ctrlPanel lbSetData [_lbAdd, _x];
                    _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _x]];
                    _ctrlPanel lbSetPictureRight [_lbAdd, _modPicture];
                } forEach (uiNamespace getVariable QGVAR(faceCache));

                GVAR(currentFace)
            };
            // Voices
            case IDC_buttonVoice: {
                {
                    ["CfgVoice", _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
                } forEach (uiNamespace getVariable QGVAR(voiceCache));

                GVAR(currentVoice)
            };
            // Insignia
            case IDC_buttonInsignia: {
                // Insignia from config
                {
                    ["CfgUnitInsignia", _x, _ctrlPanel, "texture"] call FUNC(addListBoxItem);
                } forEach (uiNamespace getVariable QGVAR(insigniaCache));

                private _displayName = "";
                private _className = "";
                private _lbAdd = -1;

                // Insignia from mission file
                {
                    _className = configName _x;
                    _displayName = getText (_x >> "displayName");
                    _lbAdd = _ctrlPanel lbAdd _displayName;

                    _ctrlPanel lbSetData [_lbAdd, _className];
                    _ctrlPanel lbSetPicture [_lbAdd, getText (_x >> "texture")];
                    _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _className]];
                } forEach ("(if (isNumber (_x >> 'scope')) then {getNumber (_x >> 'scope')} else {2}) == 2" configClasses (missionConfigFile >> "CfgUnitInsignia"));

                GVAR(currentInsignia)
            };
            // Unknown
            default {""};
        };
    };
};

// When switching tabs, clear searchbox
if (GVAR(currentLeftPanel) != _ctrlIDC) then {
    (_display displayCtrl IDC_leftSearchbar) ctrlSetText "";
    (_display displayCtrl IDC_rightSearchbar) ctrlSetText "";
};

// Trigger event
GVAR(currentLeftPanel) = _ctrlIDC;
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
