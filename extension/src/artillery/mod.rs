use std::f64::consts::{FRAC_PI_2, FRAC_PI_4, PI};

use arma_rs::{Context, Group};
use rayon::prelude::*;

use crate::common::{GRAVITY, Height, MuzzleVelocity, Temperature};

mod simulate;

pub fn group() -> Group {
    Group::new()
        .command("calculate_table", command_calculate_table)
        .command("simulate_shot", simulate::shot)
        .command("find_max_angle", find_max_angle)
        .command("simulate_find_solution", simulate::find_solution)
        .command("get_solution", command_get_solution)
}

fn command_calculate_table(
    ctx: Context,
    muzzle_velocity: MuzzleVelocity,
    air_friction: f64,
    min_elev: f64,
    max_elev: f64,
    high_arc: bool,
) -> (f64, u32) {
    let mut min_elev = ((PI / 180.0) * min_elev).max(2.0 * (PI / 180.0)); // cap min to 2 degrees (negative elev might get messy)
    let mut max_elev = ((PI / 180.0) * max_elev).min(88.0 * (PI / 180.0)); // cap max to 88 degrees (mk6)
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
                    if let Err(e) = ctx.callback_data(
                        "ace:artillery",
                        "calculate_table",
                        (
                            idx as u32,
                            calc_range_table_line(
                                f64::from(range),
                                muzzle_velocity,
                                air_friction,
                                high_arc,
                                min_elev,
                                max_elev,
                            ),
                        ),
                    ) {
                        eprintln!("calculate table error: {e:?}");
                    }
                });
        }
    });
    (best_distance, ranges_size as u32)
}

#[allow(clippy::too_many_arguments)]
fn command_get_solution(
    range_to_hit: f64,
    height_of_target: Height,
    muzzle_velocity: MuzzleVelocity,
    air_friction: f64,
    high_arc: bool,
    cross_wind: f64,
    tail_wind: f64,
    temperature: Temperature,
    air_density: f64,
) -> (f64, f64, f64) {
    let (distance, elevation, _) = simulate::find_solution(
        range_to_hit,
        height_of_target,
        muzzle_velocity,
        air_friction,
        high_arc,
        0.0,
        FRAC_PI_2,
        temperature,
        air_density,
    );
    if distance == -1.0 {
        return (-1.0, -1.0, -1.0);
    }
    let (mut x_sim, mut y_sim, mut tof) = simulate::shot(
        elevation,
        height_of_target,
        muzzle_velocity,
        air_friction,
        cross_wind,
        tail_wind,
        temperature,
        air_density,
    );
    let mut y_offset = range_to_hit - y_sim;
    let mut y_correction = -y_offset;
    while (distance + y_offset) - range_to_hit > 1.0 {
        let (_, elevation, _) = simulate::find_solution(
            range_to_hit + y_correction,
            height_of_target,
            muzzle_velocity,
            air_friction,
            high_arc,
            0.0,
            FRAC_PI_2,
            temperature,
            air_density,
        );
        (x_sim, y_sim, tof) = simulate::shot(
            elevation,
            height_of_target,
            muzzle_velocity,
            air_friction,
            cross_wind,
            tail_wind,
            temperature,
            air_density,
        );
        y_offset = range_to_hit - y_sim;
        y_correction -= y_offset;
    }
    let angle_correction = (x_sim / y_sim).atan();
    (elevation, tof, angle_correction)
}

fn find_max_angle(muzzle_velocity: MuzzleVelocity, air_friction: f64) -> (f64, f64) {
    if air_friction == 0.0 {
        return (FRAC_PI_4, *muzzle_velocity * *muzzle_velocity / GRAVITY);
    }

    let mut best_angle = FRAC_PI_4;
    let mut best_distance = -1.0;
    let mut test_angle = FRAC_PI_4;
    loop {
        let (_, result_distance, _) = simulate::shot(
            test_angle,
            Height::new(0.0),
            muzzle_velocity,
            air_friction,
            0.0,
            0.0,
            Temperature::new_15c(),
            1.0,
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
    muzzle_velocity: MuzzleVelocity,
    air_friction: f64,
    high_arc: bool,
    min_elev: f64,
    max_elev: f64,
) -> Option<Vec<String>> {
    let (actual_distance, line_elevation, line_tof) = simulate::find_solution(
        range_to_hit,
        Height::new(0.0),
        muzzle_velocity,
        air_friction,
        high_arc,
        min_elev,
        max_elev,
        Temperature::new_15c(),
        1.0,
    );
    if line_tof < 0.0 {
        return None;
    }
    let (_, line_height_elevation, line_height_tof) = simulate::find_solution(
        range_to_hit,
        Height::new(-100.0),
        muzzle_velocity,
        air_friction,
        high_arc,
        min_elev,
        max_elev,
        Temperature::new_15c(),
        1.0,
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
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    10.0,
                    0.0,
                    Temperature::new_15c(),
                    1.0,
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
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    -10.0,
                    Temperature::new_15c(),
                    1.0,
                );
                let headwind_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    headwind_offset,
                    width = 1,
                    precision = usize::from(headwind_offset.abs() <= 9.949)
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    10.0,
                    Temperature::new_15c(),
                    1.0,
                );
                let tailwind_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    tailwind_offset,
                    width = 1,
                    precision = usize::from(tailwind_offset.abs() <= 9.949)
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    0.0,
                    Temperature::new_celsius(5.0),
                    1.0,
                );
                let temp_dec_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    temp_dec_offset,
                    width = 1,
                    precision = usize::from(temp_dec_offset.abs() <= 9.949)
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    0.0,
                    Temperature::new_celsius(25.0),
                    1.0,
                );
                let temp_inc_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    temp_inc_offset,
                    width = 1,
                    precision = usize::from(temp_inc_offset.abs() <= 9.949)
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    0.0,
                    Temperature::new_15c(),
                    0.9,
                );
                let air_density_dec_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    air_density_dec_offset,
                    width = 1,
                    precision = usize::from(air_density_dec_offset.abs() <= 9.949)
                )
            },
            {
                let (_, y_offset, _) = simulate::shot(
                    line_elevation,
                    Height::new(0.0),
                    muzzle_velocity,
                    air_friction,
                    0.0,
                    0.0,
                    Temperature::new_15c(),
                    1.1,
                );
                let air_density_inc_offset = (actual_distance - y_offset) / 10.0;
                format!(
                    "{:0width$.precision$}",
                    air_density_inc_offset,
                    width = 1,
                    precision = usize::from(air_density_inc_offset.abs() <= 9.949)
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
            precision = usize::from(line_tof < 99.945)
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
        sync::atomic::{AtomicI8, Ordering},
        time::Duration,
    };

    use arma_rs::{Extension, FromArma, Result, Value};

    use crate::{artillery::command_calculate_table, common::MuzzleVelocity};

    use super::find_max_angle;

    #[test]
    fn test_find_max_angle() {
        let (best_angle, best_distance) = find_max_angle(MuzzleVelocity::new(400.0), -0.00005);
        assert!((best_angle - 0.730_420_291_959_627_2).abs() < f64::EPSILON); // old ace: 0.722566
        assert!((best_distance - 10_393.560_433_295_957).abs() < f64::EPSILON); // old ace: 10391.8
    }

    #[test]
    fn range_table_line() {
        let extension = Extension::build()
            .command("calc", command_calculate_table)
            .finish()
            .testing();
        let (output, code) = extension.call(
            "calc",
            Some(vec![
                400.0.to_string(),
                (-0.00005).to_string(),
                (-5.0).to_string(),
                80.0.to_string(),
                true.to_string(),
            ]),
        );
        println!("{output:?}");
        let (best, lines): (f64, i8) = FromArma::from_arma(output).unwrap();
        assert!((best - 10_393.560_433_295_957).abs() < f64::EPSILON);
        assert_eq!(lines, 103);
        let recv: AtomicI8 = AtomicI8::new(0);
        assert_eq!(code, 0);
        let result = extension.callback_handler(
            |name, func, data| {
                recv.fetch_add(1, Ordering::SeqCst);
                if name == "ace:artillery" && func == "calculate_table" {
                    if let Some(Value::Array(data)) = data
                        && let Value::Array(line) = &data[1]
                        && line[0] == Value::String(String::from("3500"))
                    {
                        println!("data: {line:?}");
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
        println!("result: {result:?}");
        assert!(result.is_ok());
    }
}
