class CfgWeapons {
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };

    class ACE_Flashlight_Maglite_ML300L: Pistol_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(Maglite_ML300L_DisplayName);
        descriptionShort = CSTRING(Maglite_ML300L_Description);
        model = QPATHTOF(data\maglite_ml300l.p3d);
        picture = QPATHTOF(UI\maglite_ml300l_ca.paa);
        cursor = "";
        cursorAim = "";

        // binarized rtm, animation in "extras/assets/maglite"
        handAnim[] = {"OFP2_ManSkeleton", QPATHTOF(data\maglite_ml300l.rtm)};
        recoil = "empty";
        muzzlePos = "flash";
        muzzleEnd = "flash dir";
        magazines[] = {"FakeMagazine"}; // Required for the weapon info box to work correctly.
        textureType = "default"; // empty texture
        weaponInfoType = "RscWeaponEmpty";

        class WeaponSlotsInfo: WeaponSlotsInfo {
            holsterScale = 0; // Item does not fit a pistol holster, so hide it.
            mass = 20;

            class MuzzleSlot {};
            class CowsSlot {};
        };

        inertia = 0.2;
        dexterity = 1.8;

        class FlashLight {
            color[] = {180,180,190};
            ambient[] = {0.9,0.81,0.7};
            intensity = 85;
            size = 1;
            innerAngle = 5;
            outerAngle = 80;
            coneFadeCoef = 8;
            position = "flash dir";
            direction = "flash";
            useFlare = 1;
            flareSize = 0.8;
            flareMaxDistance = 100;
            dayLight = 1;

            class Attenuation {
                start = 0.25;
                constant = 0;
                linear = 0;
                quadratic = 1;
                hardLimitStart = 140;
                hardLimitEnd = 150;
            };

            scale[] = {0};
        };
    };

    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Flashlight_MX991: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(MX991_DisplayName);
        descriptionShort = CSTRING(MX991_Description);
        model = QPATHTOF(data\mx_991.p3d);
        picture = QPATHTOF(UI\mx_991_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;

            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_red_ca.paa);
                ACE_Flashlight_Size = 1.75;
            };
        };
    };

    class ACE_Flashlight_KSF1: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(KSF1_DisplayName);
        descriptionShort = CSTRING(KSF1_Description);
        model = QPATHTOF(data\ksf_1.p3d);
        picture = QPATHTOF(UI\ksf_1_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;

            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_red_ca.paa);
                ACE_Flashlight_Size = 1.5;
            };
        };
    };

    class ACE_Flashlight_XL50: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(XL50_DisplayName);
        descriptionShort = CSTRING(XL50_Description);
        model = QPATHTOF(data\maglite_xl50.p3d);
        picture = QPATHTOF(UI\maglite_xl50_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;

            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_white_ca.paa);
                ACE_Flashlight_Size = 2.15;
            };
        };
    };
};
