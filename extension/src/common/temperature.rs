use arma_rs::FromArma;

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct Temperature(f64);

impl Temperature {
    pub fn new_celsius(value: f64) -> Self {
        Self(value + 273.15)
    }

    pub const fn new_15c() -> Self {
        Self::new_kelvin(288.15)
    }

    pub const fn new_kelvin(value: f64) -> Self {
        Self(value)
    }

    pub fn new_fahrenheit(value: f64) -> Self {
        Self((value - 32.0) * 5.0 / 9.0 + 273.15)
    }

    pub fn as_celsius(self) -> f64 {
        self.0 - 273.15
    }

    pub const fn as_kelvin(self) -> f64 {
        self.0
    }

    pub fn as_fahrenheit(self) -> f64 {
        (self.0 - 273.15) * 9.0 / 5.0 + 32.0
    }
}

impl FromArma for Temperature {
    fn from_arma(s: String) -> Result<Self, String> {
        if s.is_empty() {
            return Err(String::from("unexpected empty string"));
        }
        match s.chars().next().unwrap() {
            'c' => {
                let temp = s[1..].parse::<f64>().map_err(|e| format!("{}", e))?;
                Ok(Self::new_celsius(temp))
            }
            'f' => {
                let temp = s[1..].parse::<f64>().map_err(|e| format!("{}", e))?;
                Ok(Self::new_fahrenheit(temp))
            }
            'k' => {
                let temp = s[1..].parse::<f64>().map_err(|e| format!("{}", e))?;
                Ok(Self::new_kelvin(temp))
            }
            _ => {
                let temp = s.parse::<f64>().map_err(|e| format!("{}", e))?;
                Ok(Self::new_celsius(temp))
            }
        }
    }
}
