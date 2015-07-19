class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_SpraypaintBlack : ACE_ItemCore {
        author = "jokoho48";
        displayname = CSTRING(spraypaintBlack);
        descriptionShort = CSTRING(descSpraypaint);
        picture = QUOTE(PATHTOF(UI\items\itemSpraypaintBlack.paa));
        model = QUOTE(PATHTOF(data\SprayCan.p3d));
        scope = 2;
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QUOTE(PATHTOF(data\spraycanBlack_co.paa))};
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_SpraypaintRed : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintRed);
        picture = QUOTE(PATHTOF(UI\items\itemSpraypaintRed.paa));
        hiddenSelectionsTextures[] = {QUOTE(PATHTOF(data\spraycanRed_co.paa))};
    };
    class ACE_SpraypaintGreen : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintGreen);
        picture = QUOTE(PATHTOF(UI\items\itemSpraypaintGreen.paa));
        hiddenSelectionsTextures[] = {QUOTE(PATHTOF(data\spraycanGreen_co.paa))};
    };
    class ACE_SpraypaintBlue : ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintBlue);
        picture = QUOTE(PATHTOF(UI\items\itemSpraypaintBlue.paa));
        hiddenSelectionsTextures[] = {QUOTE(PATHTOF(data\spraycanBlue_co.paa))};
    };
};