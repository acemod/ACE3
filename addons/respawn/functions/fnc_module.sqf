/*
 * Author: KoffeinFlummi, bux578, CAA-Picard, commy2
 *
 * Initializes the respawn module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
if !(isServer) exitWith {};

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(SavePreDeathGear),             "SavePreDeathGear"]             call EFUNC(Core, readBooleanParameterFromModule);
[_logic, QGVAR(RemoveDeadBodiesDisonncected), "RemoveDeadBodiesDisonncected"] call EFUNC(Core, readBooleanParameterFromModule);

if (isServer) then {
  if (GVAR(RemoveDeadBodiesDisonncected)) then {
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
