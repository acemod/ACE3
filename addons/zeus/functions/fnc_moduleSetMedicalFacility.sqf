/*
 * Author: SilentSpike, Glowbal
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
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleSetMedicalFacility
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if !(local _logic) exitWith {};

if !(["ACE_Medical"] call EFUNC(common,isModLoaded)) then {
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
                    if (!(GETVAR(_unit,EGVAR(medical,isMedicalFacility),false))) then {
                        _unit setVariable [QEGVAR(medical,isMedicalFacility), true, true];
                    };
                };
            };
        };
    };
};

deleteVehicle _logic;
