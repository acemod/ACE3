//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];
private ["_vehicle", "_displayNameVehicle","_exit","_nearestVehicle"];
private ["_canDrag","_canPush"];
private ["_weight"];

PARAMS_2(_target,_params);

_menuDef = [];

if (typeOf _target == "Weaponholder") exitWith { closeDialog 0; _menuDef };
// Needs to be fixed in CBA if possible, objects that inherit from any class used for interaction, but should not be able to interacted with, 
// e.g class Weaponholder, which inherits from Reammobox!

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------

// TODO: Sort functions and scripts!
// Hacked
if (_target isKindOf "ACE_Arty_AimingStakes") exitWith {_menuDef};


// Only allow loading of ammoboxes atm. Later extend to different vehicles (small) or objects
_loadthing = (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ACE_canBeLoad") == 1);
_gearthing = (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ACE_canGear") == 1);

// Get exceptional vehicle that can only store gear parts (used in sys_eject - weaponcheck)
// This is used to allow players access the cargo space of non-sys_cargo vehicles!
if (_gearthing) then {
	_loadthing = true;
};

_cargothing = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ACE_canBeCargo") == 1;
_canBeCarried = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ACE_canBeCarried") == 1;
_onSling = _target getVariable ["ace_sys_slingload_isLoaded",false];
TRACE_5("",_target,_loadthing,_cargothing,_gearthing,_canBeCarried);

if !(_loadthing || {_cargothing} || {_canBeCarried}) exitWith {_menuDef};

#define __TMW getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportMaxWeapons")
#define __TMM getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportMaxMagazines")

GVAR(target) = _target;

_displayNameCargo = getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayNameShort");
if (_displayNameCargo == "") then {_displayNameCargo = typeOf _target};

_nearestVehicle = objNull;
if (isNull _target) then {objNull} else {
	_ar = nearestObjects [_target, ["Car", "Ship", "Air","Tank"], 8];
	_filter_ar = [_ar, {_x isKindOf "ACE_JerryCan"}] call BIS_fnc_conditionalSelect;
	if (count _filter_ar > 0) then {
		_ar = _ar - _filter_ar;
	};
	if (count _ar > 0) then { _nearestVehicle = _ar select 0 };
};
_nearestVehicleDistance = _target distance _nearestVehicle; // Loading distance. Should normally be relatively small
_vehicle = if (!isNull _nearestVehicle && {_nearestVehicleDistance < (2 + (_nearestVehicle call BIS_fnc_boundingCircle)/2)}) then {_nearestVehicle} else {objNull};

GVAR(vehicle) = _vehicle; // Set the cargo vehicle to the target, unless a different vehicle was found near

TRACE_2("TARGET & VEHICLE",_target,_vehicle);

_vehicleAvailable = !isNull _vehicle && {alive _vehicle};
if (_vehicleAvailable) then {
	_displayNameVehicle = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	if (_displayNameVehicle == "") then {_displayNameVehicle = typeOf _vehicle};
	TRACE_2("Found",GVAR(vehicle),_vehicleAvailable);
	// Check if found vehicle has cargo capacity
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_canBeLoad") != 1 || {(__TMW == 0 && {__TMM == 0})} || {_vehicle getVariable [QGVAR(busy),false]}) exitWith {
		_vehicleAvailable = false;
		TRACE_1("...Vehicle cannot transport anything","");
		TRACE_1("...Vehicle has no cargo space","");
	};
};

// Check wether player isInFront of vehicle or behind it.

_inFront = if !(isNull GVAR(vehicle)) then { [GVAR(vehicle),player,0.1] call ACE_fnc_inFront; } else { false };
_currentCargo = _target getVariable [QGVAR(content),[]];
_currentCargo_front = _target getVariable [QGVAR(content_front),[]];
_type = [_target,"check"] call FUNC(determineCargo);

private ["_canLoadFront","_frontLoadFree"];
if (!isNull GVAR(vehicle)) then {
	_frontLoading = GVAR(vehicle) call FUNC(determineFrontCargo);
	_canLoadFront = _frontLoading select 0;
	_frontLoadFree = _frontLoading select 1;
} else {
	_canLoadFront = false;
	_frontLoadFree = false;
};
_isCarryingFrontLoadItem = false;
if (player getVariable [QGVAR(carrying),false]) then {
	_frontCargoItem = player getVariable QGVAR(carried_object);
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _frontCargoItem >> "ACE_canLoadFront") == 1) then {
		_isCarryingFrontLoadItem = true;
	};
};

// Carry in pairs stuff
// ----------------------------------
_helperNear = false;
_helper = objNull;
if (_type in [4,5]) then {
	_potHelper = (position player) nearEntities ["CaManBase",5] - [player];
	if (player in _potHelper) then {
		_potHelper = _potHelper - [player];
	};
	if (count _potHelper > 0) then {
		_isPlayer = false;
		{
			if (isplayer _x) exitWith { _helperNear = true; _helper = _x; }; /// ADD "!" to 'isplayer check' if TESTING in SP !!!!!
		} foreach _potHelper;
	};
};
// Check if component has a front carrier, so the HELP XX CARRYING option comes alive
_canBeCarriedInPairs = (isNil {_target getVariable [QGVAR(carrier_front), nil]});

// Check if component has a back carrier
_hasCarrierBack = (!isNil {_target getVariable [QGVAR(carrier_back), nil]});
_hasCarrierFront = (!isNil {_target getVariable [QGVAR(carrier_front), nil]});
// Check if component is busy, i.e about to become loaded into something
_nameCarrierFront = if (_hasCarrierFront) then { name (_target getVariable QGVAR(carrier_front)) } else { "" };

TRACE_4("",_canBeCarriedInPairs,_hasCarrierBack,_hasCarrierFront,_nameCarrierFront);

GVAR(helper) = _helper; TRACE_1("",_helper);

_menus = [
	[
		["main", "", _menuRsc],
		[
			[format [localize "STR_ACE_CARGO_CARRY",_displayNameCargo], // Carry alone
				{ [GVAR(target)] spawn FUNC(carry) },
				"", "", "", -1,
				//1, ({alive _x} count (crew _target) == 0) && {alive _target} && {_cargothing} && {_type == 1} && {!(_target getVariable [QGVAR(attached_front),false])} && {!(player getVariable [QGVAR(carrying),false])}],
				1, _canBeCarried && {ACE_SELFINTERACTION_RESTRICTED} || {({alive _x} count (crew _target) == 0) && {alive _target} && {_cargothing} && {_type == 1} && {!(_target getVariable [QGVAR(attached_front),false])} && {!(player getVariable [QGVAR(carrying),false])} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}}],
			
			[format [localize "STR_ACE_CARGO_CARRY2",_displayNameCargo], // Carry in pairs
				{ [GVAR(target),player, "CARRIER"] spawn FUNC(carry2) },
				"", "", "", -1,
				_helperNear, _canBeCarriedInPairs && {alive _target} && {!_hasCarrierFront} && {_cargothing} && {_type in [2,4,5]} && {!(_target getVariable [QGVAR(attached_front),false])} && {!(player getVariable [QGVAR(carrying),false])} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}],

			[format [localize "STR_ACE_CARGO_CARRY2_HELP",_nameCarrierFront], // Carry in pairs Help
				{ [GVAR(target),player, "HELPER"] spawn FUNC(carry2) },
				"", "", "", -1,
				1, _hasCarrierFront && {!_hasCarrierBack} && {alive _target} && {_cargothing} && {_type in [4,5]} && {!(_target getVariable [QGVAR(attached_front),false])} && {!(player getVariable [QGVAR(carrying),false])} && {ACE_SELFINTERACTION_RESTRICTED}],

			[localize "STR_ACE_CARGO_DRAG", // Drag
				{ [GVAR(target)] spawn FUNC(drag) },
				"", "", "", -1,
				1, ({alive _x} count (crew _target) == 0) && {alive _target} && {_cargothing} && {(player == vehicle player)} && {_type in [2,5]} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}],

			[format [localize "STR_ACE_CARGO_PUSH",_displayNameCargo], // Push
				{ [GVAR(target)] spawn FUNC(push) },
				"", "", "", -1,
				1, alive _target && {_cargothing} && {_type == 3} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}],
			
			[format[localize "STR_ACE_LOADCARGO", _displayNameVehicle], // Loading cargo is now only at the vehicles trunk!
				{[GVAR(target),GVAR(vehicle)] spawn FUNC(load) },
				"", "", "", -1,
				GVAR(vehicle) != GVAR(target) && {_type in [1,2,4,5]}, _vehicleAvailable && {_cargothing} && {alive _target} && {!_inFront} && {!(player getVariable [QGVAR(carrying),false])} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}],
			
			["Attach in front", //TODO: localize // Attaching stuff on the front of the vehicle (looks kool but maybe useless)
				{[(player getVariable QGVAR(carried_object)),GVAR(vehicle)] spawn FUNC(attachToFront) },
				"", "", "", -1,
				GVAR(vehicle) != GVAR(target), _loadthing && {alive _target} && {_inFront} && {_canLoadFront} && {_isCarryingFrontLoadItem} && {_frontLoadFree} && {!_onSling} && {ACE_SELFINTERACTION_RESTRICTED}],				
			
			[localize "STR_ACE_SHOWCARGO", // Cargo access is now only at the vehicles trunk!
				{ closeDialog 0; createDialog "ACE_Cargo_List" },
				"", "", "", -1,
				count _currentCargo > 0, alive _target && {_loadthing} && {getPos _target select 2 < 2} && {!_inFront} && {ACE_SELFINTERACTION_RESTRICTED}],
			
			[localize "STR_ACE_SHOWCARGO", // Cargo access for items attached to vehicle front
				{ closeDialog 0; createDialog "ACE_CargoFront_List" },
				"", "", "", -1,
				count _currentCargo_front > 0, alive _target && {_loadthing} && {getPos _target select 2 < 2} && {_inFront} && {ACE_SELFINTERACTION_RESTRICTED}]		
		]
	]
];

//-----------------------------------------------------------------------------

{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value
