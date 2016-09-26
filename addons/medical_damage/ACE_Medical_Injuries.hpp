class ACE_Medical_Injuries {
    // Defines all the possible injury types for advanced medical
    class wounds {
        // Source: Scarle
        //  Also called scrapes, they occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
        class Abrasion {
            name = ECSTRING(medical,Wounds_Abrasion);
            selections[] = {"All"};
            bleedingRate = 0.0001;
            pain = 0.01;
            causes[] = {"falling", "ropeburn", "vehiclecrash", "unknown"};
            minDamage = 0.01;
            class Minor {
                name = ECSTRING(medical,Wounds_Abrasion_Minor);
                minDamage = 0.01;
                maxDamage = 0.2;
                bleedingRate = 0.0001;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Abrasion_Medium);
                minDamage = 0.2;
                maxDamage = 0.3;
                bleedingRate = 0.00015;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Abrasion_Large);
                minDamage = 0.3;
                maxDamage = 0.5;
                bleedingRate = 0.0002;
            };
        };
        // Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
        class Avulsions {
            name = ECSTRING(medical,Wounds_Avulsion);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.3;
            causes[] = {"explosive", "vehiclecrash", "grenade", "shell", "bullet", "backblast", "bite"};
            minDamage = 0.2;
            class Minor {
                name = ECSTRING(medical,Wounds_Avulsion_Minor);
                minDamage = 0.2;
                maxDamage = 0.3;
                bleedingRate = 0.01;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Avulsion_Medium);
                minDamage = 0.3;
                maxDamage = 0.6;
                bleedingRate = 0.02;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Avulsion_Large);
                minDamage = 0.5;
                bleedingRate = 0.05;
            };
        };
        // Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
        class Contusion {
            name = ECSTRING(medical,Wounds_Contusion);
            selections[] = {"All"};
            bleedingRate = 0.0;
            pain = 0.05;
            causes[] = {"bullet", "backblast", "punch", "vehiclecrash", "falling"};
            minDamage = 0.01;
            maxDamage = 0.1;
            class Minor {
                name = ECSTRING(medical,Wounds_Contusion_Minor);
                minDamage = 0.01;
                maxDamage = 0.1;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Contusion_Medium);
                minDamage = 0.1;
                maxDamage = 0.15;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Contusion_Large);
                minDamage = 0.15;
                maxDamage = 0.2;
            };
        };
        // Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
        class CrushWound {
            name = ECSTRING(medical,Wounds_Crush);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.1;
            causes[] = {"falling", "vehiclecrash", "punch", "unknown"};
            minDamage = 0.1;
            class Minor {
                name = ECSTRING(medical,Wounds_Crush_Minor);
                minDamage = 0.1;
                maxDamage = 0.45;
                bleedingRate = 0.005;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Crush_Medium);
                minDamage = 0.4;
                maxDamage = 0.7;
                bleedingRate = 0.007;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Crush_Large);
                minDamage = 0.6;
                bleedingRate = 0.0095;
            };
        };
        // Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
        class Cut {
            name = ECSTRING(medical,Wounds_Cut);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"vehiclecrash", "grenade", "explosive", "shell", "backblast", "stab", "unknown"};
            minDamage = 0.1;
            class Minor {
                name = ECSTRING(medical,Wounds_Cut_Minor);
                minDamage = 0.1;
                maxDamage = 0.3;
                bleedingRate = 0.005;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Cut_Medium);
                minDamage = 0.3;
                maxDamage = 0.65;
                bleedingRate = 0.02;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Cut_Large);
                minDamage = 0.65;
                bleedingRate = 0.05;
            };
        };
        // Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
        class Laceration {
            name = ECSTRING(medical,Wounds_Laceration);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"vehiclecrash", "punch"};
            minDamage = 0.01;
            class Minor {
                name = ECSTRING(medical,Wounds_Laceration_Minor);
                minDamage = 0.1;
                maxDamage = 0.5;
                bleedingRate = 0.005;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_Laceration_Medium);
                minDamage = 0.5;
                maxDamage = 0.7;
                bleedingRate = 0.01;
            };
            class Large {
                name = ECSTRING(medical,Wounds_Laceration_Large);
                minDamage = 0.7;
                bleedingRate = 0.03;
            };
        };
        // Also called velocity wounds, they are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
        class velocityWound {
            name = ECSTRING(medical,Wounds_VelocityWound);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.2;
            causes[] = {"bullet", "grenade","explosive", "shell", "unknown"};
            minDamage = 0.15;
            class Minor {
                name = ECSTRING(medical,Wounds_VelocityWound_Minor);
                minDamage = 0.15;
                maxDamage = 0.3;
                bleedingRate = 0.025;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_VelocityWound_Medium);
                minDamage = 0.3;
                maxDamage = 0.75;
                bleedingRate = 0.05;
            };
            class Large {
                name = ECSTRING(medical,Wounds_VelocityWound_Large);
                minDamage = 0.75;
                bleedingRate = 0.1;
            };
        };
        // Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
        class punctureWound {
            name = ECSTRING(medical,Wounds_PunctureWound);
            selections[] = {"All"};
            bleedingRate = 0.01;
            pain = 0.075;
            causes[] = {"stab", "grenade"};
            minDamage = 0.01;
            class Minor {
                name = ECSTRING(medical,Wounds_PunctureWound_Minor);
                minDamage = 0.01;
                maxDamage = 0.5;
                bleedingRate = 0.01;
            };
            class Medium {
                name = ECSTRING(medical,Wounds_PunctureWound_Medium);
                minDamage = 0.5;
                maxDamage = 0.75;
                bleedingRate = 0.03;
            };
            class Large {
                name = ECSTRING(medical,Wounds_PunctureWound_Large);
                minDamage = 0.65;
                bleedingRate = 0.08;
            };
        };
    };
    class fractures {
        class Femur {
            name = ECSTRING(medical,Wounds_Femur);
            selections[] = {"Head", "Body"};
            pain = 0.2;
            causes[] = {"Bullet", "VehicleCrash", "Backblast", "Explosive", "Shell", "Grenade"};
            minDamage = 0.5;
        };
    };
    class damageTypes {
        thresholds[] = {{0.1, 1}};
        selectionSpecific = 1;
        lethalDamage = 0.01;

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
            lethalDamage = 0.2;
        };
        class backblast {
            thresholds[] = {{1, 6}, {0.55, 5}, {0, 2}};
            selectionSpecific = 0;
            lethalDamage = 1;
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
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
            lethalDamage = 0.4;
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
