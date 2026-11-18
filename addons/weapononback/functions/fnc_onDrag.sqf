#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles dragging weapons onto the secondary slot.
 *
 * Arguments:
 * 0: Drag origin <CONTROL>
 * 1: Information about the dragged item <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_ctrl", "_info"];

if !(secondaryWeapon ACE_player in ["", QGVAR(weapon)]) exitWith {};

// Check if dragged item is a primary weapon
private _ctrlIDC = ctrlIDC _ctrl;
private _isPrimary = if (_ctrlIDC == IDC_PRIMARY_SLOT) then {
    (primaryWeapon ACE_player != "") && {_info == 0}
} else {
    // Dragged from container
    _info#0 params ["_displayName"];

    private _container = [_ctrlIDC] call FUNC(getIDCContainer);
    if (_container isKindOf "CAManBase") then {
        _container = _container getVariable [QGVAR(droppedWeaponHolder), _container];
    };

    private _index = (weaponCargo _container) findIf {
        private _cfg = configFile >> "CfgWeapons" >> _x;
        (getText (_cfg >> "displayName") == _displayName)
        && {getNumber (_cfg >> "type") == TYPE_WEAPON_PRIMARY}
    };

    _index != -1
};

if (!_isPrimary) exitWith {
    TRACE_1("Dragged item is not a primary",_info);
};

// Set up drag and drop catcher
private _display = ctrlParent _ctrl;
private _slotSecondary = _display displayCtrl IDC_SECONDARY_SLOT;

// RscPicture does not trigger LBDrop
private _dropCatcher = _display ctrlCreate ["ctrlActivePictureKeepAspect", IDC_DROP_CATCHER];
if (secondaryWeapon ACE_player != QGVAR(weapon)) then {
    _dropCatcher ctrlSetText QPATHTOF(data\weapononback_ca.paa);
} else {
    _dropCatcher ctrlSetText "#(rgb,8,8,3)color(1,1,1,0)";
};
_dropCatcher ctrlSetPosition ctrlPosition _slotSecondary;
_dropCatcher ctrlSetTextColor [1, 1, 1, 1];
_dropCatcher ctrlSetBackgroundColor [1, 1, 1, 0];
_dropCatcher ctrlCommit 0;
_dropCatcher ctrlAddEventHandler ["LBDrop", FUNC(onDrop)];

// Hide red "you can't drop this here"
_slotSecondary ctrlSetFade 1;
_slotSecondary ctrlCommit 0;

// Create white "you can drop this here"
private _secondaryBG = _display displayCtrl IDC_SECONDARY_BG;
_secondaryBG ctrlSetText "#(rgb,8,8,3)color(1,1,1,0.25)";

// Remove drop catcher when drag and drop action was completed
private _eventHandler = _display displayAddEventHandler ["MouseButtonUp", {
    params ["_display"];

    // Reset everything to its original state
    private _eventHandler = _display getVariable QGVAR(mouseUpEH);
    _display displayRemoveEventHandler ["MouseButtonUp", _eventHandler];

    private _slotSecondary = _display displayCtrl IDC_SECONDARY_SLOT;
    _slotSecondary ctrlSetFade 0;
    _slotSecondary ctrlCommit 0;

    private _secondaryBG = _display displayCtrl IDC_SECONDARY_BG;
    _secondaryBG ctrlSetText "";

    // Delay drop catcher destruction by one frame or drop event doesn't trigger
    private _dropCatcher = _display displayCtrl IDC_DROP_CATCHER;
    _dropCatcher ctrlSetText "#(rgb,8,8,3)color(1,1,1,0)";

    [{
        params ["_display"];
        ctrlDelete (_display displayCtrl IDC_DROP_CATCHER);
    }, _this] call CBA_fnc_execNextFrame;
}];
_display setVariable [QGVAR(mouseUpEH), _eventHandler];
