#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Makes a medic heal the next unit that needs treatment.
 *
 * Arguments:
 * Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_medical_ai_fnc_healUnit
 *
 * Public: No
 */

// Player will have to do this manually of course
if ([_this] call EFUNC(common,isPlayer)) exitWith {};
// Can't heal other units when unconscious
if IS_UNCONSCIOUS(_this) exitWith {
    _this setVariable [QGVAR(currentTreatment), nil];
};

// Find next unit to treat
private _healQueue = _this getVariable [QGVAR(healQueue), []];
private _target = _healQueue param [0, objNull];

// If unit died or was healed, be lazy and wait for the next tick
// If the unit can't be healed, go to the next unit to be healed
if (!alive _target || {!(_target call FUNC(isInjured))} || {
    private _treatmentEvent = (_this getVariable [QGVAR(currentTreatment), []]) param [2, ""];

    // Target still needs healing, but the healer doesn't have the required items (only happens if GVAR(requireItems) != 0) or needs to wait
    (_treatmentEvent select [0, 6]) == "#needs"
}) exitWith {
    _this forceSpeed -1;
    _target forceSpeed -1;
    _healQueue deleteAt 0;
    _this setVariable [QGVAR(healQueue), _healQueue];
    // return to formation instead of going where the injured unit was if it healed itself in the mean time
    _this doFollow leader _this;
    _this setVariable [QGVAR(nextMoveOrder), nil];
    _this setVariable [QGVAR(currentTreatment), nil];

    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 finished healing %2", _this, _target];
    #endif
};

// Move to target...
if (_this distance _target > 2.5) exitWith {
    _this setVariable [QGVAR(currentTreatment), nil];
    if (CBA_missionTime >= (_this getVariable [QGVAR(nextMoveOrder), CBA_missionTime])) then {
        _this setVariable [QGVAR(nextMoveOrder), CBA_missionTime + 10];

        // Medic, when doing a lot of treatment, moves away from injured over time (because of animations)
        // Need to allow the medic to move back to the injured again
        _this forceSpeed -1;
        _this doMove getPosATL _target;
        #ifdef DEBUG_MODE_FULL
        systemChat format ["%1 moving to %2", _this, _target];
        #endif
    };
};

// ...and make sure medic and target don't move
_this forceSpeed 0;
_target forceSpeed 0;

[_this, _target] call FUNC(healingLogic);
