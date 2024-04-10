#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Initializes the "Spectator" Zeus module display.
 *
 * Arguments:
 * 0: spectator controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_spectator
 *
 * Public: No
 */

#define SIDE_IDCs [92540, 92541, 92542, 92543]
#define CAMERA_IDCs [92550, 92551, 92552]
#define VISION_IDCs [92558, 92559, 92560, 92561]

params ["_control"];

private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Validate module target
private _unit = attachedTo _logic;
TRACE_1("Unit",_unit);

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    _display closeDisplay 0;
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

switch (false) do {
    case (["ace_spectator"] call EFUNC(common,isModLoaded)): {
        [LSTRING(RequiresAddon)] call _fnc_errorAndClose;
    };
    case (!isNull _unit): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
    };
    case (alive _unit): {
        [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
    };
    case ([_unit, true] call EFUNC(common,isPlayer)): {
        [LSTRING(OnlyPlayers)] call _fnc_errorAndClose;
    };
};

// Specific onLoad stuff
private _side = side _unit;

// Spectate sides
private _fnc_onSideSelection = {
    params ["_ctrl"];

    private _display = ctrlParent _ctrl;
    if (isNull _display) exitWith {};

    private _color = _ctrl getVariable "color";
    private _scale = 1;

    private _sides = _display getVariable [QGVAR(spectateSides), []];
    private _selectedSide = (ctrlIDC _ctrl) - 92540;

    // Add or remove from spectatable sides and update color and scale
    if (_selectedSide in _sides) then {
        _display setVariable [QGVAR(spectateSides), _sides - [_selectedSide]];
        _color set [3, 0.5];
    } else {
        _display setVariable [QGVAR(spectateSides), _sides + [_selectedSide]];
        _color set [3, 1];
        _scale = 1.2;
    };

    _ctrl ctrlSetTextColor _color;
    [_ctrl, _scale, 0.1] call BIS_fnc_ctrlSetScale;
};

// Use the unit's side as default
private _activeSide = [east, west, independent, civilian] find _side;

// Handle sides other than default four (sideEnemy)
if (_activeSide != -1) then {
    _display setVariable [QGVAR(spectateSides), [_activeSide]];
};

{
    private _ctrl = _display displayCtrl _x;
    private _side = _x - 92540;
    private _color = [_side] call BIS_fnc_sideColor;
    _ctrl setVariable ["color", _color];
    _ctrl ctrlSetActiveColor _color;
    _color set [3, 0.5];

    if (_side == _activeSide) then {
        [_ctrl, 1.2, 0] call BIS_fnc_ctrlSetScale;
        _color set [3, 1];
    };

    _ctrl ctrlSetTextColor _color;

    _ctrl ctrlAddEventHandler ["ButtonClick", _fnc_onSideSelection];
} forEach SIDE_IDCs;

// Camera modes
private _fnc_onModesSelection = {
    params ["_ctrl"];

    private _display = ctrlParent _ctrl;
    if (isNull _display) exitWith {};

    private _color = [1, 1, 1, 0.5];
    private _scale = 1;

    private _modes = _display getVariable [QGVAR(cameraModes), []];
    private _selectedMode = (ctrlIDC _ctrl) - 92550;

    // Add or remove from camera modes and update color and scale
    if (_selectedMode in _modes) then {
        _display setVariable [QGVAR(cameraModes), _modes - [_selectedMode]];
    } else {
        _display setVariable [QGVAR(cameraModes), _modes + [_selectedMode]];
        _color set [3, 1];
        _scale = 1.2;
    };

    _ctrl ctrlSetTextColor _color;
    [_ctrl, _scale, 0.1] call BIS_fnc_ctrlSetScale;
};

// Use setting as default since global variable will change
private _availableModes = [[0, 1, 2], [1, 2], [0], [1], [2]] select EGVAR(spectator,restrictModes);
_display setVariable [QGVAR(cameraModes), _availableModes];

{
    private _ctrl = _display displayCtrl _x;
    private _color = [1, 1, 1, 0.5];

    if ((_x - 92550) in _availableModes) then {
        [_ctrl, 1.2, 0] call BIS_fnc_ctrlSetScale;
        _color set [3, 1];
    };

    _ctrl ctrlSetTextColor _color;

    _ctrl ctrlAddEventHandler ["ButtonClick", _fnc_onModesSelection];
} forEach CAMERA_IDCs;

// Vision Modes
private _fnc_onVisionSelection = {
    params ["_ctrl", "_state"];

    private _display = ctrlParent _ctrl;
    if (isNull _display) exitwith {};

    // Convert to boolean since EH returns state as 0 or 1
    private _state = [false, true] select _state;

    private _visions = _display getVariable [QGVAR(visionModes), []];
    private _selectedVision = (ctrlIDC _ctrl) - 92560;

    // Add or remove from vision modes
    if (_state) then {
        _display setVariable [QGVAR(visionModes), _visions + [_selectedVision]];
    } else {
        _display setVariable [QGVAR(visionModes), _visions - [_selectedVision]];
    };

    // Handle all checked/unchecked
    private _allCheckboxes = VISION_IDCs apply {cbChecked (_display displayCtrl _x)};

    if (_allCheckboxes isEqualTo [_state, _state, _state, _state]) then {
        (_display displayCtrl 92557) cbSetChecked _state;
    };
};

// Use setting as default since global variable will change
private _availableVisions = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select EGVAR(spectator,restrictVisions);
_display setVariable [QGVAR(visionModes), _availableVisions];

{
    private _ctrl = _display displayCtrl _x;

    if ((_x - 92560) in _availableVisions) then {
        _ctrl cbSetChecked true;
    };

    _ctrl ctrlAddEventHandler ["CheckedChanged", _fnc_onVisionSelection];
} forEach VISION_IDCs;

// Init all visions checkbox
private _fnc_onVisionsAll = {
    params ["_ctrl", "_state"];

    private _display = ctrlParent _ctrl;
    if (isNull _display) exitWith {};

    // Convert to boolean since EH returns state as 0 or 1
    _state = _state == 1;

    // Set state of all checkboxes
    {
        (_display displayCtrl _x) cbSetChecked _state;
    } forEach VISION_IDCs;

    // Store new visions mode setting
    private _setting = [[], [-2, -1, 0, 1]] select _state;
    _display setVariable [QGVAR(visionModes), _setting];
};

private _allCheckbox = _display displayCtrl 92557;

// Set to checked by default if setting is all vision modes
if (_availableVisions isEqualTo [-2, -1, 0, 1]) then {
    _allCheckbox cbSetChecked true;
};

_allCheckbox ctrlAddEventHandler ["CheckedChanged", _fnc_onVisionsAll];

// Confirm and Cancel
private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (isNull _logic) exitWith {};

    private _unit = attachedTo _logic;
    if (isNull _unit) exitWith {};

    private _force = lbCurSel (_display displayCtrl 92531) > 0;
    private _hide = lbCurSel (_display displayCtrl 92532) > 0;
    private _sides = (_display getVariable [QGVAR(spectateSides), []]) apply {_x call BIS_fnc_sideType};
    private _modes = _display getVariable [QGVAR(cameraModes), []];
    private _visions = _display getVariable [QGVAR(visionModes), []];

    [QGVAR(moduleSpectator), [_force, _hide, _sides, _modes, _visions], _unit] call CBA_fnc_targetEvent;

    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
