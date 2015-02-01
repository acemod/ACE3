/*
* fnc_selectTrigger.sqf
*
* Author: Garth 'L-H' de Wet
* Selects a trigger for an explosive.
*
* Arguments:
* 0: Magazine <STRING>
* 1: Trigger mode <STRING>
*
* Return Value:
* None
*
* Example:
* ["SatchelCharge_Remote_Mag","Timer"] call ACE_Explosives_fnc_selectTrigger;
*
* Public: No
*/
#include "script_component.hpp"
private ["_magazine","_trigger"];
closeDialog 0;
_magazine = _this select 0;
_trigger = _this select 1;
_config = ConfigFile >> "CfgACE_Triggers" >> _trigger;
call EFUNC(interaction,hideMenu);

// If the onSetup function returns true, it is handled elsewhere
if (isText(_config >> "onSetup") && {[_magazine] call compile getText (_config >> "onSetup")}) exitWith {};

[ACE_player, _magazine, _trigger] call FUNC(setupExplosive);
