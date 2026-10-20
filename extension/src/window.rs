use arma_rs::Group;

use std::sync::Mutex;
use windows::Win32::{
    Foundation::HWND,
    System::Threading::GetCurrentProcessId,
    UI::WindowsAndMessaging::{
        AllowSetForegroundWindow, EnumWindows, FLASHW_ALL, FLASHW_TIMERNOFG, FLASHWINFO,
        FlashWindowEx, GetWindowThreadProcessId, IsWindowVisible, SetForegroundWindow,
    },
};

pub fn group() -> Group {
    Group::new().command("focus", focus).command("flash", flash)
}

fn get_window() -> Option<HWND> {
    let window_handle: Mutex<Option<HWND>> = Mutex::new(None);

    unsafe {
        let window_ptr = &window_handle as *const _ as isize;
        let callback = enum_window_callback as *mut ();
        #[allow(clippy::missing_transmute_annotations)]
        let _ = EnumWindows(
            Some(std::mem::transmute(callback)),
            windows::Win32::Foundation::LPARAM(window_ptr),
        );
    }

    *window_handle.lock().unwrap()
}

unsafe extern "system" fn enum_window_callback(
    hwnd: HWND,
    lparam: windows::Win32::Foundation::LPARAM,
) -> i32 {
    let current_process_id = unsafe { GetCurrentProcessId() };
    let mut window_process_id = 0u32;

    unsafe {
        GetWindowThreadProcessId(hwnd, Some(&mut window_process_id));
    }

    if window_process_id == current_process_id {
        let is_visible = unsafe { IsWindowVisible(hwnd) }.as_bool();
        if is_visible {
            let window_handle = unsafe { &*(lparam.0 as *const Mutex<Option<HWND>>) };
            *window_handle.lock().unwrap() = Some(hwnd);
            return 0;
        }
    }
    1
}

fn focus() -> Result<(), String> {
    if let Some(hwnd) = get_window() {
        unsafe {
            let current_process_id = GetCurrentProcessId();
            let _ = AllowSetForegroundWindow(current_process_id);
            let _ = SetForegroundWindow(hwnd);
        };
        Ok(())
    } else {
        Err("No window found for the current process.".to_string())
    }
}

fn flash() -> Result<(), String> {
    if let Some(hwnd) = get_window() {
        let flash_info = FLASHWINFO {
            cbSize: std::mem::size_of::<FLASHWINFO>() as u32,
            hwnd,
            dwFlags: FLASHW_ALL | FLASHW_TIMERNOFG,
            uCount: 5,
            dwTimeout: 0,
        };
        unsafe {
            let _ = FlashWindowEx(&raw const flash_info);
        };
        Ok(())
    } else {
        Err("No window found for the current process.".to_string())
    }
}
