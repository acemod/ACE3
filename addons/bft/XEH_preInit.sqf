#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(pendingIdAssignmentList) = [];

// Synced data collections
GVAR(syncedArrayVariables) = [];
GVAR(saluteReports) = [];
GVAR(deviceData) = [];
GVAR(routes) = [];
GVAR(messages) = [];
GVAR(requests) = [];
GVAR(orbatElements) = [];

GVAR(registeredEncyptionKeys) = [];
GVAR(registeredViewModes) = [];
GVAR(availableDevices) = [];
GVAR(allReportingModes) = [] call FUNC(getAllReportingModes);

// local data collections
GVAR(colorFilters) = [[1, [1,0,0,1]]];

GVAR(localOwnedEncyptionKeys) = [];
GVAR(currentOpenedDevice) = [];

GVAR(colorWest) = [
    profileNamespace getvariable ['Map_BLUFOR_R', 0],
    profileNamespace getvariable ['Map_BLUFOR_G', 0.8],
    profileNamespace getvariable ['Map_BLUFOR_B', 1],
    profileNamespace getvariable ['Map_BLUFOR_A', 0.8]
];

if (isServer) then {
    ["WEST", "west-key" /*call FUNC(generateEncryptionKey)*/] call FUNC(addDefaultSideEncryptionKey);
    ["EAST", "east-key" /*call FUNC(generateEncryptionKey)*/] call FUNC(addDefaultSideEncryptionKey);
    ["IND", "ind-key" /*call FUNC(generateEncryptionKey)*/] call FUNC(addDefaultSideEncryptionKey);
};

ADDON = true;
