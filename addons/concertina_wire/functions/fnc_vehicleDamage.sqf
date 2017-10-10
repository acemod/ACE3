/*
 * Author: Rocko
 * Handles vehicle damage from hitting wire
 *
 * Arguments:
 * 0: wire <OBJECT>
 * 1: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [wire, car] call ace_concertina_wire_fnc_vehicleDamage
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_wire", "_vehicle"];

private _type = typeOf _wire;
private _mode = switch (_type) do {
case "ACE_ConcertinaWire": { 0 };
case "Land_Razorwire_F": { 1 };
    default { -1 };
};

if (_mode == -1) exitWith {};

// _mode = 0 = Single Coil
// _mode = 1 = Triple Coil

// --------------------------------
// L              M               R
//                                4.54929 (4)
//              6.13564 (6)
//9.78744 (10)

_type = typeOf _wire;
private _anim = _wire animationPhase "wire_2";
private _pos_w = getPos _wire;
private _dir_w = getDir _wire;

if (_mode == 0) then {
    private _found = false;
    _pos_w params ["_x","_y"];

    // Check if two Single coils are placed next to each other (i.e playes have built a big wire obstacle)
    private _wireCheckPosAr = [
    [_x + (sin (_dir_w + 90) * 1.5),_y + (cos (_dir_w + 90) * 1.5)],
    [(_x-(sin _dir_w)) + (sin (_dir_w + 90) * 1.5),(_y-(cos _dir_w)) + (cos (_dir_w + 90) * 1.5)],
    [_x + (sin (_dir_w - 90) * 1.5),_y + (cos (_dir_w - 90) * 1.5)],
    [(_x-(sin _dir_w)) + (sin (_dir_w - 90) * 1.5),(_y-(cos _dir_w)) + (cos (_dir_w - 90) * 1.5)]
    ];
    {
        _found = false;
        private _no = nearestObjects [_x, [typeOf _wire], 3];     //diag_log _no; diag_log ".....";
        _no = _no - [_wire];                            //diag_log _no;
        if (count _no > 0) exitWith {
            _found = true;                                //diag_log "found";
        };
    } forEach _wireCheckPosAr;
    // Double coil found!
    if (_found) then {
        _mode = 1;
    } else {
        // Randomly make a single coil also catch tanks, if speed is high
        if (_vehicle isKindOf "Tank" && {20 > random 100} && {speed _vehicle > 30}) then {
            _mode = 1;
        } else {
            if !(_vehicle isKindOf "Tank") then {
                _mode = 1;
            };
        };
    };
};

private _parts = [];

if (_mode == 1) then {
    switch (true) do {
    case (_vehicle isKindOf "Tank"): {
            _parts = ["ltrack","rtrack"];
        };
    case (_vehicle isKindOf "Wheeled_APC" || {_vehicle isKindOf "Car"}): {
            _parts = ["lfwheel","lf2wheel","lmwheel","lbwheel","rfwheel","rf2wheel","rmwheel","rbwheel"];
        };
    };
} else {
    switch (true) do {
    case (_vehicle isKindOf "Wheeled_APC" || {_vehicle isKindOf "Car"}): {
            _parts = ["lfwheel","lf2wheel","lmwheel","lbwheel","rfwheel","rf2wheel","rmwheel","rbwheel"];
        };
    };
};

if (canMove _vehicle) then {
    {
        private _selectionPart = "hit" + _x;
        if (isText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "hitpoints" >> _selectionPart >> "name")) then {
            private _selection = getText(configFile >> "CfgVehicles" >> typeOf _vehicle  >> "hitpoints" >> _selectionPart >> "name");
            // TODO: Only the tires that have touched the wire should burst.
            _vehicle setHit [_selection, 1];
        };
    } forEach _parts;
};

if (_mode == 1) then {
    if (_vehicle isKindOf "StaticWeapon") exitWith {};
    [{
        params ["_vehicle", "_wire"];

        _vehicle setVelocity ((velocity _vehicle) vectorMultiply 0.75);

        // Set vehicle back in front of wire, since the wire will make the vehicle jump, and a wire with no geometry lod is undestructible and not recognizeable
        private _vPos = getPosASL _vehicle;
        private _vDir = getDir _vehicle;
        _vehicle setPosASL (_vPos vectorAdd [-0.35 * sin(_vDir), -0.35 * cos(_vDir), 0]);
        // TODO: Needs to be placed in safe distance to wire, so we do not constantly re - spawn new wires
    }, [_vehicle, _wire], 0.1] call CBA_fnc_waitAndExecute;
};

//TODO: Create broken geoless wire (two version)
//TODO: Make wire remains stop vehicles
