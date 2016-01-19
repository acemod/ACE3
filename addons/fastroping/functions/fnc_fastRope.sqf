/*
 * Author: KoffeinFlummi
 *
 * Starts fast roping for a certain unit
 *
 * Arguments:
 * 0: Unit
 * 1: Helicopter
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

#define ROPELENGTH 35

_unit = _this select 0;
_vehicle = _this select 1;

_ropes = _vehicle getVariable QGVAR(ropes);
_occupied = _vehicle getVariable QGVAR(ropesOccupied);

_index = _occupied find False;

_occupied set [_index, True];
_vehicle setVariable [QGVAR(ropesOccupied), _occupied, True];

_rope = _ropes select _index;
_rope1 = _rope select 0;
_rope2 = _rope select 1;
_helper = _rope select 2;
_unit disableCollisionWith _helper;

// @todo
[time, _unit, _vehicle, _index, _rope, _index] spawn {
    _time = _this select 0;
    _unit = _this select 1;
    _vehicle = _this select 2;
    _index = _this select 3;
    _rope = _this select 4;
    _index = _this select 5;

    _rope1 = _rope select 0;
    _rope2 = _rope select 1;
    _helper = _rope select 2;

    _unit allowDamage False;
    moveOut _unit;
    waitUntil {vehicle _unit == _unit};

    _helper setVectorUp [0,0,1];
    _unit attachTo [_helper, [0,0,0]];

    _vector = (getPos _unit) vectorFromTo (getPos _vehicle);
    _unit setVectorDir _vector;

    [[_rope1, _rope2], "{ropeUnwind [_this select 0, 6, 35];ropeUnwind [_this select 1, 6, 0];}", _helper] call EFUNC(common,execRemoteFnc);

    sleep 0.1;
    _unit allowDamage True;
    [_unit, "AGM_FastRoping", 2] call EFUNC(common,doAnimation);

    waitUntil {
        ([_unit] + ([[_helper] call EFUNC(common,getPitchBankYaw), {_this * -1}] call EFUNC(common,map))) call EFUNC(common,setPitchBankYaw);
        _time + 1 < time and ((getPos _helper select 2) < 1 or (time >= (_time + ROPELENGTH / 6)) or (vectorMagnitude (velocity _vehicle) > 5))
    };

    _unit allowDamage False;
    _unit spawn {
        sleep 0.5;
        _this allowDamage True;
    };

    detach _unit;
    [_unit, "", 2] call EFUNC(common,doAnimation);
    _unit setVectorUp [0,0,1];

    // delete and recreate rope
    {deleteVehicle _x;} forEach _rope;
    _ropePositions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(positions));
    _pos = _ropePositions select _index;
    [
        [_vehicle, _pos, _index],
        "{_ropes = (_this select 0) getVariable 'AGM_Ropes';_ropes set [(_this select 2), [(_this select 0), (_this select 1), True] call AGM_FastRoping_fnc_createRope];(_this select 0) setVariable ['AGM_Ropes', _ropes, True];}",
        _vehicle
    ] call EFUNC(common,execRemoteFnc);

    // free rope for next unit
    _occupied = _vehicle getVariable QGVAR(ropesOccupied);
    _occupied set [_index, False];
    _vehicle setVariable [QGVAR(ropesOccupied), _occupied, True];
};
