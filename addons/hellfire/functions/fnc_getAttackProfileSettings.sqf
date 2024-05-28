#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets attack profile parameters for first run of hellfire attack profile function
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [[], [], []] call ace_hellfire_fnc_getAttackProfileSettings;
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "_launchParams"];
_launchParams params ["", "", "", "_attackProfile"];
_firedEH params ["","","","","","","_projectile"];

private _attackConfig = configFile >> QEGVAR(missileguidance,AttackProfiles) >> _attackProfile;

// Launch (clearing terrain mask for LO/HI):
private _configLaunchHeightClear = getNumber (_attackConfig >> QGVAR(launchHeightClear));

// Get starting stage
private _startingStage = if (_configLaunchHeightClear > 0) then {
    STAGE_LAUNCH; // LOAL-HI / LO
} else {
    if (_seekerTargetPos isEqualTo [0,0,0]) then {
        STAGE_SEEK_CRUISE; // LOAL-DIR
    } else {
        STAGE_ATTACK_CRUISE // LOBL
    };
};

// Set data in param array
_attackProfileStateParams set [0, _startingStage];
_attackProfileStateParams set [1, _configLaunchHeightClear];

TRACE_1("new shot settings",_attackProfileStateParams);
