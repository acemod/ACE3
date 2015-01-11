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

AGM_Respawn_Module = true;

[_logic, "AGM_Respawn_SavePreDeathGear", "SavePreDeathGear"] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Respawn_RemoveDeadBodiesDisonncected", "RemoveDeadBodiesDisonncected"] call AGM_Core_fnc_readBooleanParameterFromModule;

if (isServer) then {
	if (AGM_Respawn_RemoveDeadBodiesDisonncected) then {
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

diag_log text "[AGM]: Respawn Module Initialized.";
