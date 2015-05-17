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
PREP(handleUpdateDeviceGroup);
PREP(handleUpdateDeviceElementType);
PREP(handleUpdateDeviceCallsign);
PREP(handleUpdateDeviceKeys);
PREP(handleUpdateDeviceAppData);

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

PREP(getGroupData);
PREP(createGroup);
PREP(updateGroup);
PREP(getGroupColor);

PREP(getEncryptionKey);
PREP(generateEncryptionKey);
PREP(addDefaultSideEncryptionKey);
PREP(updateAllEncryptionKeys);
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
GVAR(registeredViewModes) = ["FBCB2"];
GVAR(availableDevices) = [];

// local data collections
GVAR(colorFilters) = [[1, [1,0,0,1]]];

GVAR(localOwnedEncyptionKeys) = [];

GVAR(updateAvailableDevicesPositions) = true;

_r = profilenamespace getvariable ['Map_BLUFOR_R',0];
_g = profilenamespace getvariable ['Map_BLUFOR_G',0.8];
_b = profilenamespace getvariable ['Map_BLUFOR_B',1];
_a = profilenamespace getvariable ['Map_BLUFOR_A',0.8];
GVAR(colorWest) = [_r,_g,_b,_a];


["NATO", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);
["EAST", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);
["IND", call FUNC(generateEncryptionKey)] call FUNC(addDefaultSideEncryptionKey);

// FOR DEBUG PURPOSE
GVAR(registeredEncyptionKeys) = ["NATO"] call FUNC(getEncryptionKey);

ADDON = true;
