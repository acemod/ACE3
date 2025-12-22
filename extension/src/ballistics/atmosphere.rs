use arma_rs::{FromArma, FromArmaError};

use super::map::Map;
use crate::common::Temperature;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AtmosphereModel {
    Icao,
    Asm,
}

impl FromArma for AtmosphereModel {
    fn from_arma(s: String) -> Result<Self, FromArmaError> {
        let s = s.trim_matches('"');
        match s.to_lowercase().as_str() {
            "icao" => Ok(Self::Icao),
            "asm" => Ok(Self::Asm),
            _ => Err(FromArmaError::InvalidValue("unexpected model".into())),
        }
    }
}

const ROUGHNESS_LENGTHS: [f64; 10] = [0.0002, 0.0005, 0.0024, 0.03, 0.055, 0.1, 0.2, 0.4, 0.8, 1.6];
pub fn calculate_roughness_length(map: &Map, x: f64, y: f64) -> f64 {
    let grid_x = (x / 50.0).floor() as i64;
    let grid_y = (y / 50.0).floor() as i64;
    let grid_cell = (grid_x * map.grids() as i64) + grid_y;

    if grid_cell >= 0 {
        let grid_cell = grid_cell as usize;
        if grid_cell < map.heights().len() && grid_cell < map.building_nums().len() {
            let near_building_num = map.building_num(grid_cell);
            let surface_is_water = map.surface_is_water(grid_cell);

            if near_building_num == 0 && surface_is_water {
                return 0.0005;
            }

            if near_building_num >= 10 {
                return 1.6;
            }

            return ROUGHNESS_LENGTHS[2 + std::cmp::min(near_building_num as usize, 6)];
        }
    }

    0.0024
}

const DRY_AIR_MOLAR_MASS: f64 = 0.028_964;
const WATOR_VAPOR_MOLAR_MASS: f64 = 0.018_016;
const UNIVERSAL_GAS_CONSTANT: f64 = 8.314_32;
const SPECIFIC_GAST_CONSTANT_DRY_AIR: f64 = UNIVERSAL_GAS_CONSTANT / DRY_AIR_MOLAR_MASS;
pub fn calculate_air_density(
    temperature: Temperature,
    pressure: f64,
    relative_humidity: f64,
) -> f64 {
    let pressure = pressure * 100.0;
    if relative_humidity > 0.0 {
        // 610.78 gives pressure in Pa - https://en.wikipedia.org/wiki/Density_of_air
        let p_sat = 610.78
            * 10_f64.powf((7.5 * temperature.as_celsius()) / (temperature.as_celsius() + 237.3));
        let vapor_pressure = relative_humidity * p_sat;
        let partial_pressure = pressure - vapor_pressure;

        partial_pressure.mul_add(DRY_AIR_MOLAR_MASS, vapor_pressure * WATOR_VAPOR_MOLAR_MASS)
            / (UNIVERSAL_GAS_CONSTANT * temperature.as_kelvin())
    } else {
        pressure / (SPECIFIC_GAST_CONSTANT_DRY_AIR * temperature.as_kelvin())
    }
}

const STD_AIR_DENSITY_ICAO: f64 = 1.22498;
const STD_AIR_DENSITY_ASM: f64 = 1.20886;
pub fn calculate_atmospheric_correction(
    ballistic_coefficient: f64,
    temperature: Temperature,
    pressure: f64,
    relative_humidity: f64,
    atmosphere_model: AtmosphereModel,
) -> f64 {
    let air_density = calculate_air_density(temperature, pressure, relative_humidity);
    match atmosphere_model {
        AtmosphereModel::Icao => (STD_AIR_DENSITY_ICAO / air_density) * ballistic_coefficient,
        AtmosphereModel::Asm => (STD_AIR_DENSITY_ASM / air_density) * ballistic_coefficient,
    }
}

pub fn speed_of_sound(temperature: Temperature) -> f64 {
    331.3 * (1.0 + temperature.as_celsius() / 273.15).sqrt()
}

#[cfg(test)]
mod tests {
    use crate::common::Temperature;

    #[test]
    fn atmospheric_correction() {
        assert!(
            (super::calculate_atmospheric_correction(
                0.583,
                Temperature::new_15c(),
                1005.0,
                0.0,
                crate::ballistics::AtmosphereModel::Icao
            ) - 0.587_784_746_752_856_4)
                .abs()
                < f64::EPSILON // previous ace: 0.580047
        );
        assert!(
            (super::calculate_atmospheric_correction(
                0.263,
                Temperature::new_celsius(25.3642),
                1009.61,
                0.603_173,
                crate::ballistics::AtmosphereModel::Icao
            ) - 0.275_454_853_636_429_13)
                .abs()
                < f64::EPSILON // previous ace: 0.275444
        );
    }

    #[test]
    fn speed_of_sound() {
        assert!(
            (super::speed_of_sound(Temperature::new_celsius(-15.0)) - 322.074_912_997_965_27).abs()
                < f64::EPSILON
        );
        assert!(
            (super::speed_of_sound(Temperature::new_celsius(0.0)) - 331.3).abs() < f64::EPSILON
        );
        assert!(
            (super::speed_of_sound(Temperature::new_15c()) - 340.275_080_511_860_5).abs()
                < f64::EPSILON
        );
    }
}
