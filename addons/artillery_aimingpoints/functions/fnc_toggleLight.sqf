/*
 * Author: p1nga
 *
 * Toggle The Light On Aiming Post.
 *
 * Argument:
 * 0: Any object <OBJECT>
 * 1: Current Status Of Light:  0=Off  1=Green  2=Red

 *
 * Return Value:
 * Updated Status
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_lightStatus", "_updateStatus"];

params ["_object"];

_lightStatus getVariable ["lightStatus", 0];

diag_log 'Toggle Light Script';
switch (_lightStatus) do {
    case 0: {
		diag_log 'Toggle Light 1';
		_object animate ["illuminate_green",1]; _object setVariable ["lightStatus", 1];
	};
    case 1: {
		diag_log 'Toggle Light 2';
		_object animate ["illuminate_green",0]; _object setVariable ["lightStatus", 2];
	};
	case 2: { 
		diag_log 'Toggle Light 3';
		_object animate ["illuminate_green",0]; _object setVariable ["lightStatus", 0];
	};
    default {
		diag_log 'Toggle Light X';
		hint "Something Went Wrong With AimingPost";
	};
};
