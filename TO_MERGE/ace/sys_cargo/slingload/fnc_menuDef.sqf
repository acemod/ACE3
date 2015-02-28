//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

PARAMS_2(_target,_params);

if (isNil "_target") exitWith {};
if (isNull _target) exitWith {};

if (typeOf _target == "Weaponholder") exitWith { closeDialog 0 };
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
#define __ADD_SLING (localize "STR_UA_ACE_ATTACHROPECARGO")
#define __REM_SLING (localize "STR_UA_ACE_DETACHROPECARGO")
#define __ADD_SLING_HELI (localize "STR_UA_ACE_ATTACHROPECARGOHELI")

_displayNameCargo = getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName");
if (_displayNameCargo == "") then { _displayNameCargo = typeOf _target; };

if (_target isKindOf "StaticShip") then {_target = objNull}; // disable LHD, which is a "building"/"strategic"/"StaticShip"

if (isNull _target) exitWith {};

_cargoHasSlingRope = _target getVariable [QGVAR(hasSlingRope), false];
_cargoIsLoaded = _target getVariable [QGVAR(isLoaded), false];
_cargoIsEmpty = ({alive _x} count crew _target == 0);
_cargoIsAttachedToSomethingElse = (_target getVariable ["ace_puller_attached",false]); // || _cargo getVariable ["",false]) // TODO: sys_maintenance_towing // TODO: set a more global var then system specific
_playerHasSlingRope = ("ACE_Rope_M5" in magazines player);

_playerInCargo = vehicle player != player && {player in (vehicle _target)};
TRACE_5("",_cargoHasSlingRope,_cargoIsLoaded,_cargoIsEmpty,_playerHasSlingRope,_playerInCargo);

private["_helicopter"];
_nearestHelicopter = if (isNull _target) then {objNull} else {nearestObject [_target, "Helicopter"]};
_nearestHelicopterDist = _target distance _nearestHelicopter;
_helicopter = if (!(isNull _nearestHelicopter) && {isEngineOn _nearestHelicopter} && {_nearestHelicopterDist < 11}) then { _nearestHelicopter; } else { objNull; }; // If helicopter is flying and distance to cargo < minDist
// TODO: Might get fuzzy with the fucking LHD crap carrier

_helicopterAvailable = (alive _helicopter && {!isNull _helicopter});
TRACE_1("",_helicopterAvailable);

_displayNameHelicopter = "";
_helicopterCanLift = false;
_helicopterIsTransporting = true; // true, Failsafe #1

if (_helicopterAvailable) then {
	_displayNameHelicopter = getText (configFile >> "CfgVehicles" >> typeOf _helicopter >> "displayName");
	if (_displayNameHelicopter == "") then { _displayNameHelicopter = typeOf _helicopter; };

	_helicopterIsTransporting = _helicopter getVariable [QGVAR(isTransporting), false];
	_helicopterCanLift = (getNumber(configFile >> "CfgVehicles" >> typeOf _helicopter >> "ACE_canLift") == 1);

	TRACE_1("",_displayNameHelicopter);
	TRACE_1("",_helicopterIsTransporting);
	TRACE_1("",_helicopterCanLift);
};

_disable = _helicopter getVariable [QUOTE(ACE_Slingload_Rule),[]];
if (typeOf _target in _disable) exitWith {
	(localize "STR_DN_ACE_HOOKERBLOCKAGE") spawn ACE_fnc_visual;
};

_weight = getNumber(configFile >> "CfgVehicles" >> typeOf _helicopter >> "ACE_MaxLoad") > _target call ace_sys_cargo_fnc_weight; // TODO: Alternative mass and/or ACE_Weight

GVAR(targets) = [_target,_helicopter];

// Attach sling rope to x
_menus =
[
	[
		["main", _displayNameCargo, _menuRsc],
		[
			// Attach sling rope to cargo
			[__ADD_SLING,
				{ [(GVAR(targets) select 0)] spawn FUNC(attachSlingRopeToCargo) },
				"", "", "", DIK_N, 1, alive _target && {!_cargoHasSlingRope} && {_playerHasSlingRope} && {!_playerInCargo} && {ACE_SELFINTERACTION_RESTRICTED}],
			// Detach sling rope from cargo
			[__REM_SLING,
				{ [(GVAR(targets) select 0)] spawn FUNC(detachSlingRopeFromCargo) },
				"", "", "", DIK_N, 1, alive _target && {_cargoHasSlingRope} && {!_cargoIsLoaded} && {!_playerInCargo} && {ACE_SELFINTERACTION_RESTRICTED}],
			// Attach sling rope to helicopter
			[format[(__ADD_SLING_HELI+"%1"), (if (_nearestHelicopterDist < 15) then {format[" %1m", (round ((_target distance _nearestHelicopter)*10))/10]} else {""})],
				{ GVAR(targets) spawn FUNC(attachSlingRopeToHelicopter) },
				"", "", "", DIK_G,
				_cargoIsEmpty && {!_cargoIsAttachedToSomethingElse} && {(_helicopterAvailable || {!isNull _nearestHelicopter})} && {!_helicopterIsTransporting} && {_helicopterCanLift} && {_weight},
				alive _target && {_cargoHasSlingRope} && {!_cargoIsLoaded} && {!_playerInCargo} && {ACE_SELFINTERACTION_RESTRICTED}]
		]
	]
];

//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef // return value
