class CfgWeapons {
    class Default;
    class Put: Default {
        muzzles[] += {QGVAR(muzzle)};
        class PutMuzzle: Default {};
        class GVAR(muzzle): PutMuzzle {
            magazines[] = {"ACE_FlareTripMine_Mag", "ACE_FlareTripMine_Mag_Red", "ACE_FlareTripMine_Mag_Green", "ACE_APERSMine_ToePopper_Mag"};
        };
    };

    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_ExplosiveItem: CBA_MiscItem_ItemInfo {
        allowedSlots[] = {TYPE_UNIFORM, TYPE_VEST, TYPE_BACKPACK};
    };

    class ACE_Clacker: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(clacker_displayName);
        descriptionShort = CSTRING(clacker_description);
        picture = QPATHTOF(Data\UI\Clacker.paa);
        model = QPATHTOF(data\ace_m57.p3d);
        GVAR(range) = 250;
        GVAR(detonator) = 1;
        GVAR(triggerType) = "Command";
        ACE_isTool = 1;

        class ItemInfo: ACE_ExplosiveItem {
            mass = 3;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
    class ACE_M26_Clacker: ACE_Clacker {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(M152_Clacker_displayName);
        picture = QPATHTOF(Data\UI\MK26_Transmitter_ca.paa);
        GVAR(range) = 5000;
        GVAR(triggerType) = "MK16_Transmitter";
    };
    class ACE_DefusalKit: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DefusalKit_displayName);
        descriptionShort = CSTRING(DefusalKit_description);
        picture = QPATHTOF(Data\UI\Pliers.paa);
        model = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
        GVAR(defusalKit) = 1;
        ACE_isTool = 1;

        class ItemInfo: ACE_ExplosiveItem {
            mass = 5;
            uniformModel = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
        };
    };
    class ACE_DeadManSwitch: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DeadManSwitch_displayName);
        descriptionShort = CSTRING(DeadManSwitch_description);
        picture = QPATHTOF(Data\UI\DeadmanSwitch.paa);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        GVAR(range) = 100;
        GVAR(detonator) = 1;
        GVAR(triggerType) = "DeadManSwitch";
        ACE_isTool = 1;

        class ItemInfo: ACE_ExplosiveItem {
            mass = 2;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
    class ACE_Cellphone: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(cellphone_displayName);
        descriptionShort = CSTRING(cellphone_description);
        picture = QPATHTOF(Data\UI\Cellphone_UI.paa);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        GVAR(range) = 15000;
        GVAR(detonator) = 1;
        GVAR(triggerType) = "Cellphone";
        ACE_isTool = 1;

        class ItemInfo: ACE_ExplosiveItem {
            mass = 2;
            uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
};
