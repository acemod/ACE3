class ACE_Repair {
    class Actions {
        class ReplaceWheel {
            displayName = CSTRING(ReplaceWheel);
            displayNameProgress = CSTRING(ReplacingWheel);

            locations[] = {"All"};
            requiredEngineer = 0;
            repairingTime = 5;
            repairingTimeSelfCoef = 1;
            items[] = {};
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
        class RepairEngine {

        };
        class Tracks: ReplaceWheel {

        };
        class MiscRepair: ReplaceWheel {
            displayName = CSTRING(Repairing); // let's make empty string an auto generated string
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = "";
            callbackSuccess = QUOTE(call FUNC(doRepair));
        };
    };
};
