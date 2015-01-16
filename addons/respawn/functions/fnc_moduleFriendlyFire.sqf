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
    _logic = _this select 0;
    _units = _this select 1;
    _activated = _this select 2;

    if !(_activated) exitWith {};

    if (isServer) then {
        _varName = QGVAR(showFriendlyFireMessage);

        missionNamespace setVariable [_varName, true];
        publicVariable _varName;
    };

    diag_log text "[ACE]: Friendly Fire Messages Module Initialized.";
};
