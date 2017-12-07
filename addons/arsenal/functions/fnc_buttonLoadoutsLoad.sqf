/*
 * Author: Alganthe
 * Load selected loadout.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSel, 1];

private _loadout = switch GVAR(currentLoadoutsTab) do {

    case IDC_buttonMyLoadouts;
    case IDC_buttonDefaultLoadouts:{
        (_contentPanelCtrl getVariable _loadoutName + str GVAR(currentLoadoutsTab)) select 0
    };

    case IDC_buttonSharedLoadouts:{
        (GVAR(sharedLoadoutsNamespace) getVariable ((_contentPanelCtrl lnbText [_curSel, 0]) + (_contentPanelCtrl lnbText [_curSel, 1]))) select 2
    };
};

GVAR(center) setUnitLoadout [_loadout, true];

GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];
for "_index" from 0 to 15 do {
    switch (_index) do {
        case 0;
        case 1;
        case 2:{
            GVAR(currentItems) set [_index, ((LIST_DEFAULTS select 0) select _index)];
        };
        case 3;
        case 4;
        case 5;
        case 6;
        case 7;
        case 8;
        case 9: {
            GVAR(currentItems) set [_index, (LIST_DEFAULTS select _index) select 0];

        };
        case 10: {
            {(GVAR(currentItems) select 15) pushBack _x} forEach (uniformItems GVAR(center));
        };
        case 11: {
            {(GVAR(currentItems) select 16) pushBack _x} forEach (vestItems GVAR(center));
        };
        case 12: {
            {(GVAR(currentItems) select 17) pushBack _x} forEach (backpackItems GVAR(center));
        };
        case 13: {
            GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + (primaryWeaponMagazine GVAR(center))];
        };
        case 14: {
            GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + (secondaryWeaponMagazine GVAR(center))];
        };
        case 15: {
            GVAR(currentItems) set [20, (handgunItems GVAR(center)) + (handgunMagazine GVAR(center))];
        };
    };
};
{
    private _simulationType = getText (configFile >> "CfgWeapons" >> _x >> "simulation");
    private _index = 10 + (["itemmap", "itemcompass", "itemradio", "itemwatch", "itemgps"] find (tolower _simulationType));

    GVAR(currentItems) set [_index, _x];
} foreach (assignedItems GVAR(center));

call FUNC(updateUniqueItemsList);

// Reapply insignia
[GVAR(center), ""] call bis_fnc_setUnitInsignia;
[GVAR(center), GVAR(currentInsignia)] call bis_fnc_setUnitInsignia;

[(findDisplay IDD_ace_arsenal), [localize LSTRING(loadoutLoaded), _loadoutName] joinString " "] call FUNC(message);
