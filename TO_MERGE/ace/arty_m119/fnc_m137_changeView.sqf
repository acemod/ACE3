//fnc_m137_changeView.sqf
#include "script_component.hpp"
if(cameraView == "GUNNER") then {
	GVAR(m137Gun) switchCamera "INTERNAL";
} else {
	GVAR(m137Gun) switchCamera "GUNNER";
};