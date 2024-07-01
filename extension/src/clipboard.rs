use arma_rs::{loadout::Loadout, FromArma, Group};

use clipboard::{ClipboardContext, ClipboardProvider};

pub fn group() -> Group {
    Group::new()
        .command("clear", clear)
        .command("append", append)
        .command("complete", complete)
        .command("loadout", loadout)
}

static mut BUFFER: String = String::new();

pub fn clear() {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        BUFFER.clear();
    }
}

pub fn append(text: String) {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        BUFFER.push_str(&text);
    }
}

pub fn complete() -> Result<(), String> {
    // Safety: this is all single threaded, so no need to lock
    let mut ctx = ClipboardContext::new().map_err(|e| e.to_string())?;
    ctx.set_contents(unsafe { BUFFER.clone() })
        .map_err(|e| e.to_string())?;
    unsafe {
        BUFFER = String::new();
    }
    Ok(())
}

pub fn loadout() -> Option<String> {
    let mut ctx = ClipboardContext::new().ok()?;
    let content = ctx.get_contents().ok()?;
    match Loadout::from_arma(content.clone()) {
        Ok(_) => return Some(content),
        Err(e) => eprintln!("Loadout parsing error: {}", e),
    }
    None
}
