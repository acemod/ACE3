#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles dragging the weapon on the back onto a container.
 *
 * Arguments:
 * 0: Secondary slot control <CONTROL>
 * 1: Mouse button ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_ctrl", "_mouseButton"];

if (_mouseButton != 0 || {secondaryWeapon ACE_player != QGVAR(weapon)}) exitWith {};

// Replace primary slot with drop catcher, make background white
private _display = ctrlParent _ctrl;
private _primarySlot = _display displayCtrl IDC_PRIMARY_SLOT;
_primarySlot ctrlSetFade 1;
_primarySlot ctrlCommit 0;
private _primaryBG = _display displayCtrl IDC_PRIMARY_BG;
_primaryBG ctrlSetText "#(rgb,8,8,3)color(1,1,1,0.25)";

// RscPicture does not trigger LBDrop
private _dropCatcher = _display ctrlCreate ["ctrlActivePictureKeepAspect", IDC_DROP_CATCHER];
if (primaryWeapon ACE_player == "") then {
    _dropCatcher ctrlSetText "a3\ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
} else {
    _dropCatcher ctrlSetText getText (configFile >> "CfgWeapons" >> primaryWeapon ACE_player >> "picture");
};
_dropCatcher ctrlSetPosition ctrlPosition _primarySlot;
_dropCatcher ctrlSetTextColor [1, 1, 1, 1];
_dropCatcher ctrlSetBackgroundColor [1, 1, 1, 1];
_dropCatcher ctrlCommit 0;
_dropCatcher ctrlAddEventHandler ["LBDrop", {[true] call FUNC(onDropWOB)}];

// Create image for the currently dragged weapon under the cursor
private _imgContainer = _display displayCtrl IDC_WEAPON_IMAGE;
private _dragImage = _display ctrlCreate ["RscPictureKeepAspect", -1];

_dragImage ctrlSetPosition ctrlPosition _imgContainer;
_dragImage ctrlSetText ctrlText _imgContainer;
_dragImage ctrlEnable false;
_dragImage ctrlCommit 0;

(ctrlPosition _dragImage) params ["", "", "_w", "_h"];
private _widthOffset = _w / 2;
private _heightOffset = _h / 2;
_dragImage ctrlSetPosition [getMousePosition#0 - _widthOffset, getMousePosition#1 - _heightOffset];
_dragImage ctrlCommit 0;

private _eventHandlers = [
    _display displayAddEventHandler ["MouseMoving", {
        params ["_display"];

        private _dragImage = _display getVariable [QGVAR(dragImage), ctrlNull];
        (ctrlPosition _dragImage) params ["", "", "_w", "_h"];
        private _widthOffset = _w / 2;
        private _heightOffset = _h / 2;
        _dragImage ctrlSetPosition [getMousePosition#0 - _widthOffset, getMousePosition#1 - _heightOffset];
        _dragImage ctrlCommit 0;
    }],
    _display displayAddEventHandler ["MouseButtonUp", {
        params ["_display"];

        private _dragImage = _display getVariable [QGVAR(dragImage), ctrlNull];
        ctrlDelete _dragImage;

        // Clean up event handlers
        private _eventHandlers = _display getVariable [QGVAR(dragWOBEHs), []];
        _eventHandlers params ["_mouseMoving", "_mouseButtonUp"];
        _display displayRemoveEventHandler ["MouseMoving", _mouseMoving];
        _display displayRemoveEventHandler ["MouseButtonUp", _mouseButtonUp];

        // LBDrop triggers after MouseButtonUp, so delay by one frame
        [{
            params ["_display"];
            ctrlDelete (_display displayCtrl IDC_DROP_CATCHER);
        }, _this] call CBA_fnc_execNextFrame;

        private _primarySlot = _display displayCtrl IDC_PRIMARY_SLOT;
        _primarySlot ctrlSetFade 0;
        _primarySlot ctrlCommit 0;
        private _primaryBG = _display displayCtrl IDC_PRIMARY_BG;
        _primaryBG ctrlSetText "";

        // Inventory has some delay, timeout in case player didn't actually drop weapon somewhere
        [{
            secondaryWeapon ACE_player != QGVAR(weapon)
        }, {
            [false] call FUNC(onDropWOB);
        }, [], 5] call CBA_fnc_waitUntilAndExecute;
    }]
];

_display setVariable [QGVAR(dragImage), _dragImage];
_display setVariable [QGVAR(dragWOBEHs), _eventHandlers];
