#define WRAP(function) \
    class function { \
        file = QPATHTOF(functions\CONCAT(fnc_wrapper_,function).sqf); \
        RECOMPILE; \
    }; \
    class function##BIS { \
        file = QUOTE(A3\functions_f_bootcamp\Inventory\CONCAT(fn_,function).sqf); \
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
