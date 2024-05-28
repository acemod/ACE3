#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the map helper's draw event
 * Resets arguments if not run recently
 * And starts a watchdog to detect when weapon display unloaded
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_javelin_fnc_mapHelperDraw
 *
 * Public: No
 */

if (isNil QGVAR(arguments)) then {
    TRACE_1("Starting optic draw", _this);

    // reset shooter var:
    private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
    _currentShooter setVariable ["ace_missileguidance_target", nil, false];

    GVAR(arguments) = [
        diag_frameno,       // Last run frame
        objNull,            // currentTargetObject
        0,                  // Lock Start Time
        0,                  // Next Sound timer
        -1,                 // _fireDisabledEH
        0                   // _nextTargetScan
    ];

    // Start up a watchdog for when the display is no longer shown (but might not be unloaded or null)
    [{
        if (isNull (uiNamespace getVariable ["ACE_RscOptics_javelin", displayNull])) exitWith {true};
        GVAR(arguments) params ["_lastRunFrame"];
        (diag_frameno < _lastRunFrame) || {diag_frameno > (_lastRunFrame + 1)}
    }, {
        TRACE_1("old/null display - ending optic draw",_this);
        private _fireDisabledEH = GVAR(arguments) param [4, -1];
        [_fireDisabledEH] call FUNC(enableFire);
        GVAR(arguments) = nil;
    }, []] call CBA_fnc_waitUntilAndExecute;
};

BEGIN_COUNTER(onOpticDraw);
GVAR(arguments) call FUNC(onOpticDraw);
END_COUNTER(onOpticDraw);
