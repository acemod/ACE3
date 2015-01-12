/*
  Name: AGM_SwitchUnits_fnc_module
  
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

[QGVAR(EnableSwitchUnits), true] call EFUNC(Core, setParameter);

[_logic, QGVAR(SwitchToWest), "SwitchToWest"] call EFUNC(Core, readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToEast), "SwitchToEast"] call EFUNC(Core, readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToIndependent), "SwitchToIndependent"] call EFUNC(Core, readBooleanParameterFromModule);
[_logic, QGVAR(SwitchToCivilian), "SwitchToCivilian"] call EFUNC(Core, readBooleanParameterFromModule);
         
[_logic, QGVAR(EnableSafeZone), "EnableSafeZone"] call EFUNC(Core, readBooleanParameterFromModule);
[_logic, QGVAR(SafeZoneRadius), "SafeZoneRadius"] call EFUNC(Core, readNumericParameterFromModule);

diag_log text "[ACE]: SwitchUnits Module Initialized.";
