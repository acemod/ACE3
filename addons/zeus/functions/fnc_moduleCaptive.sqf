/*
 * Author: SilentSpike
 * Flips the capture state of the unit the module is placed on.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleCaptive
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];
private ["_mouseOver", "_unit", "_captive"];

if !(_activated && local _logic) exitWith {};

if (isNil QEFUNC(captives,setHandcuffed)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        _unit = effectivecommander (_mouseOver select 1);

        if !(_unit isKindOf "CAManBase") then {
            [LSTRING(OnlyInfantry)] call FUNC(showMessage);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call FUNC(showMessage);
            } else {
                _captive = GETVAR(_unit,EGVAR(captives,isHandcuffed),false);
                // Event initalized by ACE_Captives
                [QEGVAR(captives,setHandcuffed), [_unit, !_captive], _unit] call CBA_fnc_targetEvent;
            };
        };
    };
};

deleteVehicle _logic;
