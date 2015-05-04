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


// Synced data collections
GVAR(saluteReports) = [];
GVAR(devices) = [];
GVAR(routes) = [];
GVAR(messages) = [];
GVAR(requests) = [];
GVAR(orbatElements) = [];

// local data collections
GVAR(colorFilters) = [];

ADDON = true;
