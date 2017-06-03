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
                // TODO FIX _XPOS MATH
                //private _xPos = (getPos _xObject) vectorDiff (getPos _attachToVehicle); //worldToModel [0,0,0]; (_obj modelToWorld [0,0,0]) vectorDiff (getPos player)
                //private _xPos = _attachToVehicle worldToModel//(_xObject modelToWorldVisual [0,0,0]) vectorDiff (_attachToVehicle modelToWorldVisual [0,0,0]);//(_xObject modelToWorld [0,0,0]) vectorDiff (getPos _attachToVehicle);
                private _position = getPosATL _xObject;
                private _positionChange =  _position vectorDiff (getPosATL _xObject);
                private _selectionPosition = _attachToVehicle worldToModel (ASLtoAGL getPosWorld _xObject);
                _selectionPosition = _selectionPosition vectorAdd _positionChange;


                systemChat format["xpos: %1, change: %2", _selectionPosition, _positionChange];
                _xObject setPos ((getPos _attachToVehicle) vectorAdd [0, 0, -1000]);
                // Delete attached item after 0.5 seconds
                [{deleteVehicle (_this select 0)}, [_xObject], 2] call CBA_fnc_waitAndExecute;
                _attachedList deleteAt _forEachIndex;

                //Create new item
                private _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
                private _attachedObject = _itemVehClass createVehicle [0,0,0];
                systemChat format["Add more: %1", _attachedObject];
                // Delete the variable
                if (_attachToVehicle == _unit) then {
                    _attachedObject attachTo [_attachToVehicle, _selectionPosition, "leftshoulder"];

                } else {
                    _attachedObject attachTo [_attachToVehicle, _selectionPosition];
                    systemChat "vehicle";
                };

                private _newList = _attachToVehicle getVariable [QGVAR(attached), []];
                _newList pushBack [_attachedObject, _itemClassname];
                _attachToVehicle setVariable [QGVAR(attached), _newList, true];

            };
        } forEach _attachedList;

    }, [_attachToVehicle, _unit, _itemClassname], _lifeTime] call CBA_fnc_waitAndExecute;
};
