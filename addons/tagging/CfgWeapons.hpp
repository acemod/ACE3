class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_SpraypaintBlack : ACE_ItemCore {
        author = "jokoho48";
        displayname = CSTRING(spraypaintBlack);
        descriptionShort = CSTRING(descSpraypaint);
        picture = QPATHTOF(UI\items\itemSpraypaintBlack.paa);
        model = QPATHTOF(data\SprayCan.p3d);
        scope = 2;
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanBlack_co.paa)};
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class ACE_SpraypaintRed : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintRed);
        picture = QPATHTOF(UI\items\itemSpraypaintRed.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanRed_co.paa)};
    };
    class ACE_SpraypaintGreen : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintGreen);
        picture = QPATHTOF(UI\items\itemSpraypaintGreen.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanGreen_co.paa)};
    };
    class ACE_SpraypaintBlue : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintBlue);
        picture = QPATHTOF(UI\items\itemSpraypaintBlue.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanBlue_co.paa)};
    };
};
