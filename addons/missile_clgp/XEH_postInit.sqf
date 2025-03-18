#include "script_component.hpp"

GVAR(copperheadMagazines) = createHashMap;

// Copperhead - Add shell interface action to vehicles that can fire it
if (hasInterface) then {
    ["turret", {
        params ["_player", "_turret"];
        TRACE_3("turret",_player,_turret,typeOf vehicle _player);
        if (_turret isNotEqualTo [0]) exitWith {};
        private _vehicle = vehicle _player;

        if ((!alive _player) || {!alive _vehicle} || {_vehicle getVariable [QGVAR(actionsAdded), false]}) exitWith {};
        _vehicle setVariable [QGVAR(actionsAdded), true];

        if (((_vehicle weaponsTurret [0]) findIf { 
            private _compatibleMagazines = compatibleMagazines _x;
            (_compatibleMagazines findIf {
                private _magazine = _x;
                GVAR(copperheadMagazines) getOrDefaultCall [_magazine, {
                    (getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(copperheadInterface))) == 1
                }, true]
            }) != -1
        }) != -1) then {
            TRACE_2("adding copperhead action to vehicle",_vehicle,typeOf _vehicle);
            private _action = [QGVAR(copperhead), LLSTRING(copperhead_action), "", LINKFUNC(copperhead_uiCreate), LINKFUNC(copperhead_uiCanOpen)] call EFUNC(interact_menu,createAction);
            [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
        };
    }, true] call CBA_fnc_addPlayerEventHandler
};


#ifdef ENABLE_QUICK_TESTING
call compileScript [QPATHTOF(dev\quickTesting.sqf)];
#endif
