/*
 * Author: Phyma
 * Remove a item of the unit when it is about to die
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: unit doing the attach (player) <OBJECT>
 * 2: classname of the item you want to remove <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, bob, "light"] call ace_attach_fnc_removeItemEvent;
 *
 * Public: No
 */

#include "script_component.hpp"

#define LIFETIMEOFFSET 5

params ["_attachToVehicle", "_unit", "_itemClassname"];

private _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
private _timeLive = getNumber (configfile >> "CfgAmmo" >> _itemVehClass >> "timeToLive");
if (0 < _timeLive && _timeLive < 1500) then {
    //Make sure we remove  it before it is consumed
    private _lifeTime = _timeLive - LIFETIMEOFFSET;

    [{
        params ["_unit", "_attachToVehicle", "_itemClassname"];
        private _attachedList = _attachToVehicle getVariable [QGVAR(attached), []];

        {
            _x params ["_xObject", "_xItemName"];
            if (_xItemName == _itemClassname) then {
                detach _xObject;
                _xObject setPos ((getPos _unit) vectorAdd [0, 0, -1000]);
                // Delete attached item after 0.5 seconds
                [{deleteVehicle (_this select 0)}, [_xObject], 2] call CBA_fnc_waitAndExecute;
            };

        } forEach _attachedList;

    }, [_unit, _attachToVehicle, _itemClassname], _lifeTime] call CBA_fnc_waitAndExecute;
};
