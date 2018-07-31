/*
 * Author: Alganthe
 * Handles selection changes on the left panel.
 *
 * Arguments:
 * 0: Left panel control <CONTROL>
 * 1: Left panel selection <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);

private _weaponDefaultRightPanel = _display displayCtrl IDC_buttonOptic;
private _selectCorrectPanelWeapon = [_weaponDefaultRightPanel, _display displayCtrl GVAR(currentRightPanel)] select (!(isNil QGVAR(currentRightPanel)) && {GVAR(currentRightPanel) in [RIGHT_PANEL_ACC_IDCS, IDC_buttonCurrentMag, IDC_buttonCurrentMag2]});

private _containerDefaultRightPanel = _display displayCtrl IDC_buttonMisc;
private _selectCorrectPanelContainer = [_containerDefaultRightPanel, _display displayCtrl GVAR(currentRightPanel)] select (!(isNil QGVAR(currentRightPanel)) && {GVAR(currentRightPanel) in [RIGHT_PANEL_ITEMS_IDCS]});

private _fnc_clearPreviousWepMags = {
    private _compatibleMags = getArray (configfile >> "cfgweapons" >> _baseWeapon >> "magazines");
    {
        GVAR(center) removeMagazines _x;
    } foreach _compatibleMags;

    GVAR(currentItems) set [15, uniformItems GVAR(center)];
    GVAR(currentItems) set [16, vestItems GVAR(center)];
    GVAR(currentItems) set [17, backpackItems GVAR(center)];
};

switch (GVAR(currentLeftPanel)) do {

    case IDC_buttonPrimaryWeapon : {
        private _baseWeapon = ((GVAR(currentItems) select 0) call bis_fnc_baseWeapon);

        if (_item == "") then {
            call _fnc_clearPreviousWepMags;

            GVAR(center) removeWeapon (primaryWeapon GVAR(center));
            GVAR(currentItems) set [18, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [0, _item];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select 0) != _item && {_baseWeapon != _item}) then {
                call _fnc_clearPreviousWepMags;

                private _compatibleItems = (_item call bis_fnc_compatibleItems) apply {tolower _x};
                GVAR(center) addWeaponGlobal _item;
                GVAR(center) addWeaponItem [_item, [(getArray (configfile >> "cfgweapons" >> _item >> "magazines")) select 0]];

                {
                    if (tolower _x in _compatibleItems || {_x in _compatibleMags}) then {
                        GVAR(center) addPrimaryWeaponItem _x;
                    };
                } foreach (GVAR(currentItems) select 18);

                private _primaryMags = primaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + ([_primaryMags + [""], _primaryMags] select (count _primaryMags > 1))];
                GVAR(currentItems) set [0, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON
            [_display, _selectCorrectPanelWeapon] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonHandgun : {
        private _baseWeapon = ((GVAR(currentItems) select 2) call bis_fnc_baseWeapon);

        if (_item == "") then {
            call _fnc_clearPreviousWepMags;

            GVAR(center) removeWeapon (handgunWeapon GVAR(center));
            GVAR(currentItems) set [18, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [2, _item];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select 2) != _item && {_baseWeapon != _item}) then {
                call _fnc_clearPreviousWepMags;

                private _compatibleItems = (_item call bis_fnc_compatibleItems) apply {tolower _x};
                GVAR(center) addWeaponGlobal _item;
                GVAR(center) addWeaponItem [_item, [(getArray (configfile >> "cfgweapons" >> _item >> "magazines")) select 0]];

                {
                    if (tolower _x in _compatibleItems || {_x in _compatibleMags}) then {
                        GVAR(center) addHandgunItem _x;
                    };
                } foreach (GVAR(currentItems) select 20);

                private _handgunMags = handgunMagazine GVAR(center);
                GVAR(currentItems) set [20, (handgunItems GVAR(center)) + ([_handgunMags + [""], _handgunMags] select (count _handgunMags > 1))];
                GVAR(currentItems) set [2, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON
            [_display, [_selectCorrectPanelWeapon, _weaponDefaultRightPanel] select (GVAR(currentRightPanel) == IDC_buttonCurrentMag2)] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonSecondaryWeapon : {
        private _baseWeapon = ((GVAR(currentItems) select 1) call bis_fnc_baseWeapon);

        if (_item == "") then {
            call _fnc_clearPreviousWepMags;

            GVAR(center) removeWeapon (secondaryWeapon GVAR(center));
            GVAR(currentItems) set [18, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [1, _item];
            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select 1) != _item && {_baseWeapon != _item}) then {
                call _fnc_clearPreviousWepMags;

                private _compatibleItems = (_item call bis_fnc_compatibleItems) apply {tolower _x};
                GVAR(center) addWeaponGlobal _item;
                GVAR(center) addWeaponItem [_item, [(getArray (configfile >> "cfgweapons" >> _item >> "magazines")) select 0]];

                {
                    if (tolower _x in _compatibleItems || {_x in _compatibleMags}) then {
                        GVAR(center) addSecondaryWeaponItem _x;
                    };
                } foreach (GVAR(currentItems) select 19);

                private _secondaryMags = secondaryWeaponMagazine GVAR(center);
                GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + ([_secondaryMags + [""], _secondaryMags] select (count _secondaryMags > 1))];
                GVAR(currentItems) set [1, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON
            [_display, [_selectCorrectPanelWeapon, _weaponDefaultRightPanel] select (GVAR(currentRightPanel) == IDC_buttonCurrentMag2)] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonHeadgear : {

        if (_item == "") then {
            removeHeadgear GVAR(center);
            GVAR(currentItems) set [3, _item];
        } else {
            if ((GVAR(currentItems) select 3) != _item) then {
                GVAR(center) addHeadgear _item;
                GVAR(currentItems) set [3, _item];
            };
        };
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonUniform : {
        if (_item == "") then {

            removeuniform GVAR(center);
            GVAR(currentItems) set [15, []];
            GVAR(currentItems) set [4, _item];
            TOGGLE_RIGHT_PANEL_HIDE
        } else {

            if ((GVAR(currentItems) select 4) != _item) then {
                GVAR(center) forceAddUniform _item;

                while {count uniformItems GVAR(center) > 0} do {
                    GVAR(center) removeItemFromUniform (uniformItems GVAR(center) select 0);
                }; //--- Remove default config contents

                {GVAR(center) addItemtoUniform _x} foreach (GVAR(currentItems) select 15);
                GVAR(currentItems) set [4, _item];

                [GVAR(center), ""] call bis_fnc_setUnitInsignia;
                [GVAR(center), GVAR(currentInsignia)] call bis_fnc_setUnitInsignia;
            };

            TOGGLE_RIGHT_PANEL_CONTAINER
            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonVest: {
        if (_item == "") then {

            removeVest GVAR(center);
            GVAR(currentItems) set [16, []];
            GVAR(currentItems) set [5, _item];
            TOGGLE_RIGHT_PANEL_HIDE
        } else {

            if ((GVAR(currentItems) select 5) != _item) then {
                GVAR(center) addVest _item;
                while {count vestItems GVAR(center) > 0} do {
                    GVAR(center) removeItemFromVest (VestItems GVAR(center) select 0);
                }; //--- Remove default config contents
                {GVAR(center) addItemToVest _x} foreach (GVAR(currentItems) select 16);

                GVAR(currentItems) set [5, _item];
            };

            TOGGLE_RIGHT_PANEL_CONTAINER
            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonBackpack : {
        if (_item == "") then {

            removeBackpack GVAR(center);
            GVAR(currentItems) set [17, []];
            GVAR(currentItems) set [6, _item];
            TOGGLE_RIGHT_PANEL_HIDE
        } else {

            if ((GVAR(currentItems) select 6) != _item) then {
                removeBackpack GVAR(center);
                GVAR(center) addBackpackGlobal _item;
                while {count backpackItems GVAR(center) > 0} do {
                    GVAR(center) removeItemFromBackpack (backpackItems GVAR(center) select 0);
                }; //--- Remove default config contents
                {GVAR(center) addItemToBackpack _x} foreach (GVAR(currentItems) select 17);

                GVAR(currentItems) set [6, _item];
            };

            TOGGLE_RIGHT_PANEL_CONTAINER
            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        call FUNC(showItem);
        [_display, _control, _curSel, (configFile >> "CfgVehicles" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonGoggles : {
        if (_item == "") then {
            removeGoggles GVAR(center);
            GVAR(currentItems) set [7, _item];
        } else {
            if ((GVAR(currentItems) select 7) != _item) then {
                GVAR(center) addGoggles _item;
                GVAR(currentItems) set [7, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgGlasses" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonNVG : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 8);
            GVAR(currentItems) set [8, _item];
        } else {
            if ((GVAR(currentItems) select 8) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [8, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonBinoculars : {
        if (_item == "") then {
            GVAR(center) removeWeapon (binocular GVAR(center));
            GVAR(currentItems) set [9, _item];
        } else {
            if ((GVAR(currentItems) select 9) != _item) then {
                GVAR(center) addWeaponGlobal _item;
                GVAR(currentItems) set [9, _item];
                call FUNC(showItem);
                ADDBINOCULARSMAG
            };
        };
        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonMap : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 10) select 0;
            GVAR(currentItems) set [10, _item];
        } else {
            if ((GVAR(currentItems) select 10) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [10, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonCompass : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 11) select 0;
            GVAR(currentItems) set [11, _item];
        } else {
            if ((GVAR(currentItems) select 11) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [11, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonRadio : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 12) select 0;
            GVAR(currentItems) set [12, _item];
        } else {
            if ((GVAR(currentItems) select 12) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [12, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonWatch : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 13);
            GVAR(currentItems) set [13, _item];
        } else {
            if ((GVAR(currentItems) select 13) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [13, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonGPS : {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select 14) select 0;
            GVAR(currentItems) set [14, _item];
        } else {
            if ((GVAR(currentItems) select 14) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [14, _item];
            };
        };

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonFace : {
        private _face = [_item, "Default"] select (_item == "");

        GVAR(center) setFace _face;
        GVAR(currentFace) = _face;

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgFaces" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonVoice : {
        GVAR(center) setSpeaker _item;
        GVAR(currentVoice) = _item;

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgVoice" >> _item)] call FUNC(itemInfo);
    };

    case IDC_buttonInsigna : {
        [GVAR(center), _item] call bis_fnc_setUnitInsignia;
        GVAR(currentInsignia) = _item;

        call FUNC(showItem);
        TOGGLE_RIGHT_PANEL_HIDE
        [_display, _control, _curSel, (configFile >> "CfgUnitInsignia" >> _item)] call FUNC(itemInfo);
    };
};

(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", [GVAR(center), 2] call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);
