class ACE_Repair {
    class Actions {
        class ReplaceWheel {
            displayName = CSTRING(ReplaceWheel);
            displayNameProgress = CSTRING(ReplacingWheel);

            repairLocations[] = {"All"};
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            repairingTime = 10;
            repairingTimeSelfCoef = 1;
            items = QGVAR(wheelRepairRequiredItems);
            condition = QUOTE(call FUNC(canReplaceWheel));
            itemConsumed = 0;
            claimObjects[] = {{"ACE_Wheel"}};

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
            claimObjects[] = {};
        };
        class MiscRepair: ReplaceWheel {
            displayName = CSTRING(Repairing); // let's make empty string an auto generated string
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE(call FUNC(canMiscRepair));
            requiredEngineer = QGVAR(engineerSetting_Repair);
            repairingTime = 15;
            callbackSuccess = QUOTE(call FUNC(doRepair));
            items[] = {"ToolKit"};
            itemConsumed = QGVAR(consumeItem_ToolKit);
            claimObjects[] = {};
        };
        class RepairTrack: MiscRepair {
            displayName = CSTRING(Repairing);
            displayNameProgress = CSTRING(RepairingHitPoint);
            condition = QUOTE(call FUNC(canRepairTrack));
            callbackSuccess = QUOTE(call FUNC(doRepairTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            claimObjects[] = {{"ACE_Track"}};
            itemConsumed = 0;
        };
        class RemoveTrack: MiscRepair {
            displayName = CSTRING(RemoveTrack);
            displayNameProgress = CSTRING(RemovingTrack);
            condition = QUOTE(call FUNC(canRemove));
            callbackSuccess = QUOTE(call FUNC(doRemoveTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            itemConsumed = 0;
        };
        class ReplaceTrack: RemoveTrack {
            displayName = CSTRING(ReplaceTrack);
            displayNameProgress = CSTRING(ReplacingTrack);
            condition = QUOTE(call FUNC(canReplaceTrack));
            callbackSuccess = QUOTE(call FUNC(doReplaceTrack));
            requiredEngineer = QGVAR(engineerSetting_Wheel);
            claimObjects[] = {{"ACE_Track"}};
        };
        class FullRepair: MiscRepair {
            displayName = CSTRING(fullRepair);
            displayNameProgress = CSTRING(fullyRepairing);
            requiredEngineer = QGVAR(engineerSetting_fullRepair);
            repairLocations[] = {QGVAR(fullRepairLocation)};
            repairingTime = 30;
            condition = "-1 != ((getAllHitPointsDamage _target param [2,[]]) findIf {_x > 0})";
            callbackSuccess = QUOTE(call FUNC(doFullRepair));
            itemConsumed = QGVAR(consumeItem_ToolKit);
        };
    };
};
