class Mode_SemiAuto;

class CfgWeapons {
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };
    class ACE_VMM3: Pistol_Base_F {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = "VMM3";
        descriptionShort = CSTRING(VMM3_Description);
        model = QUOTE(PATHTOF(ace_wallon_vmm3.p3d));
        picture = QUOTE(PATHTOF(data\equip\w_vmm3_ca.paa));
        magazines[] = { };
        modes[] = { "Single" };
        cursor = "EmptyCursor";
        cursorAim = "EmptyCursor";
        class Single: Mode_SemiAuto {
            displayName = "";
            sounds[] = {};
            begin1[] = { "", 1.77828, 1, 1000 };
            soundBegin[] = { "begin1", 1 };
            reloadTime = 0.075;
            recoil = "recoil_pistol_light";
            recoilProne = "recoil_prone_pistol_light";
            dispersion = 0.001;
            minRange = 2;
            minRangeProbab = 0.3;
            midRange = 250;
            midRangeProbab = 0.7;
            maxRange = 400;
            maxRangeProbab = 0.05;
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            holsterScale = 0;
            mass = 77;
            class CowsSlot {};
            class MuzzleSlot {};
        };
    };
    class ACE_VMH3: ACE_VMM3 {
        scope = 2;
        displayName = "VMH3";
        author = ECSTRING(common,ACETeam);
        model = QUOTE(PATHTOF(ace_wallon_vmh3.p3d));
        picture = QUOTE(PATHTOF(data\equip\w_vmh3_ca.paa));
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 55;
        };
    };
};
