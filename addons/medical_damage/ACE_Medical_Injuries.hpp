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
            causes[] = {"burn"};
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
        
        // this can also be overridden for each damage type
        woundsHandler = QFUNC(woundsHandlerActive);

        class bullet {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            
            class Avulsion {
                // at damage, weight. between points, weight is interpolated then wound is chosen by weighted random.
                // as with thresholds, but result is not rounded (decimal values used as-is)
                weighting[] = {{0.01, 1}, {0.01, 0}};
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
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
        };
        class grenade {
            thresholds[] = {{0.9, 3}, {0.5, 2}, {0.1, 1}, {0, 0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.02, 1}, {0.02, 0}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
        };
        class explosive {
            thresholds[] = {{2, 3}, {1.2, 2}, {0.4, 1}, {0,0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.02, 1}, {0.02, 0}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
        };
        class shell {
            thresholds[] = {{2, 3}, {1.2, 2}, {0.4, 1}, {0,0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
            class VelocityWound {
                weighting[] = {{0.35, 1}, {0.35, 0}};
            };
            class PunctureWound {
                weighting[] = {{0.02, 1}, {0.02, 0}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
        };
        class vehiclecrash {
            thresholds[] = {{1.5, 3}, {1.5, 2}, {1, 2}, {1, 1}, {0.05, 1}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
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
            thresholds[] = {{1.5, 3}, {1.5, 2}, {1, 2}, {1, 1}, {0.05, 1}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
            class Abrasion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
            class Avulsion {
                weighting[] = {{1, 2}, {0.5, 0.5}, {0.5, 0}};
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
        class falling {
            thresholds[] = {{1.5, 3}, {1.5, 2}, {1, 2}, {1, 1}, {0.05, 1}}; // prevent subdividing wounds past FRACTURE_DAMAGE_THRESHOLD to ensure limp/fractue is triggered
            selectionSpecific = 0;
            class Abrasion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
            class Crush {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
        };
        class ropeburn {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            class Abrasion {
                weighting[] = {{0.30, 0}, {0.30, 1}};
            };
        };
        class burn {
            thresholds[] = {{0, 1}};
            selectionSpecific = 0;
            class ThermalBurn {
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
        };
        class drowning {
            //No related wounds as drowning should not cause wounds/bleeding. Can be extended for internal injuries if they are added.
            thresholds[] = {{0, 0}};
        };
        class burning {
            //TODO: burning damage used to be type 'unknown' so this is a copy-paste of that
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 0;
            woundsHandler = QFUNC(woundsHandlerBurning);
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
