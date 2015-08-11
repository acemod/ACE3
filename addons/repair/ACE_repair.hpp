class ACE_Repair {
    class Actions {
        class ReplaceWheel {
            displayName = CSTRING(ReplaceWheel);
            displayNameProgress = CSTRING(ReplacingWheel);

            locations[] = {"All"};
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            repairingTime = 5;
            repairingTimeSelfCoef = 1;
            items[] = {"ToolKit"};
            condition = QUOTE(call FUNC(canReplaceWheel));
            itemConsumed = 0;

            callbackSuccess = QUOTE(call FUNC(doReplaceWheel));
            callbackFailure = "";
            callbackProgress = "";

            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = {};
        };
        class RemoveWheel: ReplaceWheel {
            displayName = CSTRING(RemoveWheel);
            displayNameProgress = CSTRING(RemovingWheel);
            condition = QUOTE(call FUNC(canRemoveWheel));
            callbackSuccess = QUOTE(call FUNC(doRemoveWheel));
        };
        class MiscRepair: ReplaceWheel {
            displayName = CSTRING(Repairing); // let's make empty string an auto generated string
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE((_target getHitPointDamage _hitPoint) > ([_caller] call FUNC(getPostRepairDamage)));
            requiredEngineer = 0;
            callbackSuccess = QUOTE(call FUNC(doRepair));
        };
        class RepairTrack: MiscRepair {
            displayName = CSTRING(Repairing);
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE(call FUNC(canRepairTrack));
            callbackSuccess = QUOTE(call FUNC(doRepairTrack));
        };
        class RemoveTrack: MiscRepair {
            displayName = CSTRING(RemoveTrack);
            displayNameProgress = CSTRING(RemovingTrack);
            condition = QUOTE(call FUNC(canRemoveTrack));
            callbackSuccess = QUOTE(call FUNC(doRemoveTrack));
        };
        class ReplaceTrack: RemoveTrack {
            displayName = CSTRING(ReplaceTrack);
            displayNameProgress = CSTRING(ReplacingTrack);
            condition = QUOTE(call FUNC(canReplaceTrack));
            callbackSuccess = QUOTE(call FUNC(doReplaceTrack));
        };
    };
};
