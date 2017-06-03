/*
 * Author: Phyma
 * Remove a item of the unit when it is about to die
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: unit doing the attach (player) <OBJECT>
 * 2: classname of the item you want to remove <STRING>
 * 3: Position to be placed <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, bob, "light", [0, 0, 0]] call ace_attach_fnc_removeItemEvent;
 *
 * Public: No
 */

#include "script_component.hpp"

#define LIFETIMEOFFSET 5

params ["_attachToVehicle", "_unit", "_itemClassname", "_position"];

private _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
private _timeLive = getNumber (configfile >> "CfgAmmo" >> _itemVehClass >> "timeToLive");

if (0 < _timeLive && _timeLive < 1500) then {
    //Make sure we remove  it before it is consumed
    _timeLive = _timeLive - LIFETIMEOFFSET;

    [{
        params ["_args", "_handle"];
        _args params ["_unit", "_attachToVehicle", "_itemClassname", "_position"];
        private _attachedList = _attachToVehicle getVariable [QGVAR(attached), []];
        private _newList = _attachedList;
        systemChat "Works";
        {
            _x params ["_xObject", "_xItemName"];
            if (_xItemName == _itemClassname) then {

                detach _xObject;

                // Delete attached item after 0.5 seconds
                _xObject setPos ((getPos _attachToVehicle) vectorAdd [0, 0, -1000]);
                [{deleteVehicle (_this select 0)}, [_xObject], 2] call CBA_fnc_waitAndExecute;
                _newList deleteAt _forEachIndex;

                // Create new item
                private _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
                private _attachedObject = _itemVehClass createVehicle (getPos _attachToVehicle);

                if (_attachToVehicle == _unit) then {
                    _attachedObject = _itemVehClass createVehicle [0, 0, 0];
                    _attachedObject attachTo [_attachToVehicle, _position, "leftshoulder"];
                } else {
                    _attachedObject = _itemVehClass createVehicle (getPos _attachToVehicle);
                    _attachedObject attachTo [_attachToVehicle, _position];
                };
                // Add it to the list
                _newList pushBack [_attachedObject, _itemClassname];
            };
        } forEach _attachedList;

        // Refresh the finished list
        _attachToVehicle setVariable [QGVAR(attached), _newList, true];

    }, _timeLive, [_attachToVehicle, _unit, _itemClassname, _position]] call CBA_fnc_addPerFrameHandler;
};
