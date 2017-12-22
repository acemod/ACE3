#define WRAP(function) \
    class function { \
        file = QPATHTOF(functions\DOUBLES(fnc_wrapper,function).sqf); \
        RECOMPILE; \
    }; \
    class function##BIS { \
        file = QUOTE(A3\functions_f_bootcamp\Inventory\DOUBLES(fn,function).sqf); \
    }

class CfgFunctions {
    class A3_Bootcamp {
        class Inventory {
            WRAP(arsenal);
            WRAP(addVirtualBackpackCargo);
            WRAP(addVirtualItemCargo);
            WRAP(addVirtualMagazineCargo);
            WRAP(addVirtualWeaponCargo);
            WRAP(removeVirtualBackpackCargo);
            WRAP(removeVirtualItemCargo);
            WRAP(removeVirtualMagazineCargo);
            WRAP(removeVirtualWeaponCargo);
        };
    };
};
