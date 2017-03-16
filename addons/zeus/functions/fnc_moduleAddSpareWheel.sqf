/*
 * Author: Jonpas
 * Adds a Spare Wheel to the vehicle.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

if !(["ace_cargo"] call EFUNC(common,isModLoaded) && ["ace_repair"] call EFUNC(common,isModLoaded)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    (GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""])) params ["_mouseOverType", "_mouseOverUnit"];

    if (_mouseOverType != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        if !(alive _mouseOverUnit) then {
            [LSTRING(OnlyAlive)] call FUNC(showMessage);
        } else {
            if (getNumber (configFile >> "CfgVehicles" >> "ACE_Wheel" >> QEGVAR(cargo,size)) > [_mouseOverUnit] call EFUNC(cargo,getCargoSpaceLeft)) then {
                [LSTRING(OnlyEnoughCargoSpace)] call FUNC(showMessage);
            } else {
                ["ace_addCargo", ["ACE_Wheel", _mouseOverUnit, 1, true]] call CBA_fnc_localEvent;
            };
        };
    };
};

deleteVehicle _logic;
