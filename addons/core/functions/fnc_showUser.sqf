// by commy2

private "_object";

AGM_Debug_Object = _this select 0;

onEachFrame {
  hintSilent str (AGM_Debug_Object getVariable ["AGM_isUsedBy", objNull]);
};
