/*
 * Author: Garth 'L-H' de Wet
 * Starts the setup process for the passed explosive. Player only.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname of explosive to place. (CfgMagazine class) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_SetupExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"
closeDialog 0;
private ["_unit", "_class"];
_unit = _this select 0;
_class = _this select 1;
GVAR(placer) = _unit;
// TODO: check MP performance and MP compatible.
GVAR(Setup) = createVehicle [getText(ConfigFile >> "CfgMagazines" >> _class >> "ACE_SetupObject"),[0,0,-10000],[], 0, "NONE"];

GVAR(Setup) enableSimulationGlobal false;
GVAR(Setup) setVariable [QGVAR(class), _class];
private "_container";
_container = [GVAR(Setup),"",QUOTE(PATHTOF(UI\Explosives_Menu_ca.paa)),"",{}, {true}, 4] call EFUNC(interact_menu,addAction);
[_container,"Set Trigger", QUOTE(PATHTOF(UI\Explosives_Menu_ca.paa)),"",
{[_target getVariable QGVAR(class),_target] call FUNC(openTriggerSelectionUI)}, {true}, 4] call EFUNC(interact_menu,addAction);
[_container,"Pick up", QUOTE(PATHTOF(UI\Explosives_Menu_ca.paa)),"",
{ACE_Player addMagazine (_target getVariable QGVAR(class));deleteVehicle _target;}, {true}, 4] call EFUNC(interact_menu,addAction);

[_unit, "ACE_Explosives", true] call EFUNC(common,setForceWalkStatus);
GVAR(TweakedAngle) = 180;

[QGVAR(Placement),"OnEachFrame", {
  private "_player";
  _player = ACE_player;
  if (GVAR(placer) != _player) exitWith {
    call FUNC(place_Cancel);
  };
  GVAR(pfeh_running) = true;
  _pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
  GVAR(Setup) setPosATL _pos;
  if (ACE_Modifier == 0) then {
    GVAR(Setup) setDir (GVAR(TweakedAngle) + getDir _player);
  };
}] call CALLSTACK(BIS_fnc_addStackedEventHandler);

[localize "STR_ACE_Explosives_PlaceAction", localize "STR_ACE_Explosives_CancelAction",
  localize "STR_ACE_Explosives_ScrollAction"] call EFUNC(interaction,showMouseHint);
_unit setVariable [QGVAR(Place), [_unit, "DefaultAction",
  {GVAR(pfeh_running) AND !isNull (GVAR(Setup))}, {call FUNC(place_Approve);}] call EFUNC(common,AddActionEventHandler)];
_unit setVariable [QGVAR(Cancel), [_unit, "MenuBack",
  {GVAR(pfeh_running) AND !isNull (GVAR(Setup))}, {call FUNC(place_Cancel);}] call EFUNC(common,AddActionEventHandler)];
