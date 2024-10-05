#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
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

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _curSel = lnbCurSelRow _contentPanelCtrl;
private _loadoutName = _contentPanelCtrl lnbText [_curSel, 1];

private _extendedLoadout = switch (GVAR(currentLoadoutsTab)) do {
    // Local and default loadouts
    case IDC_buttonMyLoadouts;
    case IDC_buttonDefaultLoadouts: {
        (_contentPanelCtrl getVariable _loadoutName + str GVAR(currentLoadoutsTab)) select 0
    };
    // Shared loadouts
    case IDC_buttonSharedLoadouts: {
        (GVAR(sharedLoadoutsNamespace) getVariable ((_contentPanelCtrl lnbText [_curSel, 0]) + (_contentPanelCtrl lnbText [_curSel, 1]))) select 2
    };
};

// Keep current loadout containers if those being loaded are not present or unavailable
private _uniform = _extendedLoadout select 0 select 3;
if (_uniform select 0 == "") then {
    _uniform set [0, uniform GVAR(center)];
};
private _vest = _extendedLoadout select 0 select 4;
if (_vest select 0 == "") then {
    _vest set [0, vest GVAR(center)];
};
private _backpack = _extendedLoadout select 0 select 5;
if (_backpack select 0 == "") then {
    _backpack set [0, backpack GVAR(center)];
};

// Apply loadout to unit
[GVAR(center), _extendedLoadout, true] call CBA_fnc_setLoadout;

// Update current item list and unique items
[true] call FUNC(refresh);

_extendedLoadout params ["_loadout", "_extendedInfo"];

// Reapply insignia
if (QGVAR(insignia) in _extendedInfo) then {
    GVAR(currentInsignia) = _extendedInfo getOrDefault [QGVAR(insignia), ""];
} else {
    [GVAR(center), ""] call BIS_fnc_setUnitInsignia;
    [GVAR(center), GVAR(currentInsignia)] call BIS_fnc_setUnitInsignia;
};

// Update current face if necessary
if (QGVAR(face) in _extendedInfo) then {
    GVAR(currentFace) = _extendedInfo getOrDefault [QGVAR(face), GVAR(currentFace)];
};

// Update voice face if necessary
if (QGVAR(voice) in _extendedInfo) then {
    GVAR(currentVoice) = _extendedInfo getOrDefault [QGVAR(voice), GVAR(currentVoice)];
};

[findDisplay IDD_ace_arsenal, [LLSTRING(loadoutLoaded), _loadoutName] joinString " "] call FUNC(message);

[QGVAR(onLoadoutLoad), [_loadout, _loadoutName]] call CBA_fnc_localEvent;
[QGVAR(onLoadoutLoadExtended), [_extendedLoadout, _loadoutName]] call CBA_fnc_localEvent;
