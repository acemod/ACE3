#include "script_component.hpp"

if (!hasInterface) exitWith {};


["SettingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    //Sanity checks on settings:
    if (GVAR(staminaDrainMultiplier) < 0) then {ACE_LOGERROR_2("[%1] value [%2] makes no sense", QGVAR(staminaDrainMultiplier), GVAR(staminaDrainMultiplier));};
    if (GVAR(staminaRecoveryMultiplier) < 0) then {ACE_LOGERROR_2("[%1] value [%2] makes no sense", QGVAR(staminaRecoveryMultiplier), GVAR(staminaRecoveryMultiplier));};
    if (GVAR(loadEffectOnMaxStamina) < 0) then {ACE_LOGERROR_2("[%1] value [%2] makes no sense", QGVAR(loadEffectOnMaxStamina), GVAR(loadEffectOnMaxStamina));};
    if ((GVAR(canNoLongerSprint) < 0) || {GVAR(canNoLongerSprint) > 1}) then {ACE_LOGERROR_2("[%1] value [%2] makes no sense", QGVAR(canNoLongerSprint), GVAR(canNoLongerSprint));};
    if ((GVAR(canNoLongerRun) < 0) || {GVAR(canNoLongerRun) > 1}) then {ACE_LOGERROR_2("[%1] value [%2] makes no sense", QGVAR(canNoLongerRun), GVAR(canNoLongerRun));};
    //GVAR(runCooldownAfterExhaustion) can be anything

    //Start on ACE_player (the playerChanged event could have already happened)
    if (!isNull ACE_player) then {
        [ACE_player] call FUNC(legacyFatigue);
        TRACE_1("Starting fatigue on %1", _newPlayer);
    };

    //Add EH for ACE_player change
    ["playerChanged", {
        params ["_newPlayer"];
        if (!isNull _newPlayer) then {
            TRACE_1("Starting fatigue on %1", _newPlayer);
            [_newPlayer] call FUNC(legacyFatigue);
        };
    }] call EFUNC(common,addEventHandler);

}] call EFUNC(common,addEventHandler);
