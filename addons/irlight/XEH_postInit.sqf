#include "script_component.hpp"

call FUNC(initItemContextMenu);

["ACE3 Equipment", QGVAR(hold), LLSTRING(MomentarySwitch), {
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {};

    // Save current weapon state to reapply later
    private _weaponState = (weaponState ACE_player) select [0, 3];

    action ["GunLightOn", ACE_player];
    action ["IRLaserOn", ACE_player];

    ACE_player selectWeapon _weaponState;

    true
}, {
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {};

    // Save current weapon state to reapply later
    private _weaponState = (weaponState ACE_player) select [0, 3];

    action ["GunLightOff", ACE_player];
    action ["IRLaserOff", ACE_player];

    ACE_player selectWeapon _weaponState;
}] call CBA_fnc_addKeybind;
