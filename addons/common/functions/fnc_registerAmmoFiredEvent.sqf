/*
 * Author: esteldunedain
 * Register an ammo fired event that should be launched when ammo following a
 * given criteria is fired. The criteria is analyzed on mission start and is
 * cached.
 *
 * Arguments:
 * 0: Name of the event <STRING>
 * 1: Condition code <CODE>
 * 2: Call for the local player on foot? <BOOL>
 * 3: Call for non local players on foot? <BOOL>
 * 4: Call for non players on foot? <BOOL>
 * 5: Call for the local player vehicle? <BOOL>
 * 6: Call for non local players vehicles? <BOOL>
 * 7: Call for non players vehicles? <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_eventName", "_condition", "_fireForPlayer", "_fireForPlayerNonLocal", "_fireForNonPlayer", "_fireForPlayerVehicle", "_fireForPlayerVehicleNonLocal", "_fireForNonPlayerVehicle"];

private _fnc_addEvent = {
    params ["_namespace", "_condition"];
    if (_condition) then {
        private _events = _namespace getVariable _ammo;
        if (isNil "_events") then {
            _events = [];
            _namespace setVariable [_ammo, _events];
        };
        _events pushBack _eventName;
    };
};

private _cfgAmmo = configFile >> "CfgAmmo";
for "_i" from 0 to (count _cfgAmmo) - 1 do {
    private _ammoConfig = _cfgAmmo select _i;
    if (isClass _ammoConfig) then {
        private _ammo = configName _ammoConfig;

        // The condition code receives the following as parameter:
        // 0: Name of the ammo <STRING>
        // 1: Config of the ammo <CONFIG>
        if ([_ammo, _ammoConfig] call _condition) then {
            [GVAR(ammoFiredEvents_ForPlayer), _fireForPlayer] call _fnc_addEvent;
            [GVAR(ammoFiredEvents_ForPlayerNonLocal), _fireForPlayerNonLocal] call _fnc_addEvent;
            [GVAR(ammoFiredEvents_ForNonPlayer), _fireForNonPlayer] call _fnc_addEvent;
            [GVAR(ammoFiredEvents_ForPlayerVehicle), _fireForPlayerVehicle] call _fnc_addEvent;
            [GVAR(ammoFiredEvents_ForPlayerVehicleNonLocal), _fireForPlayerVehicleNonLocal] call _fnc_addEvent;
            [GVAR(ammoFiredEvents_ForNonPlayerVehicle), _fireForNonPlayerVehicle] call _fnc_addEvent;
        };
    };
};
