// by commy2

private "_dlg";

disableSerialization;
_dlg = ctrlParent _this;

_dlg displayAddEventHandler ["unload", {
  if (_this select 1 == 1) then {
    [missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target", objNull]] call AGM_CuratorFix_fnc_fixCrateContent;
  };
}];
