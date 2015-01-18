/**
 * fn_openMenu.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_interactionTarget"];
_interactionTarget = objNull;
if (count _this > 0) then {
    _interactionTarget = _this select 0;

} else {
    _interactionTarget = cursortarget;
    if (isNull _interactionTarget) then {
        _interactionTarget = player;
    };
    if (_interactionTarget distance player > 5 || !(_interactionTarget isKindOf "CaManBase")) then {
        _interactionTarget = player;
    };
};

if (isNull _interactionTarget) then {
    _interactionTarget = player;
};
GVAR(INTERACTION_TARGET) = _interactionTarget;
createDialog QGVAR(medicalMenu);

["Medical_onMenuOpened", [ACE_player, _interactionTarget]] call ace_common_fnc_localEvent;
