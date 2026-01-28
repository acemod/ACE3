#pragma hemtt suppress pw3_padded_arg file
#define CONCAT(a,b) a####b
#define ZERO(NUM) class GVAR(NUM): GVAR(base) { \
    scope = 1; \
    class ItemInfo: InventoryFlashLightItem_Base_F { \
        mass = 4; \
        class Pointer { \
            irLaserPos = "laser pos"; \
            irLaserEnd = QUOTE(CONCAT(laser ,NUM)); \
            irDistance = 5; \
        }; \
        class FlashLight {}; \
    }; \
}

class CfgWeapons {
    class ItemCore;
    class InventoryFlashLightItem_Base_F;
    class GVAR(base): ItemCore {
        scope = 2;
        inertia = 0.1;
        author = ECSTRING(common,ACETeam);
        displayName = "MILR";
        descriptionUse = "y";
        descriptionShort = "z";
		picture = "\A3\weapons_F\Data\UI\gear_accv_pointer_CA.paa";
        model = QPATHTOF(data\ace_milr.p3d);
        class ItemInfo: InventoryFlashLightItem_Base_F { // do not use inheritance on ItemInfo/Pointer as it breaks something
            mass = 7; // big chonky box
            class Pointer {
                irLaserPos = "laser pos";
                irLaserEnd = "laser dir";
                irDistance = 5;
            };
            class FlashLight {};
        };
    };
    ZERO(000);ZERO(002);ZERO(004);ZERO(006);ZERO(008);ZERO(010);ZERO(012);ZERO(014);ZERO(016);ZERO(018);ZERO(020);ZERO(022);ZERO(024);ZERO(026);ZERO(028);ZERO(030);ZERO(032);ZERO(034);ZERO(036);ZERO(038);ZERO(040);ZERO(042);ZERO(044);ZERO(046);ZERO(048);ZERO(050);ZERO(052);ZERO(054);ZERO(056);ZERO(058);ZERO(060);ZERO(062);ZERO(064);ZERO(066);ZERO(068);ZERO(070);ZERO(072);ZERO(074);ZERO(076);ZERO(078);ZERO(080);ZERO(082);ZERO(084);ZERO(086);ZERO(088);ZERO(090);ZERO(092);ZERO(094);ZERO(096);ZERO(098);ZERO(100);ZERO(110);ZERO(120);ZERO(130);ZERO(140);ZERO(150);ZERO(160);ZERO(170);ZERO(180);ZERO(190);ZERO(200);ZERO(210);ZERO(220);ZERO(230);ZERO(240);ZERO(250);ZERO(260);ZERO(270);ZERO(280);ZERO(290);ZERO(300);
};
