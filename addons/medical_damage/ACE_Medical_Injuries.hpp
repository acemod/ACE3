// lethalities[] {{<body part index>, <death probability>}, {...}}
// thresholds[] {{<min damage>, <max number of wounds>}, {...}}

class ACE_Medical_Injuries {
    // Defines all the possible injury types for advanced medical
    class wounds {
        // Source: Scarle
        //  Also called scrapes, they occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
        class Abrasion {
            name = CSTRING(Abrasion);
            selections[] = {"All"};
            bleedingRate = 0.0001;
            pain = 0.01;
            causes[] = {"falling", "ropeburn", "vehiclecrash", "unknown"};
            minDamage = 0.01;
            class Minor {
                name = CSTRING(Abrasion_Minor);
                minDamage = 0.01;
                maxDamage = 0.2;
                bleedingRate = 0.0001;
            };
            class Medium {
                name = CSTRING(Abrasion_Medium);
                minDamage = 0.2;
                maxDamage = 0.3;
                bleedingRate = 0.00015;
            };
            class Large {
                name = CSTRING(Abrasion_Large);
                minDamage = 0.3;
                maxDamage = 0.5;
                bleedingRate = 0.0002;
            };
        };
        // Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
        class Avulsions {
            name = CSTRING(Avulsion);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.3;
            causes[] = {"explosive", "vehiclecrash", "grenade", "shell", "bullet", "backblast", "bite"};
            minDamage = 0.2;
            class Minor {
                name = CSTRING(Avulsion_Minor);
                minDamage = 0.2;
                maxDamage = 0.3;
                bleedingRate = 0.01;
            };
            class Medium {
                name = CSTRING(Avulsion_Medium);
                minDamage = 4;
                maxDamage = 8;
                bleedingRate = 0.02;
                lethalities[] = {{1, 0.10}, {0, 0.20}};
            };
            class Large {
                name = CSTRING(Avulsion_Large);
                minDamage = 8;
                bleedingRate = 0.05;
                lethalities[] = {{1, 0.30}, {0, 0.80}};
            };
        };
        // Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
        class Contusion {
            name = CSTRING(Contusion);
            selections[] = {"All"};
            bleedingRate = 0.0;
            pain = 0.05;
            causes[] = {"bullet", "backblast", "punch", "vehiclecrash", "falling"};
            minDamage = 0.01;
            maxDamage = 0.1;
            class Minor {
                name = CSTRING(Contusion_Minor);
                minDamage = 0.01;
                maxDamage = 0.1;
            };
            class Medium {
                name = CSTRING(Contusion_Medium);
                minDamage = 0.1;
                maxDamage = 0.15;
            };
            class Large {
                name = CSTRING(Contusion_Large);
                minDamage = 0.15;
                maxDamage = 0.2;
            };
        };
        // Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
        class CrushWound {
            name = CSTRING(Crush);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.1;
            causes[] = {"falling", "vehiclecrash", "punch", "unknown"};
            minDamage = 0.1;
            class Minor {
                name = CSTRING(Crush_Minor);
                minDamage = 0.1;
                maxDamage = 0.45;
                bleedingRate = 0.005;
            };
            class Medium {
                name = CSTRING(Crush_Medium);
                minDamage = 0.3;
                maxDamage = 0.7;
                bleedingRate = 0.007;
            };
            class Large {
                name = CSTRING(Crush_Large);
                minDamage = 0.6;
                bleedingRate = 0.0095;
                lethalities[] = {{1, 0.20}, {0, 0.60}};
            };
        };
        // Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
        class Cut {
            name = CSTRING(Cut);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"vehiclecrash", "grenade", "explosive", "shell", "backblast", "stab", "unknown"};
            minDamage = 0.1;
            class Minor {
                name = CSTRING(Cut_Minor);
                minDamage = 0.1;
                maxDamage = 0.3;
                bleedingRate = 0.005;
            };
            class Medium {
                name = CSTRING(Cut_Medium);
                minDamage = 0.3;
                maxDamage = 0.65;
                bleedingRate = 0.02;
            };
            class Large {
                name = CSTRING(Cut_Large);
                minDamage = 0.65;
                bleedingRate = 0.05;
            };
        };
        // Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
        class Laceration {
            name = CSTRING(Laceration);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"vehiclecrash", "punch"};
            minDamage = 0.01;
            class Minor {
                name = CSTRING(Laceration_Minor);
                minDamage = 0.1;
                maxDamage = 0.5;
                bleedingRate = 0.005;
            };
            class Medium {
                name = CSTRING(Laceration_Medium);
                minDamage = 0.5;
                maxDamage = 0.7;
                bleedingRate = 0.01;
            };
            class Large {
                name = CSTRING(Laceration_Large);
                minDamage = 0.7;
                bleedingRate = 0.03;
            };
        };
        // Also called velocity wounds, they are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
        class velocityWound {
            name = CSTRING(VelocityWound);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.2;
            causes[] = {"bullet", "grenade","explosive", "shell", "unknown"};
            minDamage = 0.15;
            class Minor {
                name = CSTRING(VelocityWound_Minor);
                minDamage = 0.15;
                maxDamage = 3.5;
                bleedingRate = 0.025;
                lethalities[] = {{1, 0.05}, {0, 0.20}};
            };
            class Medium {
                name = CSTRING(VelocityWound_Medium);
                minDamage = 3.5;
                maxDamage = 8;
                bleedingRate = 0.05;
                lethalities[] = {{1, 0.15}, {0, 0.60}};
            };
            class Large {
                name = CSTRING(VelocityWound_Large);
                minDamage = 8;
                bleedingRate = 0.1;
                lethalities[] = {{1, 0.45}, {0, 0.90}};
            }; 
        };
        // Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
        class punctureWound {
            name = CSTRING(PunctureWound);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"stab", "grenade"};
            minDamage = 0.01;
            class Minor {
                name = CSTRING(PunctureWound_Minor);
                minDamage = 0.01;
                maxDamage = 0.5;
                bleedingRate = 0.01;
            };
            class Medium {
                name = CSTRING(PunctureWound_Medium);
                minDamage = 0.5;
                maxDamage = 0.75;
                bleedingRate = 0.03;
                lethalities[] = {{1, 0.15}, {0, 0.60}};
            };
            class Large {
                name = CSTRING(PunctureWound_Large);
                minDamage = 0.65;
                bleedingRate = 0.08;
                lethalities[] = {{1, 0.45}, {0, 0.90}};
            };
        };
    };
    class fractures {
        class Femur {
            name = CSTRING(Femur);
            selections[] = {"Head", "Body"};
            pain = 0.2;
            causes[] = {"Bullet", "VehicleCrash", "Backblast", "Explosive", "Shell", "Grenade"};
            minDamage = 0.5;
        };
    };
    class damageTypes {
        thresholds[] = {{0.1, 1}};
        selectionSpecific = 1;

        class bullet {
            // above damage, amount. Put the highest threshold to the left and lower the threshold with the elements to the right of it.
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
        };
        class grenade {
            thresholds[] = {{0.1, 3}, {0, 1}};
            selectionSpecific = 0;
        };
        class explosive {
            thresholds[] = {{1, 6}, {0.1, 4}, {0, 1}};
            selectionSpecific = 0;
        };
        class shell {
            thresholds[] = {{1, 7}, {0.1, 5}, {0, 1}};
            selectionSpecific = 0;
        };
        class vehiclecrash {
            thresholds[] = {{0.25, 5}, {0.05, 1}};
            selectionSpecific = 0;
        };
        class backblast {
            thresholds[] = {{1, 6}, {0.55, 5}, {0, 2}};
            selectionSpecific = 0;
        };
        class stab {
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
        };
        class punch {
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
        };
        class falling {
            thresholds[] = {{0.6, 4}, {0.35, 2}, {0.1, 1}};
            selectionSpecific = 1;
        };
        class ropeburn {
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
        };
        class unknown {
            thresholds[] = {{0.1, 1}};
        };
    };
};
