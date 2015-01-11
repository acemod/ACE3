/*
  Name: AGM_Explosives_fnc_SetupExplosive
  
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
    [player, "SatchelCharge_Remote_Mag", "Command"] call AGM_Explosives_fnc_SetupExplosive;
*/
_this spawn {
  private ["_unit", "_class", "_config", "_timer"];
  _unit = _this select 0;
  _class = _this select 1;
  _config = _this select 2;
  _timer = _this select 3;
  AGM_Explosives_placer = _unit;
  // Commented out due to the fact there is a distinction between who can deactivate mines and who can plant them in standard configs.
  // Would require custom config entries (AGM_ExplosiveSpecialist/AGM_Specialist) which excludes custom mods.
  //if (AGM_Explosives_RequireSpecialist && {!([_unit] call AGM_Core_fnc_isEOD)}) exitWith {};
  if (isNil "_config") then {
    _config = getArray(ConfigFile >> "CfgMagazines" >> _class >> "AGM_Triggers" >> "AGM_Triggers") select 0;
  };
  
  AGM_Explosives_Setup = getText(ConfigFile >> "CfgMagazines" >> _class >> "AGM_SetupObject") createVehicleLocal [0,0,-10000];
  
  AGM_Explosives_Setup enableSimulationGlobal false;
  AGM_Explosives_Setup setVariable ["AGM_Class", _class];
  AGM_Explosives_Setup setVariable ["AGM_Trigger", _config];
  //AGM_Explosives_Setup setVariable ["AGM_Offset", GetArray(ConfigFile >> "CfgVehicles" >> typeof AGM_Explosives_Setup >> "AGM_Offset")];
  if (!isNil "_timer") then {
    AGM_Explosives_Setup setVariable ["AGM_Timer", _timer];
  };
  
  [_unit, "AGM_Explosives", true] call AGM_Core_fnc_setForceWalkStatus;
  AGM_Explosives_TweakedAngle = 180;
  ["AGM_Explosives_Placement","OnEachFrame", {
    private "_player";
    _player = AGM_player;
    if (AGM_Explosives_placer != _player) exitWith {
      call AGM_Explosives_fnc_Place_Cancel;
    };
    AGM_Explosives_pfeh_running = true;
    _pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
    //_pos = _pos vectorAdd ((VectorDir AGM_Explosives_setup) vectorCrossProduct (AGM_Explosives_setup getVariable ["AGM_Offset", [0,0,0]]));
    AGM_Explosives_Setup setPosATL _pos;
    if (AGM_Modifier == 0) then {
      AGM_Explosives_Setup setDir (AGM_Explosives_TweakedAngle + getDir _player);
    };
  }] call BIS_fnc_addStackedEventHandler;
  [localize "STR_AGM_Explosives_PlaceAction", localize "STR_AGM_Explosives_CancelAction",localize "STR_AGM_Explosives_ScrollAction"] call AGM_Interaction_fnc_showMouseHint;
  _unit setVariable ["AGM_Explosive_Place", [_unit, "DefaultAction", {AGM_Explosives_pfeh_running AND !isNull (AGM_Explosives_setup)}, {call AGM_Explosives_fnc_Place_Approve;}] call AGM_Core_fnc_AddActionEventHandler];
  _unit setVariable ["AGM_Explosive_Cancel", [_unit, "MenuBack", {AGM_Explosives_pfeh_running AND !isNull (AGM_Explosives_setup)}, {call AGM_Explosives_fnc_Place_Cancel;}] call AGM_Core_fnc_AddActionEventHandler];
};
