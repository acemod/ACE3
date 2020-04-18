#include "script_component.hpp"
/*
 * Author: ! DatOneGuy !
 * Called by the animChanged EH in setUnconsciousAnim.sqf to set the unconscious animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Unit Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * This function should only be called on by the EH because of the reliance on _thisType and _thisID
 *
 * Public: No
 */
 
params ["_unit", "_anim"];

//When unit wakes up remove the event handler
if(!(_unit getVariable ["ACE_isUnconscious", true])) exitWith {
	_unit removeEventHandler [_thisType, _thisID];
};

if(vehicle _unit == _unit && "unconscious" in _anim) then {
	[_unit, "Unconscious"] call EFUNC(common,doAnimation);
};