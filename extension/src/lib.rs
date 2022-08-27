use arma_rs::{arma, Extension};

pub mod ballistics;
mod break_line;
mod clipboard;
mod common;

#[arma]
fn init() -> Extension {
    Extension::build()
        .group("ballistics", ballistics::group())
        .group("clipboard", clipboard::group())
        .command("break_line", break_line::break_line)
        .finish()
}
