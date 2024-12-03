class CBA_Extended_EventHandlers;
#define XEH_INHERITED class EventHandlers {class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};}

class CfgVehicles {
    class House;
    class House_Small_F;
    class Strategic;
    class House_EP1: House {};

    class Land_Benzina_schnell: House {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{-1.5,-3.93,-1.25}, {2.35,-3.93,-1.25}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                position = "[0,-3.93,-1.25]";
                distance = 5;
                condition = "true";
            };
        };
    };
    class Land_A_FuelStation_Feed: Strategic {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{-0.34,0,0}, {0.34,0,0}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class Land_Ind_FuelStation_Feed_EP1: House_EP1 {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{-0.34,0,0}, {0.34,0,0}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class Land_FuelStation_Feed_PMC: Strategic {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{-0.34,0,0}, {0.34,0,0}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class FuelStation: House_Small_F {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{1.25, .2, -1.1}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                position = "[1.25, .2, -1]";
                distance = 5;
                condition = "true";
            };
        };
    };
    class WarfareBBaseStructure;
    class Base_WarfareBVehicleServicePoint: WarfareBBaseStructure {
        // "vehicle service point" (a conex /w barrels) - need hooks???
        XEH_INHERITED;
    };
};
