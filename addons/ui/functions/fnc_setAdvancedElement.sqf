/*
 * Author: Jonpas
 * Sets advanced visible element of the UI using displays and controls.
 *
 * Arguments:
 * 0: Element IDD <NUMBER>
 * 1: Element IDCs <ARRAY>
 * 2: Show/Hide Element OR Element ACE Settings Variable <BOOL/STRING>
 * 3: Force change even when disallowed <BOOL> (default: false)
 *
 * Return Value:
 * Successfully Set <BOOL>
 *
 * Example:
 * [303, [188], true, false] call ace_ui_fnc_setAdvancedElement
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_idd", "_elements", "_show", ["_force", false, [true]] ];

if (_elementInfo in GVAR(elementsSet)) exitWith {};

if (!_force && {!GVAR(allowSelectiveUI)}) exitWith {
    [LSTRING(Disallowed), 2] call EFUNC(common,displayTextStructured)
};

// Get show/hide boolean from mission namespace if it's a string
if (typeName _show == "STRING") then {
    _show = missionNamespace getVariable _show;
};
_show = [1, 0] select _show;

// Disable/Enable elements
private _success = false;
{
    private _idc = _x;

    // Loop through IGUI displays as they can be present several times for some reason
    {
        if (_idd == ctrlIDD _x) then {
            TRACE_3("Setting Element Visibility",_show,_idd,_idc);

            (_x displayCtrl _idc) ctrlSetFade _show;
            (_x displayCtrl _idc) ctrlCommit 0;

            _success = true;
        };
    } forEach (uiNamespace getVariable "IGUI_displays");
} forEach _elements;

_success
