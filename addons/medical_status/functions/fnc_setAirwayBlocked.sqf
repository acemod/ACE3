#include "script_component.hpp"
params ["_unit","_state"];
private _sounds = [
	QUOTE(PATHTO_R(sounds\puking1.wav)),
	QUOTE(PATHTO_R(sounds\puking2.wav)),
	QUOTE(PATHTO_R(sounds\puking3.wav))
];
if (_state) then {
	playsound3D [selectRandom _sounds, _unit, false, eyePos _unit, 8, 1, 15];
};
_unit setVariable [VAR_AIRWAY_BLOCKED, _state, true];