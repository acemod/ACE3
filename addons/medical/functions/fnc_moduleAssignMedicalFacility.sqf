#include "script_component.hpp"
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
 * None
 *
 * Example:
 * [LOGIC, [kevin, bob], true] call ACE_medical_fnc_moduleAssignMedicalFacility
 *
 * Public: No
 */

params [["_logic", objNull, [objNull]]];
if (!isNull _logic) then {
    private _setting = _logic getVariable ["class",0];
    private _objects = synchronizedObjects _logic;
    {
        if (local _x) then {
            _x setVariable[QGVAR(isMedicalFacility), true, true];
        };
    } forEach _objects;
};

true;
