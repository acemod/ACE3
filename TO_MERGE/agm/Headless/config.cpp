class CfgPatches {
  class AGM_Headless {
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

class CfgFunctions {
  class AGM_Headless {
    class AGM_Headless {
      file = "\AGM_Headless\functions";
      class getData;
      class logLongString;
      class spawnGroups;
    };
  };
};
