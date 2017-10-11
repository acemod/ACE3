#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _ctrlIDC = ctrlIDC _control;

private _fnc_panelLeft = {
    params ["_display", "_control", "_ctrlIDC"];

    if (isNil QGVAR(currentLeftPanel) || {GVAR(currentLeftPanel) != _ctrlIDC}) then {

        if !(isNil QGVAR(currentLeftPanel)) then {
            private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
            _previousCtrlBackground ctrlSetFade 1;
            _previousCtrlBackground ctrlCommit FADE_DELAY;
        };
        
        private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
        private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
        _ctrlBackground ctrlSetFade 0;
        _ctrlBackground ctrlCommit FADE_DELAY;

        private _fnc_fill = {
            params ["_configPath"];

            private _displayName = getText (_configPath >> "displayName");

            private _lbAdd = _ctrlPanel lbAdd _displayName;

            _ctrlPanel lbSetdata [_lbAdd, _x];
            _ctrlPanel lbSetPicture [_lbAdd, geTtext (_configPath >> "picture")];
            _ctrlPanel lbSetTooltip [_lbAdd,format ["%1\n%2", _displayName, _x]];
            _configPath call ADDMODICON;
        };

        _ctrlPanel lbSetCurSel -1;

        // Handle icons and filling
        switch true do { 
            case (_ctrlIDC in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]) : {
                // Purge old data
                lbClear _ctrlPanel;
                private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
                _ctrlPanel lbsetvalue [_addEmpty, -1];

                // Filling
                switch (_ctrlIDC) do {
                    case IDC_buttonPrimaryWeapon : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getNumber (_config >> "type") == 1) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 0);
                    };

                    case IDC_buttonHandgun : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;

                            if (getNumber (_config >> "type") == 2) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 0);
                    };

                    case IDC_buttonSecondaryWeapon : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;

                            if (getNumber (_config >> "type") == 4) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 0);
                    };
                };
            };

            case (_ctrlIDC in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) : {

                lbClear _ctrlPanel;
                private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
                _ctrlPanel lbsetvalue [_addEmpty, -1];

                // Filling
                switch (_ctrlIDC) do {
                    case IDC_buttonUniform : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getNumber (_config >> "ItemInfo" >> "type") == 801) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 4);
                    };

                    case IDC_buttonVest : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getNumber (_config >> "ItemInfo" >> "type") == 701) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 5);
                    };

                    case IDC_buttonBackpack : {
                        {
                            private _config = configfile >> "CfgVehicles" >> _x;
                            if ((getText (_config >> "vehicleClass")) == "Backpacks") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 6);
                    };
                };
            };

            default {
                GVAR(currentRightPanel) = nil;

                 lbClear _ctrlPanel;

                 if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
                    private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
                    _ctrlPanel lbsetvalue [_addEmpty, -1];
                 };

                 switch (_ctrlIDC) do {
                    case IDC_buttonHeadgear: {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getNumber (_config >> "ItemInfo" >> "type") == 605) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 3);
                    };
                    case IDC_buttonGoggles : {
                        {
                            private _config = configfile >> "CfgGlasses" >> _x;
                            [_config] call _fnc_fill;
                        } foreach (GVAR(virtualItems) select 7);
                    };
                    case IDC_buttonNVG : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "NVGoggles") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 8);
                    };
                    case IDC_buttonBinoculars : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if ((getText (_config >> 'simulation') == 'Weapon') && {(getNumber (_config >> 'type') == 4096)}) then {
                                [_config] call _fnc_fill;
                            };
                            if ((getText (_config >> 'simulation') == 'Binocular') && {(getNumber (_config >> 'type') == 4096)}) then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 9);
                    };
                    case IDC_buttonMap : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "ItemMap") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 10);
                    };
                    case IDC_buttonCompass : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "ItemCompass") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 11);
                    };
                    case IDC_buttonRadio : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "ItemRadio") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 12);
                    };
                    case IDC_buttonWatch : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "ItemWatch") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 13);
                    };
                    case IDC_buttonGPS : {
                        {
                            private _config = configfile >> "CfgWeapons" >> _x;
                            if (getText (_config >> "simulation") == "ItemGPS") then {
                                [_config] call _fnc_fill;
                            };
                        } foreach (GVAR(virtualItems) select 14);
                    };
                    case IDC_buttonFace : {
                        {
                            {
                                if (getnumber (_x >> "disabled") == 0 && gettext (_x >> "head") != "" && configname _x != "Default") then {
                                    private _configName = configName _x;
                                    private _displayName = gettext (_x >> "displayName");
                                    private _lbAdd = _ctrlPanel lbadd _displayName;
                                    _ctrlPanel lbsetdata [_lbAdd, _configName];
                                    _ctrlPanel lbsettooltip [_lbAdd,format ["%1\n%2",_displayName, _configName]];
                                    _x call ADDMODICON;
                                };
                            } foreach ("isclass _x" configclasses _x);
                        } foreach ("isclass _x" configclasses (configfile >> "cfgfaces"));
                    };
                    case IDC_buttonVoice : {
                        {
                            private _configName = configName _x;
                            private _displayName = gettext (_x >> "displayName");
                            _lbAdd = _ctrlPanel lbAdd _displayName;
                            _ctrlPanel lbSetData [_lbAdd, _configName];
                            _ctrlPanel lbSetPicture [_lbAdd,gettext (_x >> "icon")];
                            _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _configName]];
                            _x call ADDMODICON;
                        } foreach configProperties [(configFile >> "CfgVoice"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true];
                    };
                    case IDC_buttonInsigna : {
                        {
                            private _configName = configName _x;
                            _displayName = getText (_x >> "displayName");
                            _lbAdd = _ctrlPanel lbAdd _displayName;
                            _ctrlPanel lbSetData [_lbAdd, _configName];
                            _ctrlPanel lbSetPicture [_lbAdd, getText (_x >> "texture")];
                            _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _configName]];
                        } foreach ("true" configClasses (configFile >> "CfgUnitInsignia"));
                    };
                };
            };
        };

        // Done
        GVAR(currentLeftPanel) = _ctrlIDC;

        private _itemsToCheck = (GVAR(currentItems) select [0,14]) + [GVAR(currentFace), GVAR(currentVoice), GVAR(currentInsignia)];

        for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
            private _currentData = _ctrlPanel lbData _lbIndex;

            if ({_x != "" && {_currentData == _x}} count _itemsToCheck > 0) then {
                _ctrlPanel lbSetCurSel _lbIndex;
            };
        };
        if (lbCurSel _ctrlPanel < 0) then {
            _ctrlPanel lbSetCurSel 0;
        };
    };
};

private _fnc_panelRight = {
    params ["_display", "_control", "_ctrlIDC"];

    if !(isNil QGVAR(currentRightPanel)) then {
        private _previousCtrlBackground  = _display displayCtrl (GVAR(currentRightPanel) - 1);
        _previousCtrlBackground ctrlSetFade 1;
        _previousCtrlBackground ctrlCommit FADE_DELAY;
    };

    private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
    _ctrlBackground ctrlShow true;
    _ctrlBackground ctrlSetFade 0;
    _ctrlBackground ctrlCommit FADE_DELAY;

    private _searchbarCtrl = _display displayCtrl IDC_rightSearchbar;
    private _ctrlPanelRight = _display displayCtrl IDC_rightTabContent;
    if (!(ctrlShown _searchbarCtrl) || {ctrlFade _searchbarCtrl > 0}) then {
        _searchbarCtrl ctrlShow true;
        _searchbarCtrl ctrlSetFade 0;
        _searchbarCtrl ctrlCommit 0;
    };

    private _fnc_fill_right = {
        params ["_configPath"];

        private _displayName = getText (_configPath >> "displayName");

        private _lbAdd = _ctrlPanelRight lbAdd _displayName;

        _ctrlPanelRight lbSetdata [_lbAdd, _x];
        _ctrlPanelRight lbSetPicture [_lbAdd, geTtext (_configPath >> "picture")];
        _ctrlPanelRight lbSetTooltip [_lbAdd,format ["%1\n%2", _displayName, _x]];
        _configPath call ADDMODICON;
    };

     private _compatibleItems = [];
    switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonPrimaryWeapon : {
          _compatibleItems = (primaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
        };
        case IDC_buttonHandgun : {
            _compatibleItems = (handgunWeapon GVAR(center)) call bis_fnc_compatibleItems;
        };
        case IDC_buttonSecondaryWeapon : {
            _compatibleItems = (secondaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
        };
    };

    lbClear _ctrlPanelRight;

    _ctrlPanelRight lbSetCurSel -1;

    if (_ctrlIDC in [RIGHT_PANEL_ACC_IDCS] && {GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]}) then {
        private _addEmpty = _ctrlPanelRight lbadd format [" <%1>",localize "str_empty"];
        _ctrlPanelRight lbsetvalue [_addEmpty, -1];
    };

    switch (_ctrlIDC) do {
        case IDC_buttonOptic : {
            {
                private _config = configfile >> "CfgWeapons" >> _x;
                if (getNumber (_config >> "ItemInfo" >> "type") == 201 && {_x in _compatibleItems}) then {
                    [_config] call _fnc_fill_right;
                };
            } foreach (GVAR(virtualItems) select 1);
        };
        case IDC_buttonItemAcc : {

            {
                private _config = configfile >> "CfgWeapons" >> _x;
                if (getNumber (_config >> "ItemInfo" >> "type") == 301  && {_x in _compatibleItems}) then {
                    [_config] call _fnc_fill_right;
                };
            } foreach (GVAR(virtualItems) select 1);
        };
        case IDC_buttonMuzzle : {

            {
                private _config = configfile >> "CfgWeapons" >> _x;
                if (getNumber (_config >> "ItemInfo" >> "type") == 101  && {_x in _compatibleItems}) then {
                    [_config] call _fnc_fill_right;
                };
            } foreach (GVAR(virtualItems) select 1);
        };
        case IDC_buttonBipod : {

            {
                private _config = configfile >> "CfgWeapons" >> _x;
                if (getNumber (_config >> "ItemInfo" >> "type") == 302  && {_x in _compatibleItems}) then {
                    [_config] call _fnc_fill_right;
                };
            } foreach (GVAR(virtualItems) select 1);
        };
        case IDC_buttonMag : {

        };
        case IDC_buttonMagALL : {

        };
        case IDC_buttonThrow : {

        };
        case IDC_buttonPut : {

        };
        case IDC_buttonMisc : {

        };
    };

    GVAR(currentRightPanel) = _ctrlIDC;
};

switch (_ctrlIDC) do {

    case IDC_buttonPrimaryWeapon : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonHandgun : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonSecondaryWeapon : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonHeadgear : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonUniform : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonVest: {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonBackpack : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonGoggles : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonNVG : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonBinoculars : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonMap : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonGPS : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonRadio : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonCompass : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonWatch : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonFace : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonVoice : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonInsigna : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonOptic : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonItemAcc : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMuzzle : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonBipod : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMag : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMagALL : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonThrow : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonPut : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMisc : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
};