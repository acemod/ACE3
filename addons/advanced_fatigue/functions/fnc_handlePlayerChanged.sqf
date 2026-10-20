#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, ulteq
 * Handles switching units (once on init and afterwards via Zeus). Also handles CBA setting change for performance factor.
 *
 * Arguments:
 * 0: New Unit <OBJECT>
 * 1: Old Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [newbob, oldbob] call ace_advanced_fatigue_fnc_handlePlayerChanged
 *
 * Public: No
 */

params ["_newUnit", "_oldUnit"];

TRACE_2("unit changed",_newUnit,_oldUnit);

if (!isNull _oldUnit) then {
    TRACE_1("remove old",_oldUnit getVariable QGVAR(animHandler));

    _oldUnit enableStamina true;
    _oldUnit removeEventHandler ["AnimChanged", _oldUnit getVariable [QGVAR(animHandler), -1]];
    _oldUnit setVariable [QGVAR(animHandler), nil];

    _oldUnit setVariable [QGVAR(ae1Reserve), GVAR(ae1Reserve)];
    _oldUnit setVariable [QGVAR(ae2Reserve), GVAR(ae2Reserve)];
    _oldUnit setVariable [QGVAR(anReserve), GVAR(anReserve)];
    _oldUnit setVariable [QGVAR(anFatigue), GVAR(anFatigue)];
    _oldUnit setVariable [QGVAR(muscleDamage), GVAR(muscleDamage)];
    _oldUnit setVariable [QGVAR(respiratoryRate), GVAR(respiratoryRate)];
};

_newUnit enableStamina false;

// Don't add a new EH if the unit respawned
if (_newUnit getVariable [QGVAR(animHandler), -1] == -1) then {
    private _animHandler = _newUnit addEventHandler ["AnimChanged", {
        GVAR(animDuty) = call FUNC(getAnimDuty);
    }];

    TRACE_1("add new",_animHandler);
    _newUnit setVariable [QGVAR(animHandler), _animHandler];
};

GVAR(ae1Reserve)      = _newUnit getVariable [QGVAR(ae1Reserve), AE1_MAXRESERVE];
GVAR(ae2Reserve)      = _newUnit getVariable [QGVAR(ae2Reserve), AE2_MAXRESERVE];
GVAR(anReserve)       = _newUnit getVariable [QGVAR(anReserve), AN_MAXRESERVE];
GVAR(anFatigue)       = _newUnit getVariable [QGVAR(anFatigue), 0];
GVAR(muscleDamage)    = _newUnit getVariable [QGVAR(muscleDamage), 0];
GVAR(respiratoryRate) = _newUnit getVariable [QGVAR(respiratoryRate), 0];

// Clean variables for respawning units
{
    _newUnit setVariable [_x, nil];
} forEach [QGVAR(ae1Reserve), QGVAR(ae2Reserve), QGVAR(anReserve), QGVAR(anFatigue), QGVAR(muscleDamage), QGVAR(respiratoryRate)];

GVAR(VO2Max)          = 35 + 20 * (_newUnit getVariable [QGVAR(performanceFactor), GVAR(performanceFactor)]);
GVAR(VO2MaxPower)     = GVAR(VO2Max) * SIM_BODYMASS * BIOMECH_EFFICIENCY * JOULES_PER_ML_O2 / 60;
GVAR(peakPower)       = VO2MAX_STRENGTH * GVAR(VO2MaxPower);

GVAR(ae1PathwayPower) = GVAR(peakPower) / (AE1_ATP_RELEASE_RATE + AE2_ATP_RELEASE_RATE + AN_ATP_RELEASE_RATE) * AE1_ATP_RELEASE_RATE * ANTPERCENT ^ 1.28 * 1.362;
GVAR(ae2PathwayPower) = GVAR(peakPower) / (AE1_ATP_RELEASE_RATE + AE2_ATP_RELEASE_RATE + AN_ATP_RELEASE_RATE) * AE2_ATP_RELEASE_RATE * ANTPERCENT ^ 1.28 * 1.362;
GVAR(aePathwayPower)  = GVAR(ae1PathwayPower) + GVAR(ae2PathwayPower);
GVAR(anPathwayPower)  = GVAR(peakPower) - GVAR(aePathwayPower);

GVAR(aeWattsPerATP)   = GVAR(ae1PathwayPower) / AE1_ATP_RELEASE_RATE;
GVAR(anWattsPerATP)   = GVAR(anPathwayPower) / AN_ATP_RELEASE_RATE;

GVAR(respiratoryBufferDivisor) = (RESPIRATORY_BUFFER - 1) / RESPIRATORY_BUFFER;
GVAR(maxPowerFatigueRatio) = 0.057 / GVAR(peakPower);

GVAR(ppeBlackoutLast) = 100;
GVAR(lastBreath)      = 0;
GVAR(animDuty)        = [_newUnit, animationState _newUnit] call FUNC(getAnimDuty);
