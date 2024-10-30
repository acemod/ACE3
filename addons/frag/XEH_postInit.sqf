#include "script_component.hpp"

["CBA_settingsInitialized", {
    [{
        params ["_projectile", "_posASL"];

        // check if a projectile is blacklisted and that it will inflict damage when it explodes to avoid
        // multiple events being sent from different clients for one explosion
        if (_projectile getVariable [QGVAR(blacklisted), false] || !(_projectile getShotInfo 5)) exitWith {};

        private _ammo = typeOf _projectile;
        if (GVAR(reflectionsEnabled)) then {
            [_posASL, _ammo] call FUNC(doReflections);
        };
        if (GVAR(enabled) && _ammo call FUNC(shouldFrag)) then {
            // only let a unit make a frag event once per second
            private _shotParents = getShotParents _projectile;
            private _instigator = _shotParents select !isNull (_shotParents#1);
            if (CBA_missionTime < (_instigator getVariable [QGVAR(nextFragEvent), -1])) exitWith { TRACE_1("skip",typeOf _instigator) };
            _instigator setVariable [QGVAR(nextFragEvent), CBA_missionTime + ACE_FRAG_FRAG_UNIT_HOLDOFF];

            // Wait a frame to make sure it doesn't target the dead
            [{
                [QGVAR(frag_eh), _this] call CBA_fnc_serverEvent
            }, [_posASL, _ammo]] call CBA_fnc_execNextFrame;
        };
    }] call EFUNC(common,addExplosionEventHandler);

    ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
#ifdef DEBUG_MODE_DRAW
    [QGVAR(dev_clearTraces), LINKFUNC(dev_clearTraces)] call CBA_fnc_addEventHandler;

    if (!hasInterface) exitWith {};
    GVAR(dev_drawPFEH) = [LINKFUNC(dev_drawTrace), 0] call CBA_fnc_addPerFrameHandler;
    ["ace_interact_menu_newControllableObject", {
        params ["_type"];

        private _action = [
            QGVAR(debugReset),
            "Reset ACE Frag traces",
            "",
            {[QGVAR(dev_clearTraces), []] call CBA_fnc_globalEvent;},
            {GVAR(dev_trackLines) isNotEqualTo createHashMap}
        ] call EFUNC(interact_menu,createAction);

        [_type, 1, ["ACE_SelfActions"], _action, true] call EFUNC(interact_menu,addActionToClass);
    }] call CBA_fnc_addEventHandler;
#endif
}] call CBA_fnc_addEventHandler;

#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
