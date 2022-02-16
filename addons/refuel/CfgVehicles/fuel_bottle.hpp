class Man;
class CAManBase: Man {
    class ACE_SelfActions {
        class ACE_Equipment {
            class GVAR(Bottle_Refueling) {
                displayName = CSTRING(Bottle_Refueling);
                condition = QUOTE([ARR_2(_player, 'ACE_Fuel_Bottle_Item')] call EFUNC(common,hasItem));
                statement = QUOTE([ARR_2(_player,'ACE_Fuel_Bottle_Item')] call FUNC(bottleRefueling));
                showDisabled = 0;
                icon = QPATHTOF(ui\fuel_bottle_co.paa);
            };
        };
    };
};

class ACE_Fuel_Bottle: ThingX {
    class EventHandlers {
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    class ACE_Actions {
    class ACE_MainActions {
        selection = "";
        distance = 5;
        condition = "(true)";

        class GVAR(Bottle_Pickup) {
            displayName = CSTRING(Bottle_Pickup);
            distance = 5;
            condition = "(true)";
            statement = QUOTE([ARR_2(_player,_target)] call FUNC(pickupFuelBottle));
            showDisabled = 0;
            exceptions[] = {};
            icon = QPATHTOF(ui\fuel_bottle_co.paa);
        };
    };
    };
	displayName = CSTRING(Fuel_Bottle_DisplayName);
    scope = 1;
    scopeCurator = 1;
    model = QPATHTOF(data\fuel_bottle.p3d);
    destrType = "DestructNo";
};
