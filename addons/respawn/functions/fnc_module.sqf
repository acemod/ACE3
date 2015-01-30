 /*
  Name: ACE_Respawn_fnc_module
  
  Author(s):
    KoffeinFlummi, bux578, CAA-Picard, commy2
  
  Description:
    initializes the respawn module
  
  Parameters:
    0: OBJECT - logic
    1: ARRAY<OBJECT> - synced units
    2: BOOLEAN - activated
  
  Returns:
    VOID
*/

#include "script_component.hpp"

if !(isServer) exitWith {};

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(SavePreDeathGear),             "SavePreDeathGear"]             call EFUNC(common,readBooleanParameterFromModule);
[_logic, QGVAR(RemoveDeadBodiesDisconnected), "RemoveDeadBodiesDisconnected"] call EFUNC(common,readBooleanParameterFromModule);

if (isServer) then {
    if (GVAR(RemoveDeadBodiesDisconnected)) then {
        _fnc_deleteDisconnected = {
            _this spawn {
                _unit = _this select 0;

                sleep 4;

                if (!alive _unit) then {
                    deleteVehicle _unit;
                };
            };
            false
        };

        addMissionEventHandler ["HandleDisconnect", _fnc_deleteDisconnected];
    };
};

diag_log text "[ACE]: Respawn Module Initialized.";
