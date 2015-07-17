/*
 * Author: Garth 'L-H' de Wet
 * Sets the Dir and pitch of passed object
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Direction <NUMBER>
 * 2: Pitch <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, 150, 90] call ACE_Explosives_fnc_setPosition;
 *
 * Public: Yes
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_explosive,_direction,_pitch);

if (isNull (attachedTo _explosive)) then {
    _explosive setDir _direction;
    if (_pitch != 0) then {
        [_explosive, _pitch, 0] call CALLSTACK(BIS_fnc_setPitchBank);
    };
} else {
    _explosive setVectorDirAndUp [[0,0,1],[(sin _direction),(cos _direction),0]];
};


