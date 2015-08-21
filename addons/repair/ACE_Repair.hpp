class ACE_Repair {
    class Actions {
        class ReplaceWheel {
            displayName = CSTRING(ReplaceWheel);
            displayNameProgress = CSTRING(ReplacingWheel);

            locations[] = {"All"};
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            repairingTime = 10;
            repairingTimeSelfCoef = 1;
            items[] = {"ToolKit"};
            condition = QUOTE(call FUNC(canReplaceWheel));
            itemConsumed = 0;

            callbackSuccess = QUOTE(call FUNC(doReplaceWheel));
            callbackFailure = "";
            callbackProgress = "";

            animationCaller = "Acts_carFixingWheel";
            animationCallerProne = "Acts_carFixingWheel";
            animationCallerSelf = "Acts_carFixingWheel";
            animationCallerSelfProne = "Acts_carFixingWheel";
            litter[] = {};
        };
        class RemoveWheel: ReplaceWheel {
            displayName = CSTRING(RemoveWheel);
            displayNameProgress = CSTRING(RemovingWheel);
            condition = QUOTE(call FUNC(canRemove));
            callbackSuccess = QUOTE(call FUNC(doRemoveWheel));
        };
        class MiscRepair: ReplaceWheel {
            displayName = CSTRING(Repairing); // let's make empty string an auto generated string
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE((_target getHitPointDamage _hitPoint) > ([_caller] call FUNC(getPostRepairDamage)));
            requiredEngineer = 0;
            repairingTime = 15;
            callbackSuccess = QUOTE(call FUNC(doRepair));
        };
        class RepairTrack: MiscRepair {
            displayName = CSTRING(Repairing);
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE(call FUNC(canRepairTrack));
            callbackSuccess = QUOTE(call FUNC(doRepairTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
        };
        class RemoveTrack: MiscRepair {
            displayName = CSTRING(RemoveTrack);
            displayNameProgress = CSTRING(RemovingTrack);
            condition = QUOTE(call FUNC(canRemove));
            callbackSuccess = QUOTE(call FUNC(doRemoveTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
        };
        class ReplaceTrack: RemoveTrack {
            displayName = CSTRING(ReplaceTrack);
            displayNameProgress = CSTRING(ReplacingTrack);
            condition = QUOTE(call FUNC(canReplaceTrack));
            callbackSuccess = QUOTE(call FUNC(doReplaceTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
        };
        class FullRepair: MiscRepair {
            displayName = CSTRING(fullRepair);
            displayNameProgress = CSTRING(fullyRepairing);
            requiredEngineer = QGVAR(engineerSetting_fullRepair);
            repairLocations[] = {QGVAR(fullRepairLocation)};
            repairingTime = 30;
            condition = "damage (_this select 1) > 0";
            callbackSuccess = QUOTE(call FUNC(doFullRepair));
        };
    };
};
