 /*
  * Author: KoffeinFlummi, bux578, esteldunedain, commy2
  * Initializes the respawn module.
  *
  * Arguments:
  * 0: Logic <OBJECT>
  * 1: Synced units <ARRAY>
  * 2: Activated <BOOL>
  *
  * Return Value:
  * None
  *
  * Example:
  * [logic, [ACE_Player], true] call ace_respawn_fnc_module
  *
  * Public: No
  */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(SavePreDeathGear), "SavePreDeathGear"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(RemoveDeadBodiesDisconnected), "RemoveDeadBodiesDisconnected"] call EFUNC(common,readSettingFromModule);

if (isServer && GVAR(RemoveDeadBodiesDisconnected)) then {
    addMissionEventHandler ["HandleDisconnect", {
        [{
            params ["_unit"];

            if (!alive _unit) then {
                deleteVehicle _unit;
            };
        }, _this, 4, 1] call EFUNC(common,waitAndExecute);
        false
    }];
};

diag_log text "[ACE]: Respawn Module Initialized.";
