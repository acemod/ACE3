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

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

{
    _x setVariable ["ACE_canMoveRallypoint", true];
} forEach _units;

diag_log text "[ACE]: Rallypoint Module Initialized.";
