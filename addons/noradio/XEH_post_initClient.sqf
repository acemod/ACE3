// by commy2

#include "script_component.hpp"

_setupPlayer = {
  if (!isNull ACE_player) then {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;

    [ACE_player] call EFUNC(common,muteUnit);
    ACE_player setVariable [QGVAR(isMuted), true, true];
  };
};

[_setupPlayer, 0, []] call CBA_fnc_addPerFrameHandler;

[missionNamespace, "playerChanged", {
  //On player change, mute old unit and unmute new player
  [_this select 0] call EFUNC(common,muteUnit);
  (_this select 0) setVariable [QGVAR(isMuted), true, true];

  if (!((_this select 1) getVariable ["ACE_isUnconscious", false]) && {alive (_this select 1)}) then {  //@todo: ACE_isUnconscious???
    [_this select 1] call EFUNC(common,unMuteUnit);
  };
  (_this select 1) setVariable [QGVAR(isMuted), false, true];
}] call EFUNC(common,addCustomEventHandler);
