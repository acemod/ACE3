class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Short_Base_F: Rifle_Base_F {};
    class Rifle_Long_Base_F: Rifle_Base_F {};

    ///////////////////////////////////////////////////////////////////////////////
    //////////// SMALL ARMS WEAPONS ///////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////

    // Weapon updates:
    // 1. Do string update.
    // 2. Fix magazine compatibility as needed.
    // 3. Fix firing modes as needed.
    // 4. Fix accessory compatibility as needed.

    // Grenade launchers /////////////////////////////////////
    // Updated strings are in weapon configs.
    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {};

    // MXs ////////////////////////////////////////////////////

    class arifle_MX_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            reloadTime = 0.075;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.075;
        };
    };

    class arifle_MX_SW_F: arifle_MX_Base_F {
        modes[] = {"Single", "manual", "close", "short", "medium", "far_optic1", "far_optic2"};

        //class Single: Single {};
        //class manual: FullAuto {};
    };

    // Katibas ////////////////////////////////////////////////////

    class arifle_katiba_Base_F: Rifle_Base_F {
        // http://world.guns.ru/assault/iran/khaybar-kh2002-e.html
        // 800 rpm

        class Single: Mode_SemiAuto {
            reloadTime = 0.075;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.075;
        };
    };

    // SDAR //////////////////////////////////////////////////

    class SDAR_base_F: Rifle_Base_F {
        modes[] = {"Single", "FullAuto"}; // Leave in the imaginary full-auto mode because, whatever.
    };

    // Tavor TRG ////////////////////////////////////////////////

    class Tavor_base_F: Rifle_Base_F {
        // http://www.israel-weapon.com/files/brochure_2012/IWI_TAVOR_AR.pdf
        // 700 ~1000 rpm (850)
        class Single: Mode_SemiAuto {
            reloadTime = 0.07;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.07;
        };
    };

    // Mk20 (F2000) //////////////////////////////////////////////////

    class mk20_base_F: Rifle_Base_F {
        // http://www.fnherstal.com/primary-menu/products-capabilities/rifles/technical-data/product/182/232/182/1/_/fn-f2000R-standard.html
        // 850 rpm
        class Single: Mode_SemiAuto {
            reloadTime = 0.07;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.07;
        };
    };

    // SMG Vermin ////////////////////////////////////////////////////

    class SMG_01_Base: Rifle_Short_Base_F {
        // http://kriss-usa.com/pdf/operatormanual/
        // 1200 rpm
        class Single: Mode_SemiAuto {
            reloadTime = 0.05;
        };

        class Burst: Mode_Burst {
            burst = 2;
            reloadTime = 0.05;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.05;
        };
    };

    // SMG Scorpion ////////////////////////////////////////////////////

    class SMG_02_base_F: Rifle_Short_Base_F  {
        //http://www.czub.cz/zbrojovka/cz-manual/Instruction-Manual-Scorpion-EVO-3-A1_en.pdf
        // 1150 rpm

        class Single: Mode_SemiAuto {
            // http://www.stengg.com/upload/915fGdhTi3ggnnGQGGL.pdf
            // 900-1100 rpm (1000rpm)
            reloadTime = 0.052;
        };

        class Burst: Mode_Burst {
            reloadTime = 0.052;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.052;
        };
    };

    // SMG PDW2000 ///////////////////////////////////////////////////

    class pdw2000_base_F: Rifle_Short_Base_F {
        modes[] = {"Single", "FullAuto"}; // No burst on this thing

        class Single: Mode_SemiAuto {
            // http://www.stengg.com/upload/915fGdhTi3ggnnGQGGL.pdf
            // 900-1100 rpm (1000rpm)
            reloadTime = 0.06;
        };

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.06;
        };
    };

    // Pistols //////////////////////////////////////////////

    /*class hgun_P07_F: Pistol_Base_F {};
    class hgun_Rook40_F: Pistol_Base_F {};
    class hgun_ACPC2_F: Pistol_Base_F {};
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {};
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {};*/

    // LMGs //////////////////////////////////////////////

    class LMG_Mk200_F: Rifle_Long_Base_F {
        modes[] = {"manual", "Single", "close", "short", "medium", "far_optic1", "far_optic2"};

        class manual: Mode_FullAuto {
            // http://www.defensereview.com/kac-stoner-lmg-belt-fed-5-56mm-nato-lightweight-light-machine-gun-squad-automatic-weapon-lmgsaw-displayed-at-sofic-2010/
            // 550 rpm
            reloadTime = 0.109;
        };

        // Add semi-auto mode.
        // Inherit from 'manual' for sound reasons.
        class Single: manual {
            reloadTime = 0.109;
            dispersion = 0.00175; // radians. Equal to 6 MOA.
            autofire = 0;
            burst = 1;
            displayname = "Semi";
            texturetype = "semi";
            showToPlayer = 1;
        };
    };

    class LMG_Zafir_F: Rifle_Long_Base_F {
        modes[] = {"FullAuto", "Single",  "close", "short", "medium", "far_optic1", "far_optic2"};

        class FullAuto: Mode_FullAuto {
            reloadTime = 0.070; // 850 RPM on gas position 1
        };
    };

    // Sniper and anti-materiel rifles /////////////////////////////////

    class EBR_base_F: Rifle_Long_Base_F {
        // EMR/EBR is typically issued semi-auto AFAIK
        modes[] = {"Single", "single_close_optics1", "single_medium_optics1", "single_far_optics1"};
    };

    class GM6_base_F: Rifle_Long_Base_F {
        // Fuck your balancing, BI.
        class Single: Mode_SemiAuto {
            // 250 rpm is probably the limit of the finger on a heavy bullpup trigger like this thing must have.
            reloadTime = 0.24;
        };
    };

    ///////////////////////////////////////////////////////////////////////////////
    //////////// WEAPON ATTACHMENTS ///////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////

    /* Handgun flashlight
    class ItemCore;
    class InventoryItem_Base_F;
    class InventoryMuzzleItem_Base_F;
    class InventoryFlashLightItem_Base_F;

    class ACE_acc_flashlight_tls: ItemCore {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ACE_acc_flashlight_tls";
        scope = 1; //2;
        displayName = "$STR_A3_cfgWeapons_acc_flashlight0";//
        descriptionUse = "$STR_A3_cfgWeapons_use_flashlight0";//
        picture = "\A3\weapons_F\Data\UI\gear_accv_flashlight_tls_ca.paa";
        model = "\A3\weapons_f\acc\accv_flashlight_TLS_F";
        descriptionShort = "$STR_A3_cfgWeapons_acc_flashlight1";//
        class ItemInfo: InventoryFlashLightItem_Base_F {
            mass = 4;
            class FlashLight {
                color[] = {180,156,120};
                ambient[] = {0.9,0.78,0.6};
                intensity = 20;
                size = 1;
                innerAngle = 20;
                outerAngle = 80;
                coneFadeCoef = 5;
                position = "flash dir";
                direction = "flash";
                useFlare = 1;
                flareSize = 1.4;
                flareMaxDistance = "100.0f";
                dayLight = 0;
                class Attenuation {
                    start = 0.5;
                    constant = 0;
                    linear = 0;
                    quadratic = 1.1;
                    hardLimitStart = 20;
                    hardLimitEnd = 30;
                };
                scale[] = {0};
            };
        };
        inertia = 0.1;
    };*/
};
