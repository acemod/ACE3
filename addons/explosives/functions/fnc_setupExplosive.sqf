/*
  Name: ACE_Explosives_fnc_SetupExplosive

  Author(s):
    Garth de Wet (LH)

  Description:
    Starts the setup process for the passed explosive.

  Parameters:
    0: OBJECT - Unit placing explosive.
    1: STRING - Classname of explosive to place. (CfgMagazine class)
    2: Config - Trigger Config
    3: NUMBER - (optional) timer

  Returns:
    Nothing

  Example:
    [player, "SatchelCharge_Remote_Mag", "Command"] call ACE_Explosives_fnc_SetupExplosive;
*/
#include "script_component.hpp"
private ["_unit", "_class", "_config", "_timer"];
_unit = _this select 0;
_class = _this select 1;
_config = _this select 2;
_timer = _this select 3;
GVAR(placer) = _unit;
// Commented out due to the fact there is a distinction between who can deactivate mines and who can plant them in standard configs.
// Would require custom config entries (ACE_ExplosiveSpecialist/ACE_Specialist) which excludes custom mods.
//if (ACE_Explosives_RequireSpecialist && {!([_unit] call ACE_Core_fnc_isEOD)}) exitWith {};
if (isNil "_config") then {
  _config = getArray(ConfigFile >> "CfgMagazines" >> _class >> "ACE_Triggers" >> "SupportedTriggers") select 0;
};

GVAR(Setup) = getText(ConfigFile >> "CfgMagazines" >> _class >> "ACE_SetupObject") createVehicleLocal [0,0,-10000];

GVAR(Setup) enableSimulationGlobal false;
GVAR(Setup) setVariable [QGVAR(Class), _class];
GVAR(Setup) setVariable [QGVAR(Trigger), _config];
//GVAR(Setup) setVariable [QGVAR(Offset), GetArray(ConfigFile >> "CfgVehicles" >> typeof GVAR(Setup) >> "ACE_Offset")];
if (!isNil "_timer") then {
  GVAR(Setup) setVariable [QGVAR(Timer), _timer];
};

[_unit, "ACE_Explosives", true] call EFUNC(Core,setForceWalkStatus);
GVAR(TweakedAngle) = 180;
[QGVAR(Placement),"OnEachFrame", {
  private "_player";
  _player = ACE_player;
  if (GVAR(placer) != _player) exitWith {
    call FUNC(place_Cancel);
  };
  GVAR(pfeh_running) = true;
  _pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
  //_pos = _pos vectorAdd ((VectorDir GVAR(Setup)) vectorCrossProduct (GVAR(Setup) getVariable [QGVAR(Offset), [0,0,0]]));
  GVAR(Setup) setPosATL _pos;
  if (ACE_Modifier == 0) then {
    GVAR(Setup) setDir (GVAR(TweakedAngle) + getDir _player);
  };
}] call CALLSTACK(BIS_fnc_addStackedEventHandler);
[localize "STR_ACE_Explosives_PlaceAction", localize "STR_ACE_Explosives_CancelAction",
  localize "STR_ACE_Explosives_ScrollAction"] call EFUNC(Interaction,showMouseHint);
_unit setVariable [QGVAR(Place), [_unit, "DefaultAction",
  {GVAR(pfeh_running) AND !isNull (GVAR(Setup))}, {call FUNC(place_Approve);}] call EFUNC(Core,AddActionEventHandler)];
_unit setVariable [QGVAR(Cancel), [_unit, "MenuBack",
  {GVAR(pfeh_running) AND !isNull (GVAR(Setup))}, {call FUNC(place_Cancel);}] call EFUNC(Core,AddActionEventHandler)];
