#include "script_component.hpp"

ADDON = false;

PREP(checkInventory);
PREP(checkItem);
PREP(getAllReportingModes);
PREP(getDeviceData);
PREP(getMagazineID);
PREP(getOwnedDevices);
PREP(handleAddDeviceData);
PREP(handleItemCreated);
PREP(handleKilled);
PREP(handleEngine);
PREP(handleVehicleDeviceKilled);

PREP(handleUpdateDeviceOwner);
PREP(handleUpdateDeviceGroup);
PREP(handleUpdateDeviceElementType);
PREP(handleUpdateDeviceCallsign);
PREP(handleUpdateDeviceKeys);
PREP(handleUpdateDeviceAppData);

PREP(handleDeviceDataChanged);
PREP(handleRegisteredEncryptionKeysChanged);
PREP(handleRegisteredModeChanged);
PREP(handleColorFilteringChanged);
PREP(handleDeviceOpened);
PREP(handleDeviceClosed);

PREP(handleRequestAllData);
PREP(isDeviceOwned);
PREP(setDeviceOwner);
PREP(validateInventory);
PREP(deviceDataToMapData);
PREP(getSizeIcon);
PREP(getTypeIcon);
PREP(getInterfaces);
PREP(vehicleInit);
PREP(encryptionKeyMatch);
PREP(updateRegisteredEncryptionKeys);
PREP(updateRegisteredModes);
PREP(removeDeviceByOwner);

PREP(handleSyncedArrayPushback);
PREP(handleSyncedArrayDelete);
PREP(handleSyncedArrayUpdate);
PREP(syncedArrayPushback);
PREP(syncedArrayDelete);
PREP(syncedArrayUpdate);

PREP(getGroupData);
PREP(createGroup);
PREP(updateGroup);
PREP(getGroupColor);

PREP(getEncryptionKey);
PREP(generateEncryptionKey);
PREP(addDefaultSideEncryptionKey);
PREP(updateAllEncryptionKeys);
PREP(updateAvailableDevicesPosition);
PREP(handleUpdateAllEncryptionKeys);


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

private ["_a", "_b", "_g", "_r"];
_r = profilenamespace getvariable ['Map_BLUFOR_R',0];
_g = profilenamespace getvariable ['Map_BLUFOR_G',0.8];
_b = profilenamespace getvariable ['Map_BLUFOR_B',1];
_a = profilenamespace getvariable ['Map_BLUFOR_A',0.8];
GVAR(colorWest) = [_r,_g,_b,_a];


["WEST", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);
["EAST", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);
["IND", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);

ADDON = true;
