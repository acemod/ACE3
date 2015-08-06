/*
 * Author: Glowbal
 * Open the medical menu for target
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_interactionTarget"];
_interactionTarget = _this select 0;

if (dialog || isNull _interactionTarget) exitwith {
	disableSerialization;

	private "_display";
	_display = uiNamespace getVariable QGVAR(medicalMenu);
	if (!isnil "_display") then {
		closeDialog 314412;
	};
};

GVAR(INTERACTION_TARGET) = _interactionTarget;

createDialog QGVAR(medicalMenu);
GVAR(lastOpenedOn) = ACE_time;
