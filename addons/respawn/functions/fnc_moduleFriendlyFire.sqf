/*
  Name: ACE_Respawn_fnc_moduleFriendlyFire
  
  Author(s):
    commy2
  
  Description:
    initializes the Friendly Fire Messages module
  
  Parameters:
    0: OBJECT - logic
    1: ARRAY<OBJECT> - synced units
    2: BOOLEAN - activated
  
  Returns:
    VOID
*/

#include "script_component.hpp"

_this spawn {
    PARAMS_3(_logic,_units,_activated); 

    if !(_activated) exitWith {};

    if (isServer) then {
        missionNamespace setVariable [QGVAR(showFriendlyFireMessage), true];
        publicVariable QGVAR(showFriendlyFireMessage);
    };

    diag_log text "[ACE]: Friendly Fire Messages Module Initialized.";
};
