/*
  Name: ACE_Respawn_fnc_moduleRallypoint
  
  Author(s):
    commy2
  
  Description:
    initializes the Rallypoint module
  
  Parameters:
    0: OBJECT - logic
    1: ARRAY<OBJECT> - synced units
    2: BOOLEAN - activated
  
  Returns:
    VOID
*/

 #include "script_component.hpp"
 
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

{
  _x setVariable ["ACE_canMoveRallypoint", true];
} forEach _units;

diag_log text "[ACE]: Rallypoint Module Initialized.";
