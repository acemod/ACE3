class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    //Spraypaints
    class ACE_SpraypaintBlack: ACE_ItemCore {
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
        GVAR(textColor) = "000000FE";
        sounds[] = {
            QGVAR(spray),
            QGVAR(spray01),
            QGVAR(spray02)
        };
    };
    class ACE_SpraypaintRed: ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintRed);
        picture = QPATHTOF(UI\items\itemSpraypaintRed.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanRed_co.paa)};
        GVAR(textColor) = "FF0000FE";
    };
    class ACE_SpraypaintGreen: ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintGreen);
        picture = QPATHTOF(UI\items\itemSpraypaintGreen.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanGreen_co.paa)};
        GVAR(textColor) = "00FF00FE";
    };
    class ACE_SpraypaintBlue: ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintBlue);
        picture = QPATHTOF(UI\items\itemSpraypaintBlue.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanBlue_co.paa)};
        GVAR(textColor) = "0000FFFE";
    };
    class ACE_SpraypaintYellow: ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintYellow);
        picture = QPATHTOF(UI\items\itemSpraypaintYellow.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanYellow_co.paa)};
        GVAR(textColor) = "FFFF00FE";
    };
    class ACE_SpraypaintWhite: ACE_SpraypaintBlack {
        displayname = CSTRING(spraypaintWhite);
        picture = QPATHTOF(UI\items\itemSpraypaintWhite.paa);
        hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanWhite_co.paa)};
        GVAR(textColor) = "FFFFFFFE";
    };

    // Chalks
    class ACE_ChalkWhite: ACE_SpraypaintWhite {
        author = "zorn";
        displayname = CSTRING(chalkWhite);
        descriptionShort = CSTRING(descSpraypaint);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        scope = 2;
        picture = QPATHTOF(UI\items\itemChalkWhite.paa);
        GVAR(textColor) = "FFFFFFFE";
        sounds[] = { 
            QGVAR(chalk01),
            QGVAR(chalk02),
            QGVAR(chalk03),
            QGVAR(chalk04),
            QGVAR(chalk05),
            QGVAR(chalk06)
        };
    };

    #define ACE_CHALK(COLOR,HEX)\
    class GLUE(ACE_Chalk,COLOR): ACE_ChalkWhite {\
        displayName = CSTRING(GLUE(chalk,COLOR));\
        picture = QPATHTOF(UI\items\GLUE(itemChalk,COLOR).paa);\
        GVAR(textColor) = QUOTE(HEX);\
    }

    ACE_CHALK(Black,000000FE);
    ACE_CHALK(Blue,0000FFFE);
    ACE_CHALK(Red,FF0000FE);
    ACE_CHALK(Green,00FF00FE);
    ACE_CHALK(Yellow,FFFF00FE);

};
