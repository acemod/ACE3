/*
 * Author: Fisher
 * Toggle Simulation on object
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 *
 * Public: No
 */
 
 #include "script_component.hpp"
 
 params ["_logic"];
 private ["_object","_mouseOver"];
 
 if !(local _logic) exitWith {};

 _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);
if ((_mouseOver select 0) != "OBJECT") then {
    [LSTRING(NothingSelected)] call EFUNC(common,displayTextStructured);
} else {
    _object = effectivecommander (_mouseOver select 1);
	if !(alive _object) then {
        [LSTRING(OnlyAlive)] call EFUNC(common,displayTextStructured);
    } else {
		_object enableSimulationGlobal (!(simulationEnabled _object));
	};
};