#include "script_component.hpp"

["bft_itemCreated", FUNC(handleItemCreated)] call CBA_fnc_addEventHandler;
["bft_addDeviceData", FUNC(handleAddDeviceData)] call CBA_fnc_addEventHandler;
["bft_updateDeviceOwner", FUNC(handleUpdateDeviceOwner)] call CBA_fnc_addEventHandler;
["bft_updateDeviceGroup", FUNC(handleUpdateDeviceGroup)] call CBA_fnc_addEventHandler;
["bft_updateDeviceElementType", FUNC(handleUpdateDeviceElementType)] call CBA_fnc_addEventHandler;
["bft_updateDeviceCallsign", FUNC(handleUpdateDeviceCallsign)] call CBA_fnc_addEventHandler;
["bft_updateDeviceKeys", FUNC(handleUpdateDeviceKeys)] call CBA_fnc_addEventHandler;
["bft_updateDeviceAppData", FUNC(handleUpdateDeviceAppData)] call CBA_fnc_addEventHandler;

["bft_syncedArrayDelete", FUNC(handleSyncedArrayDelete)] call CBA_fnc_addEventHandler;
["bft_syncedArrayPushback", FUNC(handleSyncedArrayPushback)] call CBA_fnc_addEventHandler;
["bft_syncedArrayUpdate", FUNC(handleSyncedArrayUpdate)] call CBA_fnc_addEventHandler;

["bft_vehicleDeviceKilled", FUNC(handleVehicleDeviceKilled)] call CBA_fnc_addEventHandler;

if (!isServer) then {
    ["PlayerJip", {
        diag_log text format["[ACE] * JIP BFT Data Synchronization initialized"];
        ["bft_requestAllData", [ace_player]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;
} else {
    ["bft_requestAllData", FUNC(handleRequestAllData)] call CBA_fnc_addEventHandler;

    /*[QGVAR(messages), [0, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), ["0/1", "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [2, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [3, "Message content!"]] call FUNC(syncedArrayPushback);

    [QGVAR(messages), [0, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), [2, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), ["0/1", "another content!"]] call FUNC(syncedArrayUpdate);

    [QGVAR(messages), 0] call FUNC(syncedArrayDelete);
    [QGVAR(messages), "0/1"] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 2] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 3] call FUNC(syncedArrayDelete);*/

    // this setvariable ["ace_bft_assignableInformation_MDFDevice", ["elementType", 0, "elementCallsign", 1]];
};

if (!hasInterface) exitWith {};

["loadout", FUNC(validateInventory)] call CBA_fnc_addPlayerEventHandler;
["unit", FUNC(validateInventory)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(validateInventory)}] call CBA_fnc_addPlayerEventHandler; // Necessary?

["bft_deviceDataChanged", FUNC(handleDeviceDataChanged)] call CBA_fnc_addEventHandler;
["bft_registeredEncryptionKeysChanged", FUNC(handleRegisteredEncryptionKeysChanged)] call CBA_fnc_addEventHandler;
["bft_registeredModeChanged", FUNC(handleRegisteredModeChanged)] call CBA_fnc_addEventHandler;
["bft_colorFilteringChanged", FUNC(handleColorFilteringChanged)] call CBA_fnc_addEventHandler;
["bft_deviceOpened", FUNC(handleDeviceOpened)] call CBA_fnc_addEventHandler;
["bft_deviceClosed", FUNC(handleDeviceClosed)] call CBA_fnc_addEventHandler;
