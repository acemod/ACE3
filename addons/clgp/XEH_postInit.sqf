#include "script_component.hpp"

// Add shell config action to vehicles that can fire it
if (hasInterface) then {
    ["turret", {
        params ["_player", "_turret"];
        TRACE_3("turret",_player,_turret,typeOf vehicle _player);
        if (_turret isNotEqualTo [0]) exitWith {};
        private _vehicle = vehicle _player;
        if ((!alive _player) || {!alive _vehicle} || {_vehicle getVariable [QGVAR(copperhead_actionHandled), false]}) exitWith { TRACE_1("exit",_vehicle); };

        private _canFireCopperhead = false;
        {
            if ("ace_1rnd_155mm_m712" in ([_x] call CBA_fnc_compatibleMagazines)) exitWith { _canFireCopperhead = true; };
        } forEach (_vehicle weaponsTurret [0]);

        if (_canFireCopperhead) then {
            TRACE_2("adding action to object",_vehicle,typeOf _vehicle);
            private _action = [QGVAR(copperhead), LLSTRING(copperhead_action), "",
                LINKFUNC(copperhead_uiCreate), LINKFUNC(copperhead_uiCanOpen)] call EFUNC(interact_menu,createAction);
            [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
        };
        _vehicle setVariable [QGVAR(copperhead_actionHandled), true];
    }, true] call CBA_fnc_addPlayerEventHandler
};


#ifdef ENABLE_QUICK_TESTING
["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["recompile took [%1 ms]", (1000 * (_end - _start)) toFixed 1];

    if (productVersion #4 == "Diag") then {
        call compile "diag_mergeConfigFile ['P:\z\ace\addons\clgp\config.cpp']";
    };
    false
}, {false}, [33, [false, false, false]], false] call CBA_fnc_addKeybind; // F Key

 ["turret", {
    params ["_player", "_turret"];
    private _veh = vehicle _player;
    if (currentWeapon _veh == "mortar_155mm_AMOS") then {
        systemChat "loading";
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1];
        _veh loadMagazine [[0], "mortar_155mm_AMOS", "ace_1rnd_155mm_m712"];
    };
 }, true] call CBA_fnc_addPlayerEventHandler


#endif
