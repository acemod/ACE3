import math

def retard(dm, bc, v):
    mach = v / 340.276
    CDs = []
    Ms = []
    if (dm) == 1:
        CDs = [0.2629, 0.2558, 0.2487, 0.2413, 0.2344, 0.2278, 0.2214, 0.2155, 0.2104, 0.2061, 0.2032, 0.2020, 0.2034, 0.2165, 0.2230, 0.2313, 0.2417, 0.2546, 0.2706, 0.2901, 0.3136, 0.3415, 0.3734, 0.4084, 0.4448, 0.4805, 0.5136, 0.5427, 0.5677, 0.5883, 0.6053, 0.6191, 0.6393, 0.6518, 0.6589, 0.6621, 0.6625, 0.6607, 0.6573, 0.6528, 0.6474, 0.6413, 0.6347, 0.6280, 0.6210, 0.6141, 0.6072, 0.6003, 0.5934, 0.5867, 0.5804, 0.5743, 0.5685, 0.5630, 0.5577, 0.5527, 0.5481, 0.5438, 0.5397, 0.5325, 0.5264, 0.5211, 0.5168, 0.5133, 0.5105, 0.5084, 0.5067, 0.5054, 0.5040, 0.5030, 0.5022, 0.5016, 0.5010, 0.5006, 0.4998, 0.4995, 0.4992, 0.4990, 0.4988]
        Ms = [0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.70, 0.725, 0.75, 0.775, 0.80, 0.825, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.125, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.60, 2.70, 2.80, 2.90, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    elif (dm) == 2:
        CDs = [0.2303, 0.2298, 0.2287, 0.2271, 0.2251, 0.2227, 0.2196, 0.2156, 0.2107, 0.2048, 0.1980, 0.1905, 0.1828, 0.1758, 0.1702, 0.1669, 0.1664, 0.1667, 0.1682, 0.1711, 0.1761, 0.1831, 0.2004, 0.2589, 0.3492, 0.3983, 0.4075, 0.4103, 0.4114, 0.4106, 0.4089, 0.4068, 0.4046, 0.4021, 0.3966, 0.3904, 0.3835, 0.3759, 0.3678, 0.3594, 0.3512, 0.3432, 0.3356, 0.3282, 0.3213, 0.3149, 0.3089, 0.3033, 0.2982, 0.2933, 0.2889, 0.2846, 0.2806, 0.2768, 0.2731, 0.2696, 0.2663, 0.2632, 0.2602, 0.2572, 0.2543, 0.2515, 0.2487, 0.2460, 0.2433, 0.2408, 0.2382, 0.2357, 0.2333, 0.2309, 0.2262, 0.2217, 0.2173, 0.2132, 0.2091, 0.2052, 0.2014, 0.1978, 0.1944, 0.1912, 0.1851, 0.1794, 0.1741, 0.1693, 0.1648]
        Ms = [0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.775, 0.80, 0.825, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.125, 1.15, 1.175, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.55, 2.60, 2.65, 2.70, 2.75, 2.80, 2.85, 2.90, 2.95, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    elif (dm) == 5:
        CDs = [0.1710, 0.1719, 0.1727, 0.1732, 0.1734, 0.1730, 0.1718, 0.1696, 0.1668, 0.1637, 0.1603, 0.1566, 0.1529, 0.1497, 0.1473, 0.1463, 0.1489, 0.1583, 0.1672, 0.1815, 0.2051, 0.2413, 0.2884, 0.3379, 0.3785, 0.4032, 0.4147, 0.4201, 0.4278, 0.4338, 0.4373, 0.4392, 0.4403, 0.4406, 0.4401, 0.4386, 0.4362, 0.4328, 0.4286, 0.4237, 0.4182, 0.4121, 0.4057, 0.3991, 0.3926, 0.3861, 0.3800, 0.3741, 0.3684, 0.3630, 0.3578, 0.3529, 0.3481, 0.3435, 0.3391, 0.3349, 0.3269, 0.3194, 0.3125, 0.3060, 0.2999, 0.2942, 0.2889, 0.2838, 0.2790, 0.2745, 0.2703, 0.2662, 0.2624, 0.2588, 0.2553, 0.2488, 0.2429, 0.2376, 0.2326, 0.2280]
        Ms = [0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.60, 2.70, 2.80, 2.90, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    elif (dm) == 6:
        CDs = [0.2617, 0.2553, 0.2491, 0.2432, 0.2376, 0.2324, 0.2278, 0.2238, 0.2205, 0.2177, 0.2155, 0.2138, 0.2126, 0.2121, 0.2122, 0.2132, 0.2154, 0.2194, 0.2229, 0.2297, 0.2449, 0.2732, 0.3141, 0.3597, 0.3994, 0.4261, 0.4402, 0.4465, 0.4490, 0.4497, 0.4494, 0.4482, 0.4464, 0.4441, 0.4390, 0.4336, 0.4279, 0.4221, 0.4162, 0.4102, 0.4042, 0.3981, 0.3919, 0.3855, 0.3788, 0.3721, 0.3652, 0.3583, 0.3515, 0.3447, 0.3381, 0.3314, 0.3249, 0.3185, 0.3122, 0.3060, 0.3000, 0.2941, 0.2883, 0.2772, 0.2668, 0.2574, 0.2487, 0.2407, 0.2333, 0.2265, 0.2202, 0.2144, 0.2089, 0.2039, 0.1991, 0.1947, 0.1905, 0.1866, 0.1794, 0.1730, 0.1673, 0.1621, 0.1574]
        Ms = [0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.125, 1.15, 1.175, 1.20, 1.225, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.60, 2.70, 2.80, 2.90, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    elif (dm) == 7:
        CDs = [0.1198, 0.1197, 0.1196, 0.1194, 0.1193, 0.1194, 0.1194, 0.1194, 0.1193, 0.1193, 0.1194, 0.1193, 0.1194, 0.1197, 0.1202, 0.1207, 0.1215, 0.1226, 0.1242, 0.1266, 0.1306, 0.1368, 0.1464, 0.1660, 0.2054, 0.2993, 0.3803, 0.4015, 0.4043, 0.4034, 0.4014, 0.3987, 0.3955, 0.3884, 0.3810, 0.3732, 0.3657, 0.3580, 0.3440, 0.3376, 0.3315, 0.3260, 0.3209, 0.3160, 0.3117, 0.3078, 0.3042, 0.3010, 0.2980, 0.2951, 0.2922, 0.2892, 0.2864, 0.2835, 0.2807, 0.2779, 0.2752, 0.2725, 0.2697, 0.2670, 0.2643, 0.2615, 0.2588, 0.2561, 0.2533, 0.2506, 0.2479, 0.2451, 0.2424, 0.2368, 0.2313, 0.2258, 0.2205, 0.2154, 0.2106, 0.2060, 0.2017, 0.1975, 0.1935, 0.1861, 0.1793, 0.1730, 0.1672, 0.1618]
        Ms = [0.0, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.725, 0.75, 0.775, 0.80, 0.825, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.125, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.55, 2.60, 2.65, 2.70, 2.75, 2.80, 2.85, 2.90, 2.95, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    elif (dm) == 8:
        CDs = [0.2105, 0.2105, 0.2104, 0.2104, 0.2103, 0.2103, 0.2103, 0.2103, 0.2103, 0.2102, 0.2102, 0.2102, 0.2102, 0.2102, 0.2103, 0.2103, 0.2104, 0.2104, 0.2105, 0.2106, 0.2109, 0.2183, 0.2571, 0.3358, 0.4068, 0.4378, 0.4476, 0.4493, 0.4477, 0.4450, 0.4419, 0.4353, 0.4283, 0.4208, 0.4133, 0.4059, 0.3986, 0.3915, 0.3845, 0.3777, 0.3710, 0.3645, 0.3581, 0.3519, 0.3458, 0.3400, 0.3343, 0.3288, 0.3234, 0.3182, 0.3131, 0.3081, 0.3032, 0.2983, 0.2937, 0.2891, 0.2845, 0.2802, 0.2720, 0.2642, 0.2569, 0.2499, 0.2432, 0.2368, 0.2308, 0.2251, 0.2197, 0.2147, 0.2101, 0.2058, 0.2019, 0.1983, 0.1950, 0.1890, 0.1837, 0.1791, 0.1750, 0.1713]
        Ms = [0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.825, 0.85, 0.875, 0.90, 0.925, 0.95, 0.975, 1.0, 1.025, 1.05, 1.075, 1.10, 1.125, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45, 1.50, 1.55, 1.60, 1.65, 1.70, 1.75, 1.80, 1.85, 1.90, 1.95, 2.00, 2.05, 2.10, 2.15, 2.20, 2.25, 2.30, 2.35, 2.40, 2.45, 2.50, 2.60, 2.70, 2.80, 2.90, 3.00, 3.10, 3.20, 3.30, 3.40, 3.50, 3.60, 3.70, 3.80, 3.90, 4.00, 4.20, 4.40, 4.60, 4.80, 5.00]
    for i in range(len(Ms)):
        if Ms[i] >= mach:
            previousIdx = max(0, i - 1);
            lc = CDs[previousIdx];
            lm = Ms[previousIdx];
            tc = lc + (CDs[i] - lc) * (mach - lm) / (Ms[i] - lm)
            return 0.00068418 * (tc / bc) * pow(v, 2)
    return 0

def distanceAtTOF2(tof, v, dM, bc):
    lx = 0
    lt = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    t = 0
    while t <= tof:
        lx = dx
        lt = t
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        t = t+1/2
    return lx + (tof - lt) * (dx - lx) / (t - lt)

def velocityAtM(m, v, a):
    lx = 0
    lv = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        lx = dx
        lv = v
        drag = a*pow(v,2)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
    return lv + (m - lx) * (v - lv) / (dx - lx)
   
def velocityAtM2(m, v, dM, bc):
    lx = 0
    lv = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        lx = dx
        lv = v
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
    return lv + (m - lx) * (v - lv) / (dx - lx)

def velocityTillM(m, v, a, g):
    velocities = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        velocities[round(dx)] = v
        drag = a*pow(v,2)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * g
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        
    return velocities

def velocityTillM2(m, v, dM, bc):
    velocities = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        velocities[round(dx)] = v
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        
    return velocities

def tofAtM(m, v, a):
    lx = 0
    lt = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    t = 0
    while dx <= m:
        lx = dx
        lt = t
        drag = a*pow(v,2)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        t = t+1/2
    return lt + (m - lx) * (t - lt) / (dx - lx)

def tofAtM2(m, v, dM, bc):
    lx = 0
    lt = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    t = 0
    while dx <= m:
        lx = dx
        lt = t
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        t = t+1/2
    return lt + (m - lx) * (t - lt) / (dx - lx)

def tofTillM(m, v, a, g):
    times = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    t = 0
    while dx <= m:
        times[round(dx)] = t
        drag = a*pow(v,2)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * g
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        t = t+1/2
    return times

def tofTillM2(m, v, dM, bc):
    times = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    t = 0
    while dx <= m:
        times[round(dx)] = t
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        t = t+1/2
    return times

def dropAtM(m, v, a):
    lx = 0
    ly = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        lx = dx
        ly = dy
        drag = a*pow(v,2)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
    return ly + (m - lx) * (dy - ly) / (dx - lx)

def dropAtM2(m, v, dM, bc):
    lx = 0
    ly = 0
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx <= m:
        lx = dx
        ly = dy
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
    return ly + (m - lx) * (dy - ly) / (dx - lx)

def dropTillM(m, v, a, g):
    drops = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx < m:
        drops[round(dx)] = dy
        drag = a*v*v
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * g
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        
    return drops

def dropTillM2(m, v, dM, bc):
    drops = [0] * round(m + 1)
    dx = 0
    dy = 0
    vx = v
    vy = 0
    drag = 0
    while dx < m:
        drops[round(dx)] = dy
        drag = retard(dM, bc, v)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        vx = vx - (1/2000) * (vx/v) * drag
        vy = vy - (1/2000) * (vy/v) * drag
        vy = vy + (1/2000) * 9.8066
        v = math.sqrt(vx*vx+vy*vy)
        dx = dx+(1/2000)*vx*0.5
        dy = dy+(1/2000)*vy*0.5
        
    return drops

def tofAtMDiff(m, v, a, d, bc):
    return tofAtM2(m, v, d, bc)-tofAtM(m, v, a)

def tofAtMDiffBC(m, v, dM1, bc1, dM2, bc2):
    return tofAtM2(m, v, dM1, bc1)-tofAtM2(m, v, dM2, bc2)

def velocityAtMDiff(m, v, a, d, bc):
    return velocityAtM2(m, v, d, bc)-velocityAtM(m, v, a)

def velocityAtMDiffBC(m, v, dM1, bc1, dM2, bc2):
    return velocityAtM2(m, v, dM1, bc1)-velocityAtM2(m, v, dM2, bc2)

def dragAtV(v, a):
    return a*v^2

def dragAtV2(v, d, bc):
    return retard(d, bc, v)

def dragAtVDiff(v, a, d, bc):
    return retard(d, bc, v)-a*pow(v,2)

def dropAtMDiff(m, v, a, d, bc):
    return dropAtM2(m, v, d, bc)-dropAtM(m, v, a)

def dropAtMDiffBC(m, v, dM1, bc1, dM2, bc2):
    return dropAtM2(m, v, dM1, bc1)-dropAtM2(m, v, dM2, bc2)

def airFrictionAtV(v, d, bc):
    return retard(d, bc, v)/pow(v,2)

def maxDropDiff(m, v, a, dM, bc):
    maxDiff = 0
    drops1 = dropTillM(m, v, a, 9.8066)
    drops2 = dropTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(drops2[d] - drops1[d]))
    return maxDiff

def maxDropDiffG(m, v, a, dM, bc, g):
    maxDiff = 0
    drops1 = dropTillM(m, v, a, g)
    drops2 = dropTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(drops2[d] - drops1[d]))
    return maxDiff

def maxDropDiffV(distances, velocities, a, dM, bc):
    maxDiff = 0
    for m, v in zip(distances, velocities):
        drops1 = dropTillM(m, v, a, 9.8066)
        drops2 = dropTillM2(m, v, dM, bc)
        for d in range(0, m):
            maxDiff = max(maxDiff, abs(drops2[d] - drops1[d]))
    return maxDiff

def maxDropDiffBC(m, v, dM1, bc1, dM2, bc2):
    maxDiff = 0
    drops1 = dropTillM2(m, v, dM1, bc1)
    drops2 = dropTillM2(m, v, dM2, bc2)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(drops2[d] - drops1[d]))
    return maxDiff

def maxVelocityDiff(m, v, a, dM, bc):
    maxDiff = 0
    velocities1 = velocityTillM(m, v, a, 9.8066)
    velocities2 = velocityTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(velocities2[d] - velocities1[d]))
    return maxDiff

def maxVelocityDiffG(m, v, a, dM, bc, g):
    maxDiff = 0
    velocities1 = velocityTillM(m, v, a, g)
    velocities2 = velocityTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(velocities2[d] - velocities1[d]))
    return maxDiff

def maxVelocityDiffV(distances, velocities, a, dM, bc):
    maxDiff = 0
    for m, v in zip(distances, velocities):
        velocities1 = velocityTillM(m, v, a, 9.8066)
        velocities2 = velocityTillM2(m, v, dM, bc)
        for d in range(0, m):
            maxDiff = max(maxDiff, abs(velocities2[d] - velocities1[d]))
    return maxDiff

def maxVelocityDiffBC(m, v, dM1, bc1, dM2, bc2):
    maxDiff = 0
    velocities1 = velocityTillM2(m, v, dM1, bc1)
    velocities2 = velocityTillM2(m, v, dM2, bc2)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(velocities2[d] - velocities1[d]))
    return maxDiff

def maxTOFDiff(m, v, a, dM, bc):
    maxDiff = 0
    times1 = tofTillM(m, v, a, 9.8066)
    times2 = tofTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(times2[d] - times1[d]))
    return maxDiff

def maxTOFDiffG(m, v, a, dM, bc, g):
    maxDiff = 0
    times1 = tofTillM(m, v, a, g)
    times2 = tofTillM2(m, v, dM, bc)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(times2[d] - times1[d]))
    return maxDiff

def maxTOFDiffV(distances, velocities, a, dM, bc):
    maxDiff = 0
    for m, v in zip(distances, velocities):
        times1 = tofTillM(m, v, a, 9.8066)
        times2 = tofTillM2(m, v, dM, bc)
        for d in range(0, m):
            maxDiff = max(maxDiff, abs(times2[d] - times1[d]))
    return maxDiff

def maxTOFDiffBC(m, v, dM1, bc1, dM2, bc2):
    maxDiff = 0
    times1 = tofTillM2(m, v, dM1, bc1)
    times2 = tofTillM2(m, v, dM2, bc2)
    for d in range(0, m):
        maxDiff = max(maxDiff, abs(times2[d] - times1[d]))
    return maxDiff

def predictAirFriction(mv, thresholdVelocity, dragModel, bc):
    airFrictions = []
    for v in range(1,1000):
        airFrictions.append(retard(dragModel, bc, v) / pow(v, 2))

    arr = airFrictions[thresholdVelocity:mv]
    return sum(arr)/len(arr)

def calculateAirFriction(v, dragModel, bc):
    return retard(dragModel, bc, v) / pow(v, 2)

# Each list entry needs to be in the following form:
# [ammo name, list of engagement ranges, list of muzzle velocities, drag model, ballistic coefficient]
ammoList = [["B_556x45_Ball", [300, 500, 500], [750, 870, 910], 7, 0.151],
            ["ACE_556x45_Ball_Mk262", [600, 600], [810, 840], 1, 0.361],
            ["ACE_556x45_Ball_Mk318", [300, 500, 500], [780, 880, 950], 1, 0.307],
            ["ACE_556x45_Ball_M995_AP", [400, 500], [820, 880], 1, 0.310],
            ["B_545x39_Ball_F", [400, 500], [735, 892], 7, 0.168],
            ["B_580x42_Ball_F", [500, 500], [930, 970], 7, 0.156],
            ["B_65x39_Caseless", [400, 800, 800], [730, 800, 830], 7, 0.263],
            ["ACE_65x47_Ball_Scenar", [500, 800], [730, 830], 7, 0.290],
            ["ACE_65_Creedmor_Ball", [600, 1000], [750, 860], 7, 0.317],
            ["B_762x51_Ball", [500, 800], [700, 833], 7, 0.2],
            ["ACE_762x51_Ball_M118LR", [600, 800], [750, 795], 7, 0.243],
            ["ACE_762x51_Ball_Mk316_Mod_0", [600, 800], [780, 810], 7, 0.243],
            ["ACE_762x51_Ball_Mk319_Mod_0", [600, 800], [840, 910], 1, 0.377],
            ["ACE_762x51_Ball_M993_AP", [600, 800], [875, 930], 1, 0.359],
            ["ACE_30_06_M1_Ball", [600, 800, 900], [700, 800, 840], 1, 0.494],
            ["ACE_7_Remington_Magnum_Ball", [600, 800, 1000], [720, 812, 830], 7, 0.345],
            ["ACE_243_Winchester_Ball", [700, 900, 900], [830, 900, 920], 7, 0.278],
            ["ACE_762x67_Ball_Mk248_Mod_0", [800, 900, 900], [865, 900, 924], 7, 0.268],
            ["ACE_762x67_Ball_Mk248_Mod_1", [800, 900, 900], [847, 867, 877], 7, 0.310],
            ["ACE_762x67_Ball_Berger_Hybrid_OTM", [900, 1000, 1000], [800, 853, 884], 7, 0.368],
            ["B_762x54_Ball", [500, 800, 800], [760, 835, 865], 1, 0.4],
            ["ACE_762x35_Ball", [400, 500], [620, 675], 1, 0.330],
            ["ACE_762x39_Ball", [400, 600], [650, 750], 1, 0.275],
            ["ACE_762x54_Ball_7T2", [500, 800, 800], [735, 809, 838], 1, 0.395],
            ["ACE_303_Ball", [900, 1000], [748, 765], 1, 0.493],
            ["B_93x64_Ball", [900, 1000], [850, 880], 1, 0.368],
            ["B_408_Ball", [1600,1600], [862, 872], 7, 0.434],
            ["ACE_408_Ball", [1200,1200], [1057, 1067], 7, 0.279],
            ["ACE_106x83mm_Ball", [1500, 1500], [955, 965], 1, 0.72],
            ["B_338_Ball", [1100, 1300], [880, 925], 7, 0.322],
            ["B_338_NM_Ball", [1100, 1300], [790, 820], 7, 0.381],
            ["ACE_338_Ball", [1200, 1300], [800, 830], 7, 0.368],
            ["ACE_338_Ball_API526", [1200, 1300], [880, 920], 7, 0.29],
            ["B_50BW_Ball_F", [300, 400], [510, 596], 1, 0.21],
            ["B_127x99_Ball", [1300, 1300], [895, 905], 1, 0.67],
            ["ACE_127x99_Ball_AMAX", [1600, 1600], [855, 865], 1, 1.05],
            ["B_127x108_Ball", [1300, 1300], [815, 825], 1, 0.63],
            ["ACE_762x51_Ball_Subsonic", [200, 300], [305, 340], 7, 0.235],
            ["B_9x21_Ball", [200, 300], [380, 420], 1, 0.165],
            ["ACE_9x18_Ball_57N181S", [100, 200, 200], [298, 330, 350], 1, 0.125],
            ["ACE_9x19_Ball", [100, 200, 200], [340, 370, 400], 1, 0.165],
            ["ACE_10x25_Ball", [200, 300, 300], [360, 400, 430], 1, 0.189],
            ["ACE_765x17_Ball", [100, 200, 200], [282, 300, 320], 1, 0.118],
            ["B_127x54_Ball", [500, 500], [295, 305], 1, 1.050],
            ["B_45ACP_Ball", [100, 200, 200], [230, 250, 285], 1, 0.195]]

print ("Calculating ...")
print ("")

open('../extras/airFrictionAnalysis.txt', 'w').close()

for ammo in ammoList:
    name = ammo[0]
    maxRanges = ammo[1]
    mvs = ammo[2]
    dragModel = ammo[3]
    BC = ammo[4]
    
    mv = round(sum(mvs) / len(mvs))
    bestA = calculateAirFriction(mv, dragModel, BC)
    if (mv < 360):
        bestA = predictAirFriction(mv, mv - 20, dragModel, BC)
    else:
        bestA = predictAirFriction(mv, 340, dragModel, BC)
    minDropDiff = 100
    interval = 0.0003

    while interval > 0.0000001:
        low = bestA - interval
        high = bestA + interval
        a = low
        while a < high:
            dropDiff = maxDropDiffV(maxRanges, mvs, a, dragModel, BC)
            if dropDiff < minDropDiff:
                minDropDiff = dropDiff
                bestA = a
            a = a + interval / 10

        interval = interval / 2

    print (str(name) + " -> " + str(round(bestA, 8)))
    with open('../extras/airFrictionAnalysis.txt', 'a') as f:
        print ("##########################################", file=f)
        print ("Ammo Class: " + name, file=f)
        print ("MaxRanges (m): " + str(maxRanges), file=f)
        print ("MuzzleVelocities (m/s): " + str(mvs), file=f)
        print ("Max. Velocity diff (m/s): " + str(round(maxVelocityDiffV(maxRanges, mvs, bestA, dragModel, BC), 2)), file=f)
        print ("Max. Drop diff (cm): " + str(round(minDropDiff * 100, 2)), file=f)
        print ("Max. Tof diff (ms): " + str(maxTOFDiffV(maxRanges, mvs, bestA, dragModel, BC)), file=f)
        print ("Optimal airFriction: " + str(round(bestA, 8)), file=f)

