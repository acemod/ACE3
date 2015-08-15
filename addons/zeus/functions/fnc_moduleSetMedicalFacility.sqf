/*
 * Author: SilentSpike, Glowbal
 * Assigns a medic role from the medical module to a unit
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * ReturnValue:
 * nil
 *
 * Public: no
 */

#include "script_component.hpp"

private ["_mouseOver", "_unit"];

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

if (isNil QEFUNC(captives,setSurrendered)) then {
    [LSTRING(RequiresAddon)] call EFUNC(common,displayTextStructured);
} else {
    _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call EFUNC(common,displayTextStructured);
    } else {
        _unit = (_mouseOver select 1);

        if (_unit isKindOf "CAManBase") then {
            [LSTRING(NoMan)] call EFUNC(common,displayTextStructured);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call EFUNC(common,displayTextStructured);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call EFUNC(common,displayTextStructured);
                } else {
                    if (!(GETVAR(_unit,EGVAR(medical,isMedicalFacility),false))) then {
                        _unit setvariable [QEGVAR(medical,isMedicalFacility), true, true];
                    };
                };
            };
        };
    };
};

deleteVehicle _logic;
