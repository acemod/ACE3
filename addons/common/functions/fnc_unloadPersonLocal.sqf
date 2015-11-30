/*
 * Author: ViperMaul
 * Unload a person from a vehicle, local
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Returns true if succesfully unloaded person <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

#define GROUP_SWITCH_ID QUOTE(FUNC(loadPerson))

params ["_unit", "_vehicle"];

private ["_validVehiclestate", "_emptyPos", "_loaded"];

_validVehiclestate = true;

if (_vehicle isKindOf "Ship") then {
    if (speed _vehicle > 1 || {getPos _vehicle select 2 > 2}) then {
        _validVehiclestate = false;
    };

    TRACE_1("SHIP Ground Check",getPos _vehicle);

    _emptyPos = (ASLToAGL getPosASL _vehicle) findEmptyPosition [0, 13, typeof _unit]; // TODO: if spot is underwater pick another spot.
} else {
    if (_vehicle isKindOf "Air") then {
        if (speed _vehicle > 1 || {isTouchingGround _vehicle}) then {
            _validVehiclestate = false;
        };

        TRACE_1("Vehicle Ground Check",isTouchingGround _vehicle);

        _emptyPos = ASLToAGL getPosASL _vehicle;
        _emptyPos = _emptyPos vectorAdd [random 10 - 5, random 10 - 5, 0];
    } else {
        if (speed _vehicle > 1 || {getPos _vehicle select 2 > 2})  then {
            _validVehiclestate = false;
        };

        TRACE_1("Vehicle Ground Check", isTouchingGround _vehicle);

        _emptyPos = (ASLToAGL getPosASL _vehicle) findEmptyPosition [0, 13, typeof _unit];
    };
};

TRACE_1("getPosASL Vehicle Check", getPosASL _vehicle);

if !(_validVehiclestate) exitWith {
    ACE_LOGWARNING_4("Unable to unload patient because invalid (%1) vehicle state. Either moving or Not close enough on the ground. position: %2 isTouchingGround: %3 Speed: %4",_vehicle,getPos _vehicle,isTouchingGround _vehicle,speed _vehicle);
    false
};

if (count _emptyPos == 0) exitWith {
    ACE_LOGWARNING_1("No safe empty spots to unload patient. %1",_emptyPos);
    false
};  //consider displaying text saying there are no safe places to exit the vehicle

unassignVehicle _unit;
[_unit] orderGetIn false;

TRACE_1("Ejecting", alive _unit);

_unit action ["Eject", vehicle _unit];

[{
    params ["_unit", "_emptyPos"];

    _unit setPosASL AGLToASL _emptyPos;

    if !([_unit] call FUNC(isAwake)) then {
        TRACE_1("Check if isAwake", [_unit] call FUNC(isAwake));

        if (driver _unit == _unit) then {
            private "_anim";
            _anim = [_unit] call FUNC(getDeathAnim);

            [_unit, _anim, 1, true] call FUNC(doAnimation);

            [{
                _unit = _this select 0;
                _anim = _this select 1;
                if ((_unit getVariable "ACE_isUnconscious") and (animationState _unit != _anim)) then {
                    [_unit, _anim, 2, true] call FUNC(doAnimation);
                };
            }, [_unit, _anim], 0.5, 0] call FUNC(waitAndExecute);
        };
    };
}, [_unit, _emptyPos], 0.5, 0] call FUNC(waitAndExecute);

[_unit, false, GROUP_SWITCH_ID, side group _unit] call FUNC(switchToGroupSide);

_loaded = _vehicle getvariable [QGVAR(loaded_persons),[]];
_loaded deleteAt (_loaded find _unit);

_vehicle setvariable [QGVAR(loaded_persons), _loaded, true];

true
