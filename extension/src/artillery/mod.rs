use std::f64::consts::{FRAC_PI_4, PI};

use arma_rs::{Context, Group};
use rayon::prelude::*;

use crate::common::{Temperature, GRAVITY};

mod simulate;

pub fn group() -> Group {
    Group::new().command("calculate_table", calculate_table)
}

fn calculate_table(
    ctx: Context,
    muzzle_velocity: f64,
    air_friction: f64,
    min_elev: f64,
    max_elev: f64,
    high_arc: bool,
) -> (f64, u32) {
    let mut min_elev = ((PI / 180.0) * min_elev).max(2.0 * (PI / 180.0)); // cap min to 2 degrees (negative elev might get messy)
    let mut max_elev = ((PI / 180.0) * max_elev).max(88.0 * (PI / 180.0)); // cap max to 88 degrees (mk6)
    let (best_angle, best_distance) = find_max_angle(muzzle_velocity, air_friction);
    if high_arc {
        min_elev = min_elev.max(best_angle);
    } else {
        max_elev = max_elev.min(best_angle);
    }
    let loop_start = if best_distance < 4000.0 { 50 } else { 100 };
    let loop_inc = if best_distance < 5000.0 { 50 } else { 100 }; // simplify when range gets high
    let loop_max_range = best_distance.min(30000.0) as u32; // with no air resistance, max range could go higher than 60km

    let ranges = (loop_start..loop_max_range).step_by(loop_inc);
    let ranges_size = ranges.len();

    std::thread::spawn(move || {
        if max_elev > min_elev {
            ranges
                .collect::<Vec<u32>>()
                .into_par_iter()
                .enumerate()
                .for_each(|(idx, range)| {
                    ctx.callback_data(
                        "ace:artillery",
                        "calculate_table",
                        (
                            idx as u32,
                            calc_range_table_line(
                                range as f64,
                                muzzle_velocity,
                                air_friction,
                                min_elev,
                                max_elev,
                                high_arc,
                            ),
                        ),
                    );
                });
        }
    });
    (best_distance, ranges_size as u32)
}

fn find_max_angle(muzzle_velocity: f64, air_friction: f64) -> (f64, f64) {
    if air_friction == 0.0 {
        return (FRAC_PI_4, muzzle_velocity * muzzle_velocity / GRAVITY);
    }

    let mut best_angle = FRAC_PI_4;
    let mut best_distance = -1.0;
    let mut test_angle = FRAC_PI_4;
    loop {
        let (_, result_distance, _) = simulate::shot(
            test_angle,
            muzzle_velocity,
            0.0,
            0.0,
            0.0,
            Temperature::new_15c(),
            1.0,
            air_friction,
        );
        if result_distance > best_distance {
            best_angle = test_angle;
            best_distance = result_distance;
        }

        test_angle -= FRAC_PI_4 / 100.0;
        if test_angle <= 0.0 {
            break;
        }
    }
    (best_angle, best_distance)
}

fn calc_range_table_line(
    range_to_hit: f64,
    muzzle_velocity: f64,
    air_friction: f64,
    min_elev: f64,
    max_elev: f64,
    high_arc: bool,
) -> Option<Vec<String>> {
    let (actual_distance, line_elevation, line_tof) = simulate::find_solution(
        range_to_hit,
        0.0,
        muzzle_velocity,
        air_friction,
        min_elev,
        max_elev,
        high_arc,
    );
    if line_tof < 0.0 {
        return None;
    }
    let (_, line_height_elevation, line_height_tof) = simulate::find_solution(
        range_to_hit,
        -100.0,
        muzzle_velocity,
        air_friction,
        min_elev,
        max_elev,
        high_arc,
    );

    let (dr_elev_adjust, dr_tof_adjust) = if line_height_elevation > 0.0 {
        (
            format!(
                "{:.1}",
                (line_height_elevation - line_elevation) * 3200.0 / PI
            ),
            format!("{:.1}", line_height_tof - line_tof),
        )
    } else {
        (String::from("-"), String::from("-"))
    };

    let (
        crosswind_offset,
        headwind_offset,
        tailwind_offset,
        temp_dec_offset,
        temp_inc_offset,
        air_density_dec_offset,
        air_density_inc_offset,
    ) = if air_friction == 0.0 {
        (
            String::from("-"),
            String::from("-"),
            String::from("-"),
            String::from("-"),
            String::from("-"),
            String::from("-"),
            String::from("-"),
        )
    } else {
        (
            {
                let (x_offset, _, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    10.0,
                    0.0,
                    Temperature::new_15c(),
                    1.0,
                    air_friction,
                );
                format!(
                    "{:0width$.1}",
                    x_offset.atan2(actual_distance) / 10.0 * 3200.0 / PI,
                    width = 1
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    -10.0,
                    Temperature::new_15c(),
                    1.0,
                    air_friction,
                );
                let headwind_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    headwind_offset,
                    width = 1,
                    precision = if headwind_offset.abs() > 9.949 { 0 } else { 1 }
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    10.0,
                    Temperature::new_15c(),
                    1.0,
                    air_friction,
                );
                let tailwind_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    tailwind_offset,
                    width = 1,
                    precision = if tailwind_offset.abs() > 9.949 { 0 } else { 1 }
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    0.0,
                    Temperature::new_celsius(5.0),
                    1.0,
                    air_friction,
                );
                let temp_dec_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    temp_dec_offset,
                    width = 1,
                    precision = if temp_dec_offset.abs() > 9.949 { 0 } else { 1 }
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    0.0,
                    Temperature::new_celsius(25.0),
                    1.0,
                    air_friction,
                );
                let temp_inc_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    temp_inc_offset,
                    width = 1,
                    precision = if temp_inc_offset.abs() > 9.949 { 0 } else { 1 }
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    0.0,
                    Temperature::new_15c(),
                    0.9,
                    air_friction,
                );
                let air_density_dec_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    air_density_dec_offset,
                    width = 1,
                    precision = if air_density_dec_offset.abs() > 9.949 {
                        0
                    } else {
                        1
                    }
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    muzzle_velocity,
                    0.0,
                    0.0,
                    0.0,
                    Temperature::new_15c(),
                    1.1,
                    air_friction,
                );
                let air_density_inc_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    air_density_inc_offset,
                    width = 1,
                    precision = if air_density_inc_offset.abs() > 9.949 {
                        0
                    } else {
                        1
                    }
                )
            },
        )
    };

    Some(vec![
        format!("{:.0}", range_to_hit),
        format!("{:.0}", line_elevation * 3200.0 / PI),
        dr_elev_adjust,
        dr_tof_adjust,
        format!(
            "{:.precision$}",
            line_tof,
            precision = if line_tof < 99.945 { 1 } else { 0 }
        ),
        crosswind_offset,
        headwind_offset,
        tailwind_offset,
        temp_dec_offset,
        temp_inc_offset,
        air_density_dec_offset,
        air_density_inc_offset,
    ])
}

#[cfg(test)]
mod tests {
    use std::{
        f64::EPSILON,
        sync::atomic::{AtomicI8, Ordering},
        time::Duration,
    };

    use arma_rs::{Extension, FromArma, Result, Value};

    use crate::artillery::calculate_table;

    use super::find_max_angle;

    #[test]
    fn test_find_max_angle() {
        let (best_angle, best_distance) = find_max_angle(400.0, -0.00005);
        assert!(best_angle - 0.730_420_291_959_627_2 < EPSILON); // old ace: 0.722566
        assert!(best_distance - 10_393.560_433_295_957 < EPSILON); // old ace: 10391.8
    }

    #[test]
    fn range_table_line() {
        let extension = Extension::build()
            .command("calc", calculate_table)
            .finish()
            .testing();
        let (output, code) = unsafe {
            extension.call(
                "calc",
                Some(vec![
                    400.0.to_string(),
                    (-0.00005).to_string(),
                    (-5.0).to_string(),
                    80.0.to_string(),
                    true.to_string(),
                ]),
            )
        };
        println!("{:?}", output);
        let (best, lines): (f64, i8) = FromArma::from_arma(output).unwrap();
        assert!(best - 10_393.560_433_295_957 < EPSILON);
        assert_eq!(lines, 103);
        let recv: AtomicI8 = AtomicI8::new(0);
        assert_eq!(code, 0);
        let result = extension.callback_handler(
            |name, func, data| {
                recv.fetch_add(1, Ordering::SeqCst);
                if name == "ace:artillery" && func == "calculate_table" {
                    if let Some(Value::Array(data)) = data {
                        if let Value::Array(line) = &data[1] {
                            if line[0] == Value::String(String::from("3500")) {
                                println!("data: {:?}", line);
                            }
                        }
                    }
                    if recv.load(Ordering::SeqCst) == lines {
                        Result::Ok(())
                    } else {
                        Result::Continue
                    }
                } else {
                    Result::Err(String::from("unexpected callback"))
                }
            },
            Duration::from_secs(10),
        );
        println!("result: {:?}", result);
        assert!(result.is_ok());
    }
}
