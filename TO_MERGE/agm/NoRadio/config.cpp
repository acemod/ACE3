class CfgPatches {
  class AGM_NoRadio {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class Extended_PostInit_EventHandlers {
    class AGM_NoRadio {
        clientInit = "call compile preprocessFileLineNumbers '\AGM_NoRadio\clientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\AGM_NoRadio\serverInit.sqf'";
    };
};
