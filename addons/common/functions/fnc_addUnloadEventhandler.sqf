// by commy2
#include "\z\ace\addons\common\script_component.hpp"

private "_dlg";

disableSerialization;
_dlg = ctrlParent _this;

_dlg displayAddEventHandler ["unload", {
  if (_this select 1 == 1) then {
    [missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target", objNull]] call FUNC(fixCrateContent);
  };
}];
