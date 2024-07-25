#include "script_component.hpp"

[] call FUNC(initItemContextMenu);

addUserActionEventHandler ["headlights", "Deactivate", LINKFUNC(onLightToggled)];

["ACE3 Equipment", QGVAR(hold), LLSTRING(MomentarySwitch), {
    ACE_player action ["GunLightOn", ACE_player];
    ACE_player action ["IRLaserOn", ACE_player];
    [] call FUNC(onLightToggled);
    true
}, {
    ACE_player action ["GunLightOff", ACE_player];
    ACE_player action ["IRLaserOff", ACE_player];
    [] call FUNC(onLightToggled);
    true
}] call CBA_fnc_addKeybind;

["CBA_attachmentSwitched", {
    params ["", "", "_item"];

    private _substr = _item select [0, 8];
    if (
        ACE_player getVariable [QGVAR(isTurnedOn), false]
        && {_substr == "ACE_SPIR" || {_substr == "ACE_DBAL"}}
    ) then {
        ACE_player action ["GunLightOn", ACE_player];
        ACE_player action ["IRLaserOn", ACE_player];
    };
}] call CBA_fnc_addEventHandler;
