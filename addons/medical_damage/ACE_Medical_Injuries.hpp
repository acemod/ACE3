// bleeding - maximum possible percentage of cardiac output bled for a given wound type (0 .. 1)
// pain - maximum possible pain level for a given wound type (0 .. 1)

class ACE_Medical_Injuries {
    // Defines all the possible injury types
    class wounds {
        // Source: Scarle
        //  Also called scrapes, they occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
        class Abrasion {
            bleeding = 0.001;
            pain = 0.4;
        };
        // Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
        class Avulsion {
            bleeding = 0.1;
            pain = 1.0;
            causeLimping = 1;
        };
        // Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
        class Contusion {
            bleeding = 0;
            pain = 0.3;
        };
        // Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
        class Crush {
            bleeding = 0.05;
            pain = 0.8;
            causeLimping = 1;
            causeFracture = 1;
        };
        // Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
        class Cut {
            bleeding = 0.01;
            pain = 0.1;
        };
        // Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
        class Laceration {
            bleeding = 0.05;
            pain = 0.2;
        };
        // Also called velocity wounds, they are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
        class VelocityWound {
            bleeding = 0.2;
            pain = 0.9;
            causeLimping = 1;
            causeFracture = 1;
        };
        // Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
        class PunctureWound {
            bleeding = 0.05;
            pain = 0.4;
            causeLimping = 1;
        };
        // Pain wound that is caused by making or being in contact with heat
        class ThermalBurn {
            bleeding = 0;
            pain = 0.7;
            minDamage = 0;
        };
    };

    class damageTypes {
        // thresholds[] {{<damage>, <number of wounds>}, {...}}
        // if damage is between two points, number is interpolated and then rounded by chance based on the decimal part
        // e.g. a value of 2.7 has 70% chance to give 3 and 30% to give 2
        // put damage values in descending order; uses the first value found that is below the wound damage, and the point immediately before that
        thresholds[] = {{0.1, 1}};

        // if 1, wounds are only applied to the hitpoint that took the most damage. othewrise, wounds are applied to all damaged hitpoints
        selectionSpecific = 1;

        // list of damage handlers, which will be called in reverse order
        // each entry should be a SQF expression that returns a function
        // this can also be overridden for each damage type
        class woundHandlers {
            ADDON = QFUNC(woundsHandlerBase);
        };

        class bullet {
            // bullets only create multiple wounds when the damage is very high
            thresholds[] = {{20, 10}, {4.5, 2}, {3, 1}, {0, 1}};
            selectionSpecific = 1;

            class Avulsion {
                // at damage, weight. between points, weight is interpolated then wound is chosen by weighted random.
                // as with thresholds, but result is not rounded (decimal values used as-is)
                weighting[] = {{1, 1}, {0.35, 0}};
                /*
                damageMultiplier = 1;
                sizeMultiplier = 1;
                bleedingMultiplier = 1;
                painMultiplier = 1;
                fractureMultiplier = 1;
                */
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
                // bruises caused by bullets hitting the plate are big
                sizeMultiplier = 3.2;
                // increase the pain to allow for bruises to actually knock out on repeated hits
                painMultiplier = 2.2;
            };
            class VelocityWound {
                // velocity wounds are only in the 0.35-1.5 range
                weighting[] = {{1.5, 0}, {1.5, 1}, {0.35, 1}, {0.35, 0}};
                // velocity wounds will tend to be medium or large
                sizeMultiplier = 0.9;
            };
        };
        class grenade {
            // at low damage numbers, chance to create no wounds - makes it a bit more random instead of consistently covering people in bruises
            thresholds[] = {{20, 10}, {10, 5}, {4, 3}, {1.5, 2}, {0.8, 2}, {0.3, 1}, {0, 0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1.5, 1}, {1.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{1.5, 0}, {1.1, 1}, {0.7, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.9, 0}, {0.7, 1}, {0.35, 0}};
            };
            class Cut {
                weighting[] = {{0.7, 0}, {0.35, 1}, {0.35, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        };
        class explosive {
            // explosives create more and smaller wounds than grenades
            thresholds[] = {{20, 15}, {8, 7}, {2, 3}, {1.2, 2}, {0.4, 1}, {0,0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1, 1}, {0.8, 0}};
            };
            class Cut {
                weighting[] = {{1.5, 0}, {0.35, 1}, {0, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        };
        class shell {
            // shells tend to involve big pieces of shrapnel, so create fewer and larger wounds
            thresholds[] = {{20, 10}, {10, 5}, {4.5, 2}, {2, 2}, {0.8, 1}, {0.2, 1}, {0, 0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1.5, 1}, {1.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{1.5, 0}, {1.1, 1}, {0.7, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.9, 0}, {0.7, 1}, {0.35, 0}};
            };
            class Cut {
                weighting[] = {{0.7, 0}, {0.35, 1}, {0.35, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        };
        class vehiclehit: explosive {
            // vehicle explosions are usually caused by explosive damage and should behave similarly
            thresholds[] = {{6, 3}, {4.5, 2}, {2, 2}, {0.8, 1}, {0.2, 1}, {0, 0}};
            class woundHandlers: woundHandlers {
                GVAR(vehiclehit) = QFUNC(woundsHandlerVehiclehit);
            };
        };
        class vehiclecrash {
            thresholds[] = {{1.5, 3}, {1.5, 2}, {1, 2}, {1, 1}, {0.05, 1}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
            class woundHandlers: woundHandlers {
                GVAR(vehiclecrash) = QFUNC(woundsHandlerVehiclecrash);
            };
            class Abrasion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
            class Avulsion {
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
            class Crush {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class Laceration {

            };
        };
        class collision {
            thresholds[] = {{8, 4}, {1, 1}, {0.3, 1}, {0.15, 0.5}, {0, 0.3}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1, 2}, {0.5, 0.5}, {0.5, 0}};
            };
            class Abrasion {
                weighting[] = {{0.4, 0}, {0.2, 1}, {0, 0}};
            };
            class Contusion {
                weighting[] = {{0.4, 0}, {0.2, 1}};
            };
            class Crush {
                weighting[] = {{0.4, 1}, {0.2, 0}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class Laceration {
            };
        };
        class falling {
            thresholds[] = {{8, 4}, {1, 1}, {0.2, 1}, {0.1, 0.7}, {0, 0.5}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
            class Abrasion {
                weighting[] = {{0.4, 0}, {0.2, 1}, {0, 0}};
                sizeMultiplier = 3;
            };
            class Contusion {
                weighting[] = {{0.4, 0}, {0.2, 1}};
                sizeMultiplier = 3;
            };
            class Crush {
                weighting[] = {{0.4, 1}, {0.2, 0}};
                sizeMultiplier = 1.5;
            };
        };
        class backblast {
            thresholds[] = {{1, 6}, {1, 5}, {0.55, 5}, {0.55, 2}, {0, 2}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
        };
        class stab {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.02, 1}, {0.02, 0}};
            };
        };
        class punch {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
            class Crush {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class Laceration {

            };
        };
        class ropeburn {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            noBlood = 1;
            class Abrasion {
                weighting[] = {{0.30, 1}};
            };
        };
        class drowning {
            //No related wounds as drowning should not cause wounds/bleeding. Can be extended for internal injuries if they are added.
            thresholds[] = {{0, 0}};
            noBlood = 1;
            class woundHandlers {};
        };
        class fire {
            noBlood = 1;
            // custom handling for environmental fire sources
            // passes damage to "burn" so doesn't need its own wound stats
            class woundHandlers {
                ADDON = QFUNC(woundsHandlerBurning);
            };
        };
        class burn {
            thresholds[] = {{0, 1}};
            selectionSpecific = 0;
            noBlood = 1;
            class ThermalBurn {
                weighting[] = {{0, 1}};
            };
        };
        class unknown {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            class Abrasion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
        };
    };
};
