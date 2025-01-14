class CfgWeapons {
    class Launcher_Base_F;
    class GVAR(weapon): Launcher_Base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        model = "\A3\Weapons_f\empty";
        picture = "\A3\Weapons_F\Data\clear_empty.paa";
        magazines[] = {"ACE_FakeMagazine"};
        displayName = CSTRING(FakeWeaponDisplayName);
        type = TYPE_WEAPON_SECONDARY;
        class WeaponSlotsInfo {
            mass = 0;
        };
    };
};
