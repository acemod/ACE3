 /*
  Name: ACE_Respawn_fnc_module

  Author(s):
    KoffeinFlummi, bux578, esteldunedain, commy2

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

PARAMS_3(_logic,_units,_activated); 

if !(isServer) exitWith {};

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(SavePreDeathGear),             "SavePreDeathGear"]             call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(RemoveDeadBodiesDisconnected), "RemoveDeadBodiesDisconnected"] call EFUNC(common,readSettingFromModule);

if (isServer) then {
    if (GVAR(RemoveDeadBodiesDisconnected)) then {
        private "_fnc_deleteDisconnected";
        _fnc_deleteDisconnected = {
            _this spawn {
                PARAMS_1(_unit);

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
