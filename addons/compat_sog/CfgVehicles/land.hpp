#define XEH_INHERITED class EventHandlers {class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};}

class vn_b_ammobox_supply_07;
class vn_b_ammobox_supply_09: vn_b_ammobox_supply_07 { // just a pallet
    XEH_INHERITED;
};
class vn_object_c_base_02;
class Land_vn_canisterfuel_f: vn_object_c_base_02 {
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;
    EGVAR(cargo,noRename) = 1;
};
class Land_vn_object_c_base;
class Land_vn_fuelcan: Land_vn_object_c_base {
    XEH_INHERITED;
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;
    EGVAR(cargo,noRename) = 1;
};

// M149
class Land_vn_object_b_base;
class Land_vn_b_prop_m149: Land_vn_object_b_base {
    XEH_INHERITED;
    EXGVAR(field_rations,waterSupply) = 1514.16; // 400 US gallons
    EXGVAR(field_rations,offset)[] = {0, -0.3, -0.3};
};
