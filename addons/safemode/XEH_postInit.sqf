// by esteldunedain
#include "script_component.hpp"

//["Soldier", {_player = ACE_player; if (currentWeapon _player in (_player getVariable [QGVAR(safedWeapons), []])) then {[false] call FUNC(setSafeModeVisual)}] call EFUNC(common,addInfoDisplayEventHandler);
//@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"


// Add keybinds
["ACE3", QGVAR(safeMode), localize "STR_ACE_SafeMode_SafeMode",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);
    true
},
{false},
[41, [false, true, false]], false] call cba_fnc_addKeybind;

GVAR(safetyLockedOnInteract) = false;

["interactMenuOpened", {
	private ["_safedWeapons"];
	_safedWeapons = ACE_player getVariable [QGVAR(safedWeapons), []];

	if (currentWeapon ACE_player in _safedWeapons) exitWith {};
	GVAR(safetyLockedOnInteract) = true;

	[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);

}] call ace_common_fnc_addEventHandler;

["interactMenuClosed", {
	if (GVAR(safetyLockedOnInteract)) then {
		[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(unlockSafety);
		GVAR(safetyLockedOnInteract) = false;
	};
}] call ace_common_fnc_addEventHandler;
