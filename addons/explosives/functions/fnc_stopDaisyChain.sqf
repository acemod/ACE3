/*
 * Author: Loren Luke Leimer
 * Removes an explosive from a units daisy chain variable
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [player] call ACE_Explosives_fnc_startDaisyChain;
 *
 * Public: Yes
 */
 
 #include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

_unit setVariable [QGVAR(DaisyChain), [false,objNull], true];