/*
 * Author: Jonpas
 * Sets advanced visible element of the UI using displays and controls.
 *
 * Arguments:
 * 0: Element Name <STRING>
 * 1: Show/Hide Element <BOOL>
 * 2: Force change even when disallowed <BOOL> (default: false)
 *
 * Return Value:
 * Successfully Set <BOOL>
 *
 * Example:
 * ["ace_ui_ammoCount", true, false] call ace_ui_fnc_setAdvancedElement
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_element", "_show", ["_force", false, [true]] ];

if (!_force && {!GVAR(allowSelectiveUI)}) exitWith {
    [LSTRING(Disallowed), 2] call EFUNC(common,displayTextStructured);
};

private _elementInfo = ELEMENTS_ADVANCED select {_x select 3 == _element};
(_elementInfo select 0) params ["_idd", "_elements", "_selectiveType"];

private _inVehicle = ACE_player != vehicle ACE_player;
TRACE_2("Type",_inVehicle,_selectiveType);

// Exit if selective type not applicable to current vehicle
if ((_inVehicle && {_selectiveType == 1}) || (!_inVehicle && {_selectiveType == 2})) exitWith {};

// Get show/hide boolean from a set element if set via API
// Inversion only needed if inverted, otherwise parameter can be used directly as it is the same
if ([_element, !_show] in GVAR(elementsSet)) then {
    _show = !_show;
};

_show = [1, 0] select _show;

// Disable/Enable elements
private _success = false;
{
    private _idc = _x;

    // Loop through IGUI displays as they can be present several times for some reason
    {
        if (_idd == ctrlIDD _x) then {
            //TRACE_3("Setting Element Visibility",_show,_idd,_idc);

            (_x displayCtrl _idc) ctrlSetFade _show;
            (_x displayCtrl _idc) ctrlCommit 0;

            _success = true;
        };
    } forEach (uiNamespace getVariable "IGUI_displays");
} forEach _elements;

_success
