#include "script_component.hpp"

// To support public API regardless of component settings
[QGVAR(spurt), LINKFUNC(spurt)] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(bloodDrops) = [];

    [QGVAR(bloodDropCreated), {
        params ["_bloodDrop", "_source"];

        // Add to created queue with format: [expire time, blood object, source unit]
        private _index = GVAR(bloodDrops) pushBack [CBA_missionTime + GVAR(bloodLifetime), _bloodDrop, _source];

        if (count GVAR(bloodDrops) >= GVAR(maxBloodObjects)) then {
            (GVAR(bloodDrops) deleteAt 0) params ["", "_deletedBloodDrop"];
            deleteVehicle _deletedBloodDrop;
        };

        // Start the cleanup loop
        if (_index == 0) then {
            [LINKFUNC(cleanupLoop), [], GVAR(bloodLifetime)] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};
