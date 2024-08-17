#[derive(Debug)]
pub struct Map {
    heights: Vec<i64>,
    building_nums: Vec<i64>,
    surface_is_water: Vec<bool>,
    size: u32,
    grids: u32,
}

impl Map {
    #[must_use]
    pub fn new(size: u32, grids: u32) -> Self {
        Self {
            heights: vec![0; (size * grids) as usize],
            building_nums: vec![0; (size * grids) as usize],
            surface_is_water: vec![false; (size * grids) as usize],
            size,
            grids,
        }
    }

    #[must_use]
    pub const fn heights(&self) -> &Vec<i64> {
        &self.heights
    }

    #[must_use]
    pub fn height(&self, cell: usize) -> i64 {
        self.heights[cell]
    }

    pub fn set_height(&mut self, cell: usize, height: i64) {
        self.heights[cell] = height;
    }

    #[must_use]
    pub const fn building_nums(&self) -> &Vec<i64> {
        &self.building_nums
    }

    #[must_use]
    pub fn building_num(&self, index: usize) -> i64 {
        self.building_nums[index]
    }

    pub fn set_building_num(&mut self, index: usize, num: i64) {
        self.building_nums[index] = num;
    }

    #[must_use]
    pub fn surface_is_water(&self, index: usize) -> bool {
        self.surface_is_water[index]
    }

    pub fn set_surface_is_water(&mut self, index: usize, is_water: bool) {
        self.surface_is_water[index] = is_water;
    }

    #[must_use]
    pub const fn size(&self) -> u32 {
        self.size
    }

    #[must_use]
    pub const fn grids(&self) -> u32 {
        self.grids
    }
}
