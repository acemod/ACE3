class CfgVehicles {
    class ReammoBox;
    class GVAR(weaponHolder): ReammoBox {
        author = ECSTRING(common,ACETeam);
        model = QPATHTOF(data\holder.p3d);
        showWeaponCargo = 1;
        scope = 1;
        transportMaxWeapons = 1;
        transportMaxMagazines = 0;
        transportMaxItems = 0;
        transportMaxBackpacks = 0;
        destrType = "DestructNo";
    };
};
