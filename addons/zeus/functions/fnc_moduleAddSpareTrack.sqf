/*
 * Author: Jonpas
 * Adds a Spare Track to the vehicle.
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
    [LSTRING(RequiresAddon)] call EFUNC(common,displayTextStructured);
} else {
    (GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""])) params ["_mouseOverType", "_mouseOverUnit"];

    if (_mouseOverType != "OBJECT") then {
        [LSTRING(NothingSelected)] call EFUNC(common,displayTextStructured);
    } else {
        if !(alive _mouseOverUnit) then {
            [LSTRING(OnlyAlive)] call EFUNC(common,displayTextStructured);
        } else {
            if (getNumber (configFile >> "CfgVehicles" >> "ACE_Track" >> QEGVAR(cargo,size)) > [_mouseOverUnit] call EFUNC(cargo,getCargoSpaceLeft)) then {
                [LSTRING(OnlyEnoughCargoSpace)] call EFUNC(common,displayTextStructured);
            } else {
                ["AddCargoByClass", ["ACE_Track", _mouseOverUnit, 1, true]] call EFUNC(common,localEvent);
            };
        };
    };
};

deleteVehicle _logic;
