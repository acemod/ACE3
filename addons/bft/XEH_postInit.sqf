#include "script_component.hpp"

["bft_itemCreated", FUNC(handleItemCreated)] call EFUNC(common,addEventHandler);
["bft_addDeviceData", FUNC(handleAddDeviceData)] call EFUNC(common,addEventHandler);
["bft_updateDeviceOwner", FUNC(handleUpdateDeviceOwner)] call EFUNC(common,addEventHandler);
["bft_updateDeviceGroup", FUNC(handleUpdateDeviceGroup)] call EFUNC(common,addEventHandler);
["bft_updateDeviceElementType", FUNC(handleUpdateDeviceElementType)] call EFUNC(common,addEventHandler);
["bft_updateDeviceCallsign", FUNC(handleUpdateDeviceCallsign)] call EFUNC(common,addEventHandler);
["bft_updateDeviceKeys", FUNC(handleUpdateDeviceKeys)] call EFUNC(common,addEventHandler);
["bft_updateDeviceAppData", FUNC(handleUpdateDeviceAppData)] call EFUNC(common,addEventHandler);

["bft_syncedArrayDelete", FUNC(handleSyncedArrayDelete)] call EFUNC(common,addEventHandler);
["bft_syncedArrayPushback", FUNC(handleSyncedArrayPushback)] call EFUNC(common,addEventHandler);
["bft_syncedArrayUpdate", FUNC(handleSyncedArrayUpdate)] call EFUNC(common,addEventHandler);

if(!isServer) then {
    ["PlayerJip", {
        diag_log text format["[ACE] * JIP BFT Data Synchronization initialized"];
        ["bft_requestAllData", [player]] call EFUNC(common,serverEvent);
    }] call EFUNC(common,addEventHandler);
} else {
    ["bft_requestAllData", FUNC(handleRequestAllData)] call EFUNC(common,addEventHandler);

    [QGVAR(messages), [0, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), ["0/1", "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [2, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [3, "Message content!"]] call FUNC(syncedArrayPushback);

    [QGVAR(messages), [0, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), [2, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), ["0/1", "another content!"]] call FUNC(syncedArrayUpdate);

    [QGVAR(messages), 0] call FUNC(syncedArrayDelete);
    [QGVAR(messages), "0/1"] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 2] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 3] call FUNC(syncedArrayDelete);

    // this setvariable ["ace_bft_assignableInformation_MDFDevice", ["elementType", 0, "elementCallsign", 1]];
};

if (!hasInterface) exitWith {};

["playerInventoryChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);
["playerChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);

["bft_deviceDataChanged", FUNC(handleDeviceDataChanged)] call EFUNC(common,addEventHandler);
["bft_registeredEncryptionKeysChanged", FUNC(handleRegisteredEncryptionKeysChanged)] call EFUNC(common,addEventHandler);
["bft_registeredModeChanged", FUNC(handleRegisteredModeChanged)] call EFUNC(common,addEventHandler);
["bft_colorFilteringChanged", FUNC(handleColorFilteringChanged)] call EFUNC(common,addEventHandler);
["bft_deviceOpened", FUNC(handleDeviceOpened)] call EFUNC(common,addEventHandler);
["bft_deviceClosed", FUNC(handleDeviceClosed)] call EFUNC(common,addEventHandler);
