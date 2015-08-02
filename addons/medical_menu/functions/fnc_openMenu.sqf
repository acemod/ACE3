#include "script_component.hpp"

if (dialog) exitwith {
	disableSerialization;

	private "_display";
	_display = uiNamespace getVariable QGVAR(medicalMenu);
	if (!isnil "_display") then {
		closeDialog 314412;
	};

};

private ["_interactionTarget"];
_interactionTarget = objNull;
if (count _this > 0) then {
    _interactionTarget = _this select 0;

} else {
    _interactionTarget = cursortarget;
    if (isNull _interactionTarget) then {
        _interactionTarget = ACE_player;
    };
    if (_interactionTarget distance ACE_player > 5 || !(_interactionTarget isKindOf "CaManBase")) then {
        _interactionTarget = ACE_player;
    };
};

if (isNull _interactionTarget) then {
    _interactionTarget = ACE_player;
};
GVAR(INTERACTION_TARGET) = _interactionTarget;
createDialog QGVAR(medicalMenu);
