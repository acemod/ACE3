#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, Rocko, Rommel, Ruthberg
 * Handle new sound souce near ace_player and apply hearing damage.
 *
 * Arguments:
 * 0: Strength of ear ringing <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 10 call ace_hearing_fnc_earRinging
 *
 * Public: No
 */

params ["_strength"];

if (_strength < 0.05) exitWith {};
if (!isNull curatorCamera) exitWith {};
if (!GVAR(enabledForZeusUnits) && {player != ACE_player}) exitWith {};

TRACE_2("adding",_strength * GVAR(damageCoefficent),GVAR(deafnessDV));

// Handle volume reduction by electronic hearing protection
if (
    _strength >= EHP_MIN_STRENGTH
    && GVAR(enableNoiseDucking)
    && {ACE_player getVariable ["ACE_hasEHP", false] || {ACE_player getVariable ["ACE_hasBuiltInEHP", false]}}
) then {
    if (GVAR(ehpTimeout) == -1) then {
        [QGVAR(ehp), EHP_REDUCTION * GVAR(volumeAttenuation), true] call EFUNC(common,setHearingCapability);

        [{
            CBA_missionTime >= GVAR(ehpTimeout)
        }, {
            [QGVAR(ehp), 1, true, EHP_FADE_IN] call EFUNC(common,setHearingCapability);
            GVAR(ehpTimeout) = -1;
        }] call CBA_fnc_waitUntilAndExecute;
    };

    GVAR(ehpTimeout) = CBA_missionTime + EHP_TIMEOUT;
};

GVAR(deafnessDV) = GVAR(deafnessDV) + (_strength * GVAR(damageCoefficent));
