/*
  Name: ACE_SwitchUnits_fnc_module
  
  Author(s):
    bux578
  
  Description:
    Initializes the SwitchUnits module
  
  Parameters:
    0: OBJECT - module logic
    1: ARRAY<OBJECT> - list of affected units
    2: BOOLEAN - isActivated
  
  Returns:
    BOOLEAN (Good practice to include one)
*/

#include "script_component.hpp"

if !(isServer) exitWith {};

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

GVAR(Module) = true;

[QGVAR(EnableSwitchUnits), true] call EFUNC(common,setParameter);

[_logic, QGVAR(SwitchToWest), "SwitchToWest"] call EFUNC(common,readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToEast), "SwitchToEast"] call EFUNC(common,readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToIndependent), "SwitchToIndependent"] call EFUNC(common,readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToCivilian), "SwitchToCivilian"] call EFUNC(common,readBooleanParameterFromModule);
         
[_logic, QGVAR(EnableSafeZone), "EnableSafeZone"] call EFUNC(common,readBooleanParameterFromModule);
[_logic, QGVAR(SafeZoneRadius), "SafeZoneRadius"] call EFUNC(common,readNumericParameterFromModule);

diag_log text "[ACE]: SwitchUnits Module Initialized.";
