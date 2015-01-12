#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_core"};
    version = QUOTE(VERSION);
    versionStr = QUOTE(VERSION);
    versionAr[] = {VERSION_AR};
    author[] = {"bux578"};
    authorUrl = "https://github.com/bux578/";
  };
};

#include "CfgEventHandlers.hpp"
