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
PREP(isDeviceOwned);
PREP(setDeviceOwner);
PREP(validateInventory);
PREP(deviceDataToMapData);
PREP(getSizeIcon);
PREP(getTypeIcon);

// Synced data collections
GVAR(saluteReports) = [];
GVAR(deviceData) = [];
GVAR(routes) = [];
GVAR(messages) = [];
GVAR(requests) = [];
GVAR(orbatElements) = [];

GVAR(availableDevices) = [];

// local data collections
GVAR(colorFilters) = [];

GVAR(localOwnedEncyptionKeys) = [];

ADDON = true;
