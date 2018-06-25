#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Flips the surrender state of the unit the module is placed on.
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
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleSurrender
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

if (isNil QEFUNC(captives,setSurrendered)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    private _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        private _unit = effectivecommander (_mouseOver select 1);

        if !(_unit isKindOf "CAManBase") then {
            [LSTRING(OnlyInfantry)] call FUNC(showMessage);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call FUNC(showMessage);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call FUNC(showMessage);
                } else {
                    private _surrendering = GETVAR(_unit,EGVAR(captives,isSurrendering),false);
                    // Event initalized by ACE_Captives
                    [QEGVAR(captives,setSurrendered), [_unit, !_surrendering], _unit] call CBA_fnc_targetEvent;
                };
            };
        };
    };
};

deleteVehicle _logic;
