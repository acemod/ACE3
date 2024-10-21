#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, ulteq
 * Calculates the current metabolic costs.
 * Calculation is done according to the Pandolf/Wojtowicz formulas.
 *
 * Arguments:
 * 0: Mass of unit <NUMBER>
 * 1: Terrain gradient <NUMBER>
 * 2: Terrain factor <NUMBER>
 * 3: Speed <NUMBER>
 *
 * Return Value:
 * Metabolic cost <NUMBER>
 *
 * Example:
 * [840, 20, 1, 4] call ace_advanced_fatigue_fnc_getMetabolicCosts
 *
 * Public: No
 */

params ["_gearMass", "_terrainGradient", "_terrainFactor", "_speed"];

// Get the current duty
private _duty = GVAR(animDuty);

{
    _duty = if (_x isEqualType 0) then {
        _duty * _x
    } else {
        _duty * (ACE_player call _x)
    };
} forEach (values GVAR(dutyList));

// Metabolic cost for walking and running is different
if (_speed > 2) then {
    // Running
    #ifdef DEBUG_MODE_FULL
    private _baseline = 2.1 * SIM_BODYMASS + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + (SIM_BODYMASS + _gearMass) * 0.9 * (_speed ^ 2);
    private _graded = 2.1 * SIM_BODYMASS + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.9 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient);
    private _terrainImpact = abs ((_graded / _baseline) - 1);
    hintSilent format ["FwdAngle: %1 | SideAngle: %2 \n TerrainFactor: %3 | TerrainGradient: %4 \n TerrainImpact: %5 \n Speed: %6 | CarriedLoad: %7 \n Duty: %8 | Work: %9",
        _fwdAngle toFixed 1, //IGNORE_PRIVATE_WARNING ["_fwdAngle", "_sideAngle"]; // from mainLoop
        _sideAngle toFixed 1,
        _terrainFactor toFixed 2,
        _terrainGradient toFixed 1,
        _terrainImpact toFixed 2,
        _speed toFixed 2,
        _gearMass toFixed 1,
        _duty toFixed 2,
        round (_graded * BIOMECH_EFFICIENCY * _duty)
    ];
    #endif

    (
        2.1 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.9 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
} else {
    // Walking
    #ifdef DEBUG_MODE_FULL
    private _baseline = 1.05 * SIM_BODYMASS + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + (SIM_BODYMASS + _gearMass) * 1.15 * (_speed ^ 2);
    private _graded = 1.05 * SIM_BODYMASS + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient);
    private _terrainImpact = abs ((_graded / _baseline) - 1);
    hintSilent format ["FwdAngle: %1 | SideAngle: %2 \n TerrainFactor: %3 | TerrainGradient: %4 \n TerrainImpact: %5 \n Speed: %6 | CarriedLoad: %7 \n Duty: %8 | Work: %9",
        _fwdAngle toFixed 1,
        _sideAngle toFixed 1,
        _terrainFactor toFixed 2,
        _terrainGradient toFixed 1,
        _terrainImpact toFixed 2,
        _speed toFixed 2,
        _gearMass toFixed 1,
        _duty toFixed 2,
        round (_graded * BIOMECH_EFFICIENCY * _duty)
    ];
    #endif

    (
        1.05 * SIM_BODYMASS
        + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
};
