/*
   * Author: joko // Jonas
   * Add the Reserve Parachute to Units or Save Backpack if is a Parachute in Unit
   *
   * Arguments:
   * None
   *
   * Return Value:
   * 0: Unit
   * 1: getAllGear-Array
   *
   * Example:
   * None
   *
   * Public: No
   */
  #include "script_component.hpp"
  private ["_unit","_backpack"];
  _unit = _this select 0;
  _backpack = (_this select 1) select 6 ;
  if ((vehicle _unit) isKindOf "ParachuteBase" && backpack ACE_player == "" && !(_unit getVariable [QGVAR(chuteIsCut),false]) && (_unit getvariable [QGVAR(hasReserve),false])) then {
      _unit addBackpack (_unit getVariable[QGVAR(backpackClass),"ACE_NonSteerableParachute"]);
  } else {
      if ([false,true] select (getNumber(configFile >> "CfgVehicles" >> _backpack >> "ace_hasReserveParachute"))) then {
          _unit setVariable[QGVAR(backpackClass),getText(configFile >> "CfgVehicles" >> _backpack >> "ace_reserveParachute")];
      };
      if (!(_unit getVariable [QGVAR(chuteIsCut),false]) && !(animationState _unit == 'para_pilot')) then {
          _unit setVariable [QGVAR(hasReserve),[false,true] select (getNumber(configFile >> "CfgVehicles" >> _backpack >> "ace_hasReserveParachute"))];
      };
  };