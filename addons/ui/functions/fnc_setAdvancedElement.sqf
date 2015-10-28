/*
 * Author: Jonpas
 * Sets advanced visible element of the UI using displays and controls.
 *
 * Arguments:
 * 0: Show/Hide Element OR Element Variable <BOOL/STRING>
 * 1: Element IDD <NUMBER>
 * 2: Element IDCs <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [show, 303, [188] ] call ace_ui_fnc_setAdvancedElement
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_show", "_idd", "_elements"];


// Get show/hide boolean from mission namespace if it's a string
if (typeName _show == "STRING") then {
    _show = missionNamespace getVariable _show;
};
_show = [1, 0] select _show;


// Disable/Enable elements
{
    local _idc = _x;

    // Loop through IGUI displays as they can be present several times for some reason
    {
        if (_idd == ctrlIDD _x) then {
            TRACE_3("Setting Element Visibility",_show,_idd,_idc);

            (_x displayCtrl _idc) ctrlSetFade _show;
            (_x displayCtrl _idc) ctrlCommit 0;
        };
    } forEach (uiNamespace getVariable "IGUI_displays");
} forEach _elements;
