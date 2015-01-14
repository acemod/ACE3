// by commy2

#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
  if !((_this select 0) getVariable ["ACE_isUnconscious", false]) then { //@ToDo: ai waking up will be silent?
    _this call EFUNC(common,unMuteUnit);
  };
  (_this select 0) setVariable [QGVAR(isMuted), false, true];
}];
