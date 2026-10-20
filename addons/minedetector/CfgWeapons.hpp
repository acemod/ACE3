class CfgWeapons {
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };
    class ACE_VMM3: Pistol_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = "VMM3";
        descriptionShort = CSTRING(VMM3_Description);
        model = QPATHTOF(ace_wallon_vmm3.p3d);
        picture = QPATHTOF(data\equip\w_vmm3_ca.paa);
        cursor = "";
        cursorAim = "";
        recoil = "empty";
        weaponInfoType = "RscWeaponEmpty";

        class WeaponSlotsInfo: WeaponSlotsInfo {
            holsterScale = 0;
            mass = 77;
            class CowsSlot {};
            class MuzzleSlot {};
        };
    };
    class ACE_VMH3: ACE_VMM3 {
        author = ECSTRING(common,ACETeam);
        displayName = "VMH3";
        model = QPATHTOF(ace_wallon_vmh3.p3d);
        picture = QPATHTOF(data\equip\w_vmh3_ca.paa);
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 55;
        };
    };
};
