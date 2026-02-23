#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets advanced visible element of the UI using displays and controls.
 *
 * Arguments:
 * 0: Element Name <STRING>
 * 1: Show/Hide Element <BOOL>
 * 2: Show Hint <BOOL> (default: false)
 * 3: Force change even when disallowed <BOOL> (default: false)
 *
 * Return Value:
 * Successfully Set <BOOL>
 *
 * Example:
 * _successfullySet = ["ammoCount", true, false] call ace_ui_fnc_setAdvancedElement
 *
 * Public: No
 */

params ["_element", "_show", ["_showHint", false, [true]], ["_force", false, [true]]];

_element = toLowerANSI _element;

private _cachedElement = GVAR(configCache) get _element;
if (isNil "_cachedElement") exitWith {TRACE_1("nil element",_this); false };

if (!_force && {!GVAR(allowSelectiveUI)}) exitWith {
    TRACE_1("not allowed",_this);
    [LSTRING(Disallowed), 2] call EFUNC(common,displayTextStructured);
    false
};

_cachedElement params ["_idd", "_elements", "_location", "_conditions"];

// Exit if main vehicle type condition not fitting
private _canUseWeaponOrInCargo = ACE_player call CBA_fnc_canUseWeapon || {-1 < vehicle ACE_player getCargoIndex ACE_player};
private _inUAVCamera = !isNull getConnectedUAVUnit player; // explictly using player
if (
    (_canUseWeaponOrInCargo && {!_inUAVCamera} && {_location == VEHICLE_ONLY})
    || {(!_canUseWeaponOrInCargo || {_inUAVCamera}) && {_location == GROUND_ONLY}}
) exitWith {
    TRACE_3("skip location",_this,_canUseWeaponOrInCargo,_location);
    false
};

// Get setting from config API
{
    if (!call (_x select 0)) exitWith {
        // Display and print info which component forced the element except for default vehicle check
        if (_showHint) then {
            [LSTRING(Disabled), 2] call EFUNC(common,displayTextStructured);
            INFO_2("Attempted modification of a forced User Interface element '%1' by '%2'.",_element,_x select 1);
        };
        _show = false;
    };
} forEach _conditions;

// Get setting from scripted API
if (!_force) then {
    private _setElement = GVAR(elementsSet) get _element;
    if (!isNil "_setElement") then {
        _setElement params ["_sourceSet", "_showSet"];
        if (_showHint) then {
            [LSTRING(Disabled), 2] call EFUNC(common,displayTextStructured);
            INFO_2("Attempted modification of a forced User Interface element '%1' by '%2'.",_element,_sourceSet);
        };
        _show = _showSet;
    };
};

private _displays = ((uiNamespace getVariable "IGUI_displays") + [findDisplay IDD_MISSION]) select {_idd == ctrlIDD _x};
private _fade = parseNumber !_show;

// Disable/Enable elements
private _success = false;
{
    private _idc = _x;

    // Loop through IGUI displays as they can be present several times for some reason
    {
        _success = true;

        private _control = _x displayCtrl _idc;
        if (ctrlFade _control == _fade) then {continue};

        TRACE_4("Setting Element Visibility",_element,_fade,_idd,_idc);

        _control ctrlSetFade _fade;
        _control ctrlCommit 0;
    } forEach _displays;
} forEach _elements;

_success
