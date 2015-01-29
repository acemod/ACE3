/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

#define __CONF_MAGAZINES configFile >> "CfgMagazines"
#define __CONF_WEAPONS configFile >> "CfgWeapons"

ADDON = false;

if (!isDedicated) then {
	["All", [ace_sys_interaction_key], 2, [QPATHTO_F(fnc_menuDef), "main"]] call CBA_ui_fnc_add;
};

PREP(carry);
PREP(carry2);
PREP(drag);
PREP(push);
PREP(load);
PREP(loadCargo); // Workaround
PREP(unloadCargo); // Workaround
PREP(listCargo); // Workaround
PREP(unload);
PREP(onload);
PREP(view);

PREP(init);

[QGVAR(setvel), {(_this select 0) setVelocity (_this select 1)}] call ACE_fnc_addReceiverOnlyEventhandler;

// TODO: Complete rewrite needed:
/*
Function should determine wether an object can be dragged or carried or carried in pairs
Push option ONLY for boat type vehicles (to drop them back into water)

Carrying objects should be 0 - 30 kg (Carring above 20 kilo slows you down)
Dragging should be 30 - 80 kg
Carrying in pairs should be 80 - 180 kg

An object that can be dragged should also be able to be carried in pairs

Everything > 180 kg, needs to be loaded and transported by another vehicle or lifted by air

*/

FUNC(determineCargo) = {
// TODO: Make easier....
// Immobile:  			0
// Carry:     			1 Light objects weight exceeds no more than 20 kg!!!
// Drag:      			2 Heavy objects that could not be CARRIED, weight > 15 kg < 100kg
// Push:      			3 Heavy objects that could not be CARRIED or DRAGGED, weight > 100 kg!
// Carry with 2 people: 4 Heavy objects (if _type is ((2 && > 80) || (3 && < 200) && _helper) but a second player (_helper) is close ~5 meters)

// Rev. 2:
// Carry: 			1 (0-30 kg)
// Drag:			2 (30-80kg)
// Carry 2  		4 (80-145kg)
// Drag OR Carry 2 	5 (30-145kg and because its cool) // One override comes from CSW direct, other entities should get a special config entry (e.g ammoboxes etc)

	private ["_weight","_volume","_canDrag","_canCarry","_canPush","_type"];
	
	// Calculate volume of cargo to determine weight.
	PARAMS_2(_target,_method);
	_volume = 0;
	_weight = 0;
	_canDrag = false;
	_canPush = false;
	_canCarry = false;
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ACE_canBeCargo") == 1) then {
		_weight = [_target] call FUNC(weight);
		
		_canCarry = (_weight < __MAXCARRYWEIGHT);
		_canDrag = (!_canCarry && {(_weight + __MAXCARRYWEIGHT) <= __MAXDRAGWEIGHT});

		TRACE_2("DC",_volume,_weight);
		switch (true) do {
			// PUSH for Boats
			case (_target isKindOf "Zodiac" || {_target isKindOf "PBX"}): { _canDrag = false; _canPush = true; _canCarry = false; };
			case (_target isKindOf "ACE_Stretcher"): { _canDrag = false; _canPush = false; _canCarry = false; };
		};
		// Check sys_crewserved override
		if (getNumber(configFile >> "CfgVehicles" >> typeOf _target >> "ACE" >>"ACE_CREWSERVED" >> "canDrag") == 1) then {
			_canDrag = true; _canPush = false; _canCarry = false;
		};
		if (getNumber(configFile >> "CfgVehicles" >> typeOf _target >> "ACE" >>"ACE_CREWSERVED" >> "canCarry") == 1) then {
			_canDrag = true; _canPush = false; _canCarry = true;
		};
		// Check if a shot mortar
		if (_target getVariable ["ace_sys_arty_shoton",false]) then {
			_canDrag = false; _canCarry = false;
		};
	};	

	if (_canCarry && {!_canDrag} && {!_canPush}) then { _type = 1; };
	if (!_canCarry && {_canDrag} && {!_canPush}) then { _type = 2; };
	if (_canPush && {!_canDrag} && {!_canCarry}) then { _type = 3; };
	if (!_canPush && {!_canDrag} && {!_canCarry}) then { _type = 0; };
	if (!_canCarry && {!_canDrag} && {!_canPush} && {_weight <= __MAXCARRYWEIGHTBY2}) then { _type = 4; };
	if (_canCarry && {_canDrag} && {!_canPush} &&  {_weight <= __MAXCARRYWEIGHTBY2}) then { _type = 5; };
	
	
	if (_method == "set") then {
		_target setVariable [QGVAR(type),_type,true];
	};
	TRACE_1("DC Carrying method",_type);
	_type
};

FUNC(clearCargo) = {
	private ["_cargolist","_cargofrontlist"];
	PARAMS_1(_vehicle);
	_cargolist = [_vehicle] call ACE_fnc_listCargo;
	_cargofrontlist = _vehicle getVariable [QGVAR(content_front),[]];
	if (count _cargolist < 1 && {count _cargofrontlist < 1}) exitWith {};
	{
		deleteVehicle _x;
	} foreach _cargolist + _cargofrontlist;
	// TODO: Determine explosives loaded? Create Secondaries for loaded shells, ammoboxes, ammocans etc
	// Perhaps should be called from external with explosions, sys_destruction ... 
	_vehicle setVariable [QGVAR(content),[],true];
	_vehicle setVariable [QGVAR(content_front),[],true];
};

FUNC(determineFrontCargo) = {
	PARAMS_1(_vehicle);
	private ["_frontLoadingCapability","_l1","_l2","_pl1","_pl2","_pos","_chksum","_max","_cur","_capacity_full"];
	_frontLoadingCapability = true;
	if !((typeOf _vehicle) isKindOf "Car") exitWith { // Only on class Car for now...
		[false,true,[0,0,0]]
	};
	// TODO: Get class ACE value
	// Find position between frontlights
	_l1 = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> "Left" >> "selection");
	_l2 = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> "Right" >> "selection");
	_pl1 = _vehicle selectionPosition _l1;
	_pl2 = _vehicle selectionPosition _l2;
	_pos = [0,(_pl1 select 1)+0.1,(_pl2 select 2)-0.4];
	_chksum = (_pos select 0)+(_pos select 1)+(_pos select 2);
	// TODO: Error if model not conform or has no lights
	
	// Return position to attach and bool value for 2 in 1 function
	if (_chksum == 0.1) then {
		_frontLoadingCapability = false;
	};
	//_max = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE" >> "ACE_CARGO" >> "FrontLoadingCapacity");
	_max = 1;
	_cur = _vehicle getVariable [QGVAR(content_front),[]];
	_cur = count _cur;
	_capacity_free = if (_max - _cur == 0) then {false} else {true};	
	[_frontLoadingCapability,_capacity_free,_pos]
};

FUNC(attachToFront) = {
	PARAMS_2(_cargo,_vehicle);
	private ["_currentFrontCargo","_pos"];
	_pos = (_vehicle call FUNC(determineFrontCargo)) select 2;
	[_cargo,"set"] call FUNC(determineCargo);
	["","","",["stop",player getVariable QGVAR(carried_object)]] call FUNC(carry);
	_cargo attachTo [_vehicle,_pos,""];
	_cargo setVariable [QGVAR(attached_front),true,true];
	_currentFrontCargo = _vehicle getVariable [QGVAR(content_front),[]];
	_currentFrontCargo set [count _currentFrontCargo,_cargo]; 
	_vehicle setVariable [QGVAR(content_front),_currentFrontCargo];
};

FUNC(detachFront) = {
	PARAMS_1(_cargo);
	//private "_currentFrontCargo";
	detach _cargo;
	_cargo setVariable [QGVAR(attached_front),false,true];
	//_currentFrontCargo = _vehicle getVariable [QGVAR(content_front),[]];
	//if (count _currentFrontCargo < 1) exitWith {};
	//_currentFrontCargo - [_cargo];
	//_vehicle setVariable [QGVAR(content_front),_currentFrontCargo];	
};

// TODO: Outsource funcs to external

// Busy func
FUNC(busy) = {
	PARAMS_2(_v,_s);
	if (_s == 1) then {
		_v setVariable [QGVAR(busy), true, true];
	} else {
		_v setVariable [QGVAR(busy), false, true];
	};
};

// Easy set/reset busy states
FUNC(cbusy) = {
	PARAMS_4(_v,_c,_sv,_sc);
	if (_sv == 1) then { [_v,1] call FUNC(busy); } else { [_v,0] call FUNC(busy); };
	if (_sc == 1) then { [_c,1] call FUNC(busy); } else { [_c,0] call FUNC(busy); };
};

// Volume stuff
FUNC(volume) = {
	PARAMS_1(_target);
	_bbox = boundingBox _target;
	_bc = abs((_bbox select 0) select 0) + abs((_bbox select 1) select 0);
	_lc = abs((_bbox select 0) select 1) + abs((_bbox select 1) select 1);
	_hc = abs((_bbox select 0) select 2) + abs((_bbox select 1) select 2);
	_volume = (_lc * _bc * _hc);
	TRACE_1("V Volume",_volume);
	_volume;
};

// Weight stuff
FUNC(weight) = {
	PARAMS_1(_cargo);
	private ["_content_weight","_w1","_w2","_volume","_baseweight","_weight"];
	_content_weight = {
		PARAMS_2(_items,_type);
		private ["_cargo_weight","_item"];
		_cargo_weight = 0;
		_item = _items select 0;
		if (count _item > 0) then {
			_count = _items select 1;
			for "_i" from 0 to (count _item - 1) do {
				_item_x = _item select _i;
				_count_x = _count select _i;
				_ItemWeight = switch _type do {
					case "m": { 0.075 * getNumber(__CONF_MAGAZINES >> _item_x >> "mass") };
					default { 0.075* getNumber(__CONF_WEAPONS >> _item_x >> "mass") };
				};
				_ItemWeight = _ItemWeight * _count_x;
				_cargo_weight = _cargo_weight + _ItemWeight;
			};
			//_cargo_weight = _cargo_weight + _cargo_weight;
		};
		_cargo_weight;
	};	
	_w1 = [getMagazineCargo _cargo, "m"] call _content_weight; 
	_w2 = [getWeaponCargo _cargo, "w"] call _content_weight;
	#ifdef DEBUG_MODE_FULL
		diag_log format["Weight of all weapons in box: %1",_w2];
		diag_log format["Weight of all magazines in box: %1",_w1];
	#endif
	_volume = _cargo call FUNC(volume);
	// Check if a weight value was defined and use this prior to calculated weight
	_baseweight = if (isNumber(configFile >> "CfgVehicles" >> typeOf _cargo >> "mass")) then {
		0.075 * getNumber(configFile >> "CfgVehicles" >> typeOf _cargo >> "mass");
	} else {
		(_volume * 0.5);
	};
	TRACE_1("W Weight",_baseweight);
	_weight = _baseweight + _w1 + _w2;
	_weight;
};

GVAR(busy) = {
	_this getVariable [QGVAR(busy), false]
};
GVAR(BOXBusy) = {
	PARAMS_2(_box,_busy);
	_box setVariable [QGVAR(BOXBusy), _busy == 1, true];
};

FUNC(dragkeydown) = {
	// Eventhandler to stop "C" key press while dragging
	PARAMS_5(_control,_dikCode,_shift,_ctrl,_alt);
	_dikCode_check = actionKeys "TactToggle" + actionKeys "stand" + actionKeys "prone" + actionkeys "crouch" + actionkeys "moveup" + actionkeys "movedown"; //stop standing up while dragging
	(_dikCode in _dikCode_check)
};

FUNC(lbselchanged) = {
	private ["_disp", "_ctrl","_ui"];
	PARAMS_2(_data,_location);
	_ui = if (_location == "back") then { "ACE_Cargo_List" } else { "ACE_CargoFront_List" };
	_disp = uiNamespace getVariable _ui;
	_ctrl = _disp displayCtrl 10;
	if ((_data select 1) != -1) then {
		if (!(ctrlEnabled _ctrl)  && !(player in crew GVAR(vehicle) || player getVariable [QGVAR(carrying),false])) then {
			_ctrl ctrlEnable true;
			_ctrl ctrlCommit 0;
		};
	} else {
		if (ctrlEnabled _ctrl) then {
			_ctrl ctrlEnable false;
			_ctrl ctrlCommit 0;
		};
	};
};

//FUNC(respawn) = {
//	(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(drag_keyDownEHId)];
//};

//FUNC(standup) = {
//	PARAMS_1(_unit);
//	_unit addAction ["Stand up", QPATHTO_F(fnc_exec), _unit, 0, false, true, "", "local _target"];
//};

ADDON = true;
