#include "script_component.hpp"
/*
 * Author: mharis001
 * Assigns object as repair facility.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleSetRepairFacility
 *
 * Public: No
 */

 params ["_logic"];

 if !(local _logic) exitWith {};

if !(["ace_repair"] call EFUNC(common,isModLoaded)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    private _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        private _unit = (_mouseOver select 1);

        if (_unit isKindOf "Man" || {!(_unit isKindOf "Building")}) then {
            [LSTRING(OnlyStructures)] call FUNC(showMessage);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call FUNC(showMessage);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call FUNC(showMessage);
                } else {
                    if ((_unit getVariable ["ACE_isRepairFacility", 0]) < 1) then {
                        _unit setVariable ["ACE_isRepairFacility", 1, true];
                    };
                };
            };
        };
    };
};

deleteVehicle _logic;
