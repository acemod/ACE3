#include "script_component.hpp"

PARAMS_2(_cargo,_helicopter);

//TODO: Check if helicopter is already filled with cargo aka soldiers, if so, make sling rope break if speed > 50
//      Cargo becomes damaged and slingrope unuseable

// TODO: Cargo limits
// TODO: Move to process.sqf ?
_crew = crew _helicopter;
_passengers = [];
{
	if ((assignedVehicleRole _x) select 0 == "CARGO") then {
		_passengers set [count _passengers, _x];
	};
} foreach _crew;
//_passenger_weight = 80 * count _passengers;

private["_cable","_pp","_reduction","_rel","_slingrope_type"];

_bboxHelicopter  = boundingBox _helicopter;
_bh = abs((_bboxHelicopter select 0) select 2) + (abs((_bboxHelicopter select 1) select 2) * 1.2);
_lh = abs((_bboxHelicopter select 0) select 0) +  abs((_bboxHelicopter select 1) select 0);
_hh = abs((_bboxHelicopter select 0) select 1) +  abs((_bboxHelicopter select 1) select 1);
_volumeH = _lh * _bh * _hh;

_bboxCargo = boundingBox _cargo;
_bc = abs((_bboxCargo select 0) select 0) + abs((_bboxCargo select 1) select 0);
_lc = abs((_bboxCargo select 0) select 1) + abs((_bboxCargo select 1) select 1);
_hc = abs((_bboxCargo select 0) select 2) + abs((_bboxCargo select 1) select 2);
_volumeC = _lc * _bc * _hc;

_tope = 16;
_abort = false;

// Find the correct sling rope model
if (_volumeC > 0.001) then {
	_rel = _volumeH / _volumeC;
	if (_rel >= _tope) then {
		_slingrope_type = switch (true) do {
			case(_volumeC < 150): {1};
			case (_volumeC < 200): {2};
			default {2};
		};
		if (_rel < 20) then {
			_slingrope_type = 1;
			_volumeC = (_lc * 100) / _bc;
			if (_volumeC > 100) then {_volumeC = _volumeC - 100};
			if (_volumeC > 20) then {_slingrope_type = 2};
		};
	} else { _slingrope_type = 2; };
};

if (_abort) exitWith {
	_msg1 = "An error occured with the slingload feature.";
	hint _msg1;
	#ifdef DEBUG_MODE_FULL
	_msg2 = format ["H: %1 C: %2", typeOf _helicopter, typeOf _cargo];
	LOG(_msg1); LOG(_msg2);
	#endif
};

// Execute the lift

_Obx = 0;
_Oby = 0;
_Obz = 0;

_dist = -(_helicopter distance _cargo);
_cargo attachTo [_helicopter, [0,0, _dist + 0]];
_dir = direction _cargo - direction _helicopter;

if ("Air" counttype [_cargo] > 0) then { _dir = 0; };
if ("Ship" counttype [_cargo] > 0) then { _dir = 0; };
if ("Landvehicle" counttype [_cargo] > 0) then { _dir = 0;_slingrope_type = 1; };
if ("Motorcycle" counttype [_cargo] > 0) then { _slingrope_type = 1; };

_center = getArray(configFile >> "CfgVehicles" >> typeOf _helicopter >> "ACE_GeoLifterAttachment") select 0;
_cx = _center select 0;
_cy = _center select 1;
_cz = _center select 2;

switch (_slingrope_type) do {
	case 1: {
		_cable = "ACE_Slingrope_L" createvehicle [0,0,0];
		_cable attachto [_helicopter, [_cx + 0.02,_cy - 0.1,_cz + 0.4]];
		_helicopter setvariable [QGVAR(slingrope), _cable,true];
		_pp = _cable selectionposition "Anclaje";
		_cargo attachto [_cable, [_pp select 0, _pp select 1, _pp select 2]];
		_cargo attachto [_cable, [_Obx+(_pp select 0), _Oby+(_pp select 1), _Obz+(_pp select 2)]];
		_cargo setdir _dir; _cargo setpos getpos _cargo;
		_reduction = 1.0025;
	};
	case 2: {
		_cable = "ACE_Slingrope_M" createvehicle [0,0,0];
		_cable attachto [_helicopter, [_cx,_cy,_cz]];
		_helicopter setvariable [QGVAR(slingrope),_cable,true];
		_pp = _cable selectionposition "Anclaje";
		_cargo attachto [_cable, [_Obx+(_pp select 0), _Oby+(_pp select 1), _Obz+(_pp select 2) + 0.5]];
		_cargo setdir _dir; _cargo setpos getpos _cargo;
		_reduction = 1.0050;
	};
};

// Set variables
_helicopter setVariable [QGVAR(isTransporting),true,true];
_helicopter setVariable [QGVAR(cargoHeight),(_cargo modeltoworld [0,0,0]) select 2,true];
_helicopter setVariable [QGVAR(cargo),_cargo,true];

// Visual for helicopter
localize "STR_UA_ACE_CARGOHELIHOOKED" spawn ace_fnc_visual;

[_helicopter, _reduction, _cargo] spawn COMPILE_FILE(process); // Main process loop // TODO: Evaluate some more events for this

// Add CUT action for driver of helicopter
[QGVAR(action), _helicopter] call CBA_fnc_globalEvent;
