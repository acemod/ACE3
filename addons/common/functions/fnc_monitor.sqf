// by commy2
#include "script_component.hpp"

terminate (missionNamespace getVariable [QGVAR(MonitorFnc), scriptNull]);

GVAR(MonitorFnc) = _this spawn {
    waitUntil {
      hintSilent str (call _this);
      false
    };
};
