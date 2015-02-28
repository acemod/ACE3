/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")

PARAMS_4(_component,_unit,_id,_ar);

_position = _ar select 0;
_action = _ar select 1;
if (_component == _unit) then {
	_component = _ar select 2;
};

TRACE_3("",_position,_action,_component);

if (isNil QUOTE(FUNC(sease))) then {
	FUNC(ease) = {
		private "_unit";
		_unit action ["WeaponOnBack", _unit];
	};
};

if (isNil QUOTE(FUNC(sdrop))) then {
	FUNC(sdrop) = {
		PARAMS_1(_component);
		private ["_carrier_front","_carrier_back"];
		_carrier_front = _component getVariable QGVAR(carrier_front);
		_carrier_front removeAction GVAR(drop_action);
		_carrier_back = _component getVariable QGVAR(carrier_back);
		detach _carrier_back;
		detach _component;
		_component setPosATL [getPos _component select 0, getPos _component select 1, 0];
		_carrier_front setVariable [QGVAR(monitoring),false,true];

		_component setVariable [QGVAR(carrier_front), nil, true]; 
		_component setVariable [QGVAR(carrier_back), nil, true];		
		TRACE_1("Dropping component","");
		_component setVelocity [0,0,0];

		{ 
			//_x setVariable ["ace_sys_stamina_mass",0,true]; // The function is bullshit - but why?
			[_x,0] call INC_MASS;
			_x removeEventhandler ["fired",(_x getVariable QGVAR(carryFEH))];
			_x removeEventhandler ["getin",(_x getVariable QGVAR(carryGIH))];
			_x setVariable [QGVAR(carryFEH),-1];
			_x setVariable [QGVAR(carryGIH),-1];
			_x setVariable [QGVAR(forcedrop),false];
			_x forceWalk false;
			_x forceWalk false;
		} foreach [_carrier_front,_carrier_back]; 
		[objnull,_component,0,0] call FUNC(cbusy);
	};
};

switch (toLower _action) do {
	case "grab": { // GRAB ACTION
		switch (toLower _position) do {
			case "front": {
				_unit setDir direction _component; // Front position is "driver"
				_attachPos = if (count getArray(configFile >> "CfgVehicles" >> typeOf _component >> "attachPosFront") > 0) then {
					getArray(configFile >> "CfgVehicles" >> typeOf _component >> "attachPosFront")
				} else { [0,-0.5,0.5] };
				_component attachTo [_unit, _attachPos, ""]; 						// Attach component to front carrier
				_component setVariable [QGVAR(carrier_front), _unit, true]; 		// SetVariable front carrier onto component
				[objnull,_component,1,1] call FUNC(cbusy);
				
				// Add "drop" action, GLOBAL, since we handle player only
				GVAR(drop_action) = _unit addAction [
					ACE_TEXT_RED((localize "STR_ACE_CARGO_CARRYRELASE")),
					"\z\ace\addons\sys_cargo\ua_carry2.sqf",
					["", "drop",_component],
					-1,false,true,"",""
				]; // 0 - target, 1 - caller, 2 - id , 3 - ar=[0 - "", 1 - action]
	
				if (local _unit) then {
					_unit setVariable [QGVAR(monitoring), true];
				};
				//_unit call FUNC(ease); // Put weapon on back while carrying in pairs

				// Stamina Boost on taking knee + pushing loaded stretcher up
				_weight = ([_component] call FUNC(weight))/2;
				[_unit,_weight] call INC_MASS;
				//_unit setVariable ["ace_sys_stamina_mass",_weight,false]; // TODO: Fix weight
				_fired_i = _unit addEventHandler ["fired", {(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true]}];
				_getin_i = _unit addEventhandler ["getin",{(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true];}];
				_unit setVariable [QGVAR(carryFEH),_fired_i];
				_unit setVariable [QGVAR(carryGIH),_getin_i];
				_unit setVariable [QGVAR(forcedrop),false];
			};
			case "back": { // Back position is following
				_attachPos = if (count getArray(configFile >> "CfgVehicles" >> typeOf _component >> "attachPosRear") > 0) then {
					getArray(configFile >> "CfgVehicles" >> typeOf _component >> "attachPosRear")
				} else { [0,-0.5,0.5] };			
				_unit attachTo [(_component getVariable QGVAR(carrier_front)),_attachPos,""]; 	// Attach helper to the front carrier
				_component setVariable [QGVAR(carrier_back), _unit, true]; 						// SetVariable back carrier to component

				// Stamina Boost on taking knee + pushing loaded stretcher up
				_weight = ([_component] call FUNC(weight))/2;
				[_unit,_weight] call INC_MASS;
				//_unit setVariable ["ace_sys_stamina_mass",_weight,false];
				_fired_i = _unit addEventHandler ["fired", {(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true]}];
				_getin_i = _unit addEventhandler ["getin",{(_this select 0) setVariable ["ace_sys_cargo_forcedrop",true];}];
				_unit setVariable [QGVAR(carryFEH),_fired_i];
				_unit setVariable [QGVAR(carryGIH),_getin_i];
				_unit setVariable [QGVAR(forcedrop),false];				
			};
		};
	};
	case "drop": { // Drop action
		_component call FUNC(sdrop);
	};
};

TRACE_1("",(_unit getVariable QGVAR(monitoring)));

// Monitoring script for the front carrier
if (_position == "front") then {
	_count = 0;
	while { _unit getVariable QGVAR(monitoring) } do { // CALLED WHEN USING GRAB ONLY !
		
		TRACE_1("While running","");
		
		_carrier_front = _component getVariable QGVAR(carrier_front);
		_carrier_back = _component getVariable QGVAR(carrier_back);

		// Check for front carrier, when there is no back carrier within 10 seconds, front carrier drops stretcher again
		if (_count > 8 && {isNil "_carrier_back"}) then {
			_component call FUNC(sdrop);
			//_carrier_front removeAction GVAR(drop_action);
			if (local _carrier_front) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
			TRACE_1("Dropping: No helper","");
		};

		// Check if the front carrier entered a vehicle! TODO
		
		// While none of the carriers is dead or unconscious nothing happens
		if !(alive _carrier_front) then {
			_component call FUNC(sdrop);
			TRACE_1("Frontcarrier dead","");
		};
		if !(alive _carrier_back) then {
			_component call FUNC(sdrop);
			TRACE_1("Backcarrier dead","");
		};

		// Too fast
		if ((velocity _carrier_front call ACE_fnc_magnitude) > 5.51) then {
			_component call FUNC(sdrop);
			if (local _carrier_front) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
			TRACE_1("Too fast","");
		};

		// TODO: Carrier front and back are unconsciousnes (i.e back carriers is unconscious and would be dragged in stretcher)
		// TODO: Wrong animation: Taking out Binocular, Raising weapon (combat ready), taking a knee, going prone
		// Allow tacticool movement for carrying CSWs
		_dropConditionAnim = if (_component isKindOf "StaticWeapon") then { ["stand","kneel"] } else { ["stand"] };
		if !(((_carrier_front call CBA_fnc_getUnitAnim) select 0) in _dropConditionAnim) then {
			_component call FUNC(sdrop);
			if (local _carrier_front) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
			TRACE_1("Wrong animation","");
		};
		if !(((_carrier_back call CBA_fnc_getUnitAnim) select 0) in _dropConditionAnim) then {
			_component call FUNC(sdrop);
			if (local _carrier_back) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
			TRACE_1("Wrong animation Backcarrier","");
		};

		// TODO: Anything else not allowed, firing, entering vehicles, climbing up ladders
		// Ladders
		if ((animationState _carrier_front) in ["ladderrifleon","laddercivilon"]) then {
			_component call FUNC(sdrop);
			if (local _carrier_front) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };
			TRACE_1("Wrong animation: LADDER","");
		};
		//_dropConditionAnim2 = (animationState _unit) in ["aidlpercmstpsraswrfldnon_idlesteady04","aidlpercmstpsraswrfldnon_aiming01","aidlpercmstpsraswrfldnon_idlesteady02","aidlpercmstpsraswrfldnon_idlesteady03","aidlpercmstpsraswrfldnon_idlesteady01","aidlpercmstpsraswrfldnon_aiming02"];
		//if ((animationState _carrier_front) in _dropConditionAnim2) then {
		//	_component call FUNC(sdrop);
		//	if (local _carrier_front) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };		
		//};
		//if ((animationState _carrier_back) in _dropConditionAnim2) then {
		//	_component call FUNC(sdrop);
		//	if (local _carrier_back) then { localize "STR_ACE_CARGO_DROPPED" call ace_fnc_visual; };		
		//};		
		
		sleep 1;
		INC(_count);
	};
	_unit setVariable [QGVAR(monitoring),false];
	TRACE_1("Carrying aborted","");
};
