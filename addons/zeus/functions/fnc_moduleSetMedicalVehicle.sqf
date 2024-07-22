#include "..\script_component.hpp"
/*
 * Author: kymckay, Glowbal
 * Assigns a medic role from the medical module to a unit
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
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleSetMedicalVehicle
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

if !(GETEGVAR(medical,enabled,false)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    private _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        private _unit = (_mouseOver select 1);

        if (_unit isKindOf "Man" || {_unit isKindOf "Building"}) then {
            [LSTRING(OnlyVehicles)] call FUNC(showMessage);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call FUNC(showMessage);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call FUNC(showMessage);
                } else {
                    private _medicN = GETVAR(_unit,EGVAR(medical,isMedicalVehicle),false);
                    if !(_medicN) then {
                        _unit setVariable [QEGVAR(medical,isMedicalVehicle), true, true];
                    };
                };
            };
        };
    };
};

deleteVehicle _logic;
