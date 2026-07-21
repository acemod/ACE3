import("stdfaust.lib");

noiseH = 0.9 + 0.1 * no.noise;
noiseL = 0.99 + 0.01 * no.noise;
chopA = 1 - 0.75 * (os.osc(49) ^ 12);
chopB = 1 - 0.75 * (os.osc(59) ^ 10);
chopC = 1 - 0.1 * (os.osc(.2) ^ 4);
fm1 = (0.7 + 0.3 * os.osc(90)) * (0.9 + 0.1 * os.osc(11));
fm2 = (0.8 + 0.2 * os.osc(90)) * (0.9 + 0.1 * os.osc(11));

harm(f) = 0.5 * os.osc(f) + 0.1 * os.osc(2 * f) + 0.15 * os.osc(3 * f) + 0.1 * os.osc(4 * f) + 0.1 * os.osc(5 * f) + 0.1 * os.osc(6 * f)+ 0.05 * os.osc(8 * f);

// locking:
//process = noiseL * chopA * chopB * chopC * fm2 * (0.6 * harm(1200) + 0.2 * os.osc(1100) + 0.2 * os.osc(1300));

// locked:
process = noiseL * fm2 * (1 * harm(1200));
