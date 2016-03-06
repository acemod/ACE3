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
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];
private ["_mouseOver", "_unit"];

if !(_activated && local _logic) exitWith {};

if !(["ACE_Medical"] call EFUNC(common,isModLoaded)) then {
    [LSTRING(RequiresAddon)] call EFUNC(common,displayTextStructured);
} else {
    _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call EFUNC(common,displayTextStructured);
    } else {
        _unit = (_mouseOver select 1);

        if (_unit isKindOf "Man" || {!(_unit isKindOf "Building")}) then {
            [LSTRING(OnlyStructures)] call EFUNC(common,displayTextStructured);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call EFUNC(common,displayTextStructured);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call EFUNC(common,displayTextStructured);
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
