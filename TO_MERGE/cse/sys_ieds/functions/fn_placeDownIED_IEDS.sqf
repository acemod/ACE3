/**
 * fn_placeDownIED_IEDS.sqf
 * @Descr: Places down an IED (Player side)
 * @Author: Glowbal
 *
 * @Arguments: [type NUMBER (The type of IED.), size NUMBER, activationType NUMBER (1 = radio, 0 = pressure plate)]
 * @Return: logic LOGIC Returns the created IED logic
 * @PublicAPI: true
 */

private ["_position", "_logic"];
_typeOfIED = _this select 0;
_sizeOfIED = _this select 1;
_activationType = _this select 2;
//_position = _this select 3;


_position = getPos player;
_logic = (createGroup sideLogic) createUnit ["cse_playerSpawnedIED", _position, [], 0, "FORM"];
_logic setPos _position;

_logic setvariable ["typeOfIED", _typeOfIED, true];
_logic setvariable ["sizeOfIED", _sizeOfIED, true];
_logic setvariable ["heightOfIED", 0, true];
_logic setvariable ["iedActivationType", _activationType, true];

[_logic] call cse_fnc_createIEDObject_IEDS;

if (isnil "CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS") then {
	CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS = [];
};

if (isnil "CSE_PLAYER_PLACED_RADIO_IEDS_IEDS") then {
	CSE_PLAYER_PLACED_RADIO_IEDS_IEDS = [];
};
if (isnil "CSE_PLAYER_PLACED_RADIO_IEDS_COUNTER_IEDS") then {
	CSE_PLAYER_PLACED_RADIO_IEDS_COUNTER_IEDS = 0;
};

if (_activationType != 1) then {
	_logic spawn {
		hintSilent parseText "<t align='center'>You placed down an IED. </br>IED will be activate in 5 seconds.</t>";
		uisleep 5;
		CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS pushback _this;
	};
} else {
	CSE_PLAYER_PLACED_RADIO_IEDS_COUNTER_IEDS = CSE_PLAYER_PLACED_RADIO_IEDS_COUNTER_IEDS + 1;
	CSE_PLAYER_PLACED_RADIO_IEDS_IEDS pushback [_logic, format["IED %1",CSE_PLAYER_PLACED_RADIO_IEDS_COUNTER_IEDS]];
};

[format["fn_placeDownIED_IEDS %1", _logic]] call cse_fnc_debug;

_logic