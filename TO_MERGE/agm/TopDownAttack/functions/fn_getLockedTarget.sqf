// by commy2

// cursorTarget doesn't work for lockable weapons in fired event handlers
if (!isNull cursorTarget) then {
  AGM_TopDownAttack_LockedTarget = cursorTarget;
  AGM_TopDownAttack_LockedTargetTime = time;
} else {
  if (time - (missionNamespace getVariable ["AGM_TopDownAttack_LockedTargetTime", -1]) > 1) then {
    AGM_TopDownAttack_LockedTarget = objNull;
  };
};
