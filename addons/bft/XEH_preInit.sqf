#include "script_component.hpp"

ADDON = false;

PREP(checkInventory);
PREP(checkItem);
PREP(getDeviceData);
PREP(getMagazineID);
PREP(getOwnedDevices);
PREP(handleAddDeviceData);
PREP(handleItemCreated);
PREP(handleUpdateDeviceOwner);
PREP(handleRequestAllData);
PREP(isDeviceOwned);
PREP(setDeviceOwner);
PREP(validateInventory);
PREP(deviceDataToMapData);
PREP(getSizeIcon);
PREP(getTypeIcon);
PREP(vehicleInit);
PREP(encryptionKeyMatch);
PREP(updateRegisteredEncryptionKeys);
PREP(updateRegisteredModes);

PREP(handleSyncedArrayPushback);
PREP(handleSyncedArrayDelete);
PREP(handleSyncedArrayUpdate);
PREP(syncedArrayPushback);
PREP(syncedArrayDelete);
PREP(syncedArrayUpdate);

// Synced data collections
GVAR(syncedArrayVariables) = [];
GVAR(saluteReports) = [];
GVAR(deviceData) = [];
GVAR(routes) = [];
GVAR(messages) = [];
GVAR(requests) = [];
GVAR(orbatElements) = [];


GVAR(registeredEncyptionKeys) = ["DEFAULT_SIDE_ENCYPTION"];
GVAR(registeredViewModes) = ["FBCB2"];
GVAR(availableDevices) = [];

// local data collections
GVAR(colorFilters) = [];

GVAR(localOwnedEncyptionKeys) = [];

GVAR(updateAvailableDevicesPositions) = true;

ADDON = true;
