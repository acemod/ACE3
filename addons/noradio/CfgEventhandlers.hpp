class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = "call compile preprocessFileLineNumbers '\AGM_NoRadio\clientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\AGM_NoRadio\serverInit.sqf'";
    };
};