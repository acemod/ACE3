/*
 * Author: Glowbal
 * Register synchronized objects from passed object as a medical facility
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_logic","_setting","_objects"];
_logic = param[0,objNull,[objNull]];
if (!isNull _logic) then {
    _setting = _logic getvariable ["class",0];
    _objects = synchronizedObjects _logic;
    {
        if (local _x) then {
            _x setvariable[QGVAR(isMedicalFacility), true, true];
        };
    }foreach _objects;
};

true;
