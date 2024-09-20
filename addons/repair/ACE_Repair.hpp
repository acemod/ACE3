class ACE_Repair {
    class Actions {
        class ReplaceWheel {
            displayName = CSTRING(ReplaceWheel);
            displayNameProgress = CSTRING(ReplacingWheel);
            forceDisplayName = 0;

            repairLocations[] = {"All"};
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            repairingTime = QGVAR(wheelChangeTime);
            repairingTimeSelfCoef = 1;
            items = QGVAR(wheelRepairRequiredItems);
            condition = QFUNC(canReplaceWheel);
            itemConsumed = 0;
            claimObjects[] = {{"ACE_Wheel"}};

            callbackSuccess = QFUNC(doReplaceWheel);
            callbackFailure = "";
            callbackProgress = "";

            animationCaller = "Acts_carFixingWheel";
            animationCallerProne = "Acts_carFixingWheel";
            animationCallerSelf = "Acts_carFixingWheel";
            animationCallerSelfProne = "Acts_carFixingWheel";
            loopAnimation = 0;
            litter[] = {};
        };
        class RemoveWheel: ReplaceWheel {
            displayName = CSTRING(RemoveWheel);
            displayNameProgress = CSTRING(RemovingWheel);
            condition = QFUNC(canRemove);
            callbackSuccess = QFUNC(doRemoveWheel);
            claimObjects[] = {};
        };
        class PatchWheel: ReplaceWheel {
            displayName = CSTRING(PatchWheel);
            displayNameProgress = CSTRING(PatchingWheel);
            condition = QFUNC(canPatchWheel);
            repairingTime = QFUNC(getPatchWheelTime);
            callbackProgress = QFUNC(doPatchWheelProgress);
            items = QGVAR(patchWheelRequiredItems);
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            callbackSuccess = "";
            claimObjects[] = {};
        };
        class MiscRepair: ReplaceWheel {
            displayName = CSTRING(Repairing); // let's make empty string an auto generated string
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QFUNC(canMiscRepair);
            requiredEngineer = QGVAR(engineerSetting_Repair);
            repairingTime = QGVAR(miscRepairTime);
            callbackSuccess = QFUNC(doRepair);
            items = QGVAR(miscRepairRequiredItems);
            itemConsumed = QGVAR(consumeItem_ToolKit);
            claimObjects[] = {};
        };
        class RepairTrack: MiscRepair {
            displayName = CSTRING(Repairing);
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QFUNC(canRepairTrack);
            callbackSuccess = QFUNC(doRepairTrack);
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            claimObjects[] = {{"ACE_Track"}};
            itemConsumed = 0;
        };
        class RemoveTrack: MiscRepair {
            displayName = CSTRING(RemoveTrack);
            displayNameProgress = CSTRING(RemovingTrack);
            condition = QFUNC(canRemove);
            callbackSuccess = QFUNC(doRemoveTrack);
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            itemConsumed = 0;
        };
        class ReplaceTrack: RemoveTrack {
            displayName = CSTRING(ReplaceTrack);
            displayNameProgress = CSTRING(ReplacingTrack);
            condition = QFUNC(canReplaceTrack);
            callbackSuccess = QFUNC(doReplaceTrack);
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            claimObjects[] = {{"ACE_Track"}};
        };
        class FullRepair: MiscRepair {
            displayName = CSTRING(fullRepair);
            displayNameProgress = CSTRING(fullyRepairing);
            forceDisplayName = 1;
            loopAnimation = 1;
            requiredEngineer = QGVAR(engineerSetting_fullRepair);
            repairLocations[] = {QGVAR(fullRepairLocation)};
            repairingTime = QFUNC(getFullRepairTime);
            condition = "((getAllHitPointsDamage _target) select 2) findIf {_x > 0} != -1";
            callbackSuccess = QFUNC(doFullRepair);
            callbackProgress = QFUNC(fullRepairProgress);
            items = QGVAR(fullRepairRequiredItems);
            itemConsumed = QGVAR(consumeItem_ToolKit);
        };
    };
};
