#include "script_component.hpp"

// Add shell config action to vehicles that can fire it
if (hasInterface) then {
    ["turret", {
        params ["_player", "_turret"];
        TRACE_2("turret",_player,_turret);
        if (_turret isNotEqualTo [0]) exitWith {};
        private _vehicle = vehicle _player;
        if ((!alive _player) || {!alive _vehicle} || {_vehicle getVariable [QGVAR(copperhead_actionHandled), false]}) exitWith { TRACE_1("exit?"); };

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
