local data_util = require('__flib__.data-util')

local blank_image = "__programmable-devices__/graphics/blank.png"

local programmable_combinator_entity = data_util.copy_prototype(data.raw["decider-combinator"]["decider-combinator"], "programmable-combinator")
programmable_combinator_entity.icon = "__programmable-devices__/graphics/icons/programmable-combinator.png"
programmable_combinator_entity.corpse = "programmable-combinator-remnants"
programmable_combinator_entity.active_energy_usage = "500KW"
programmable_combinator_entity.sprites =
  make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__programmable-devices__/graphics/entity/programmable-combinator.png",
        width = 78,
        height = 66,
        frame_count = 1,
        shift = util.by_pixel(0, 7),
        hr_version =
        {
          scale = 0.5,
          filename = "__programmable-devices__/graphics/entity/hr-programmable-combinator.png",
          width = 156,
          height = 132,
          frame_count = 1,
          shift = util.by_pixel(0.5, 7.5)
        }
      },
      {
        filename = "__base__/graphics/entity/combinator/decider-combinator-shadow.png",
        width = 78,
        height = 80,
        frame_count = 1,
        shift = util.by_pixel(12, 24),
        draw_as_shadow = true,
        hr_version =
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/hr-decider-combinator-shadow.png",
          width = 156,
          height = 158,
          frame_count = 1,
          shift = util.by_pixel(12, 24),
          draw_as_shadow = true
        }
      }
    }
  })

local input_entity = data_util.copy_prototype(data.raw["constant-combinator"]["constant-combinator"], "programmable-combinator-input")
input_entity.corpse = "small-remnants"
input_entity.collision_mask = {"not-colliding-with-itself"}
input_entity.minable = nil
-- input_entity.sprites = {
--   north = blank_image,
--   east = blank_image,
--   south = blank_image,
--   west = blank_image
-- }
input_entity.activity_led_sprites = {
  north = blank_image,
  east = blank_image,
  south = blank_image,
  west = blank_image
}
-- input_entity.circuit_wire_connection_points = {
-- }

local output_entity = data_util.copy_prototype(data.raw["constant-combinator"]["constant-combinator"], "programmable-combinator-output")
output_entity.corpse = "small-remnants"
output_entity.collision_mask = {"not-colliding-with-itself"}
output_entity.minable = nil
output_entity.item_slot_count = 200
-- output_entity.sprites = {
--     north = blank_image,
--     east = blank_image,
--     south = blank_image,
--     west = blank_image
-- }
output_entity.activity_led_sprites = {
    north = blank_image,
    east = blank_image,
    south = blank_image,
    west = blank_image
}
-- output_entity.circuit_wire_connection_points = {
-- }


local recipe = {
  type = "recipe",
  name = "programmable-combinator",
  enabled = false,
  ingredients =
  {
    {"copper-cable", 5},
    {"advanced-circuit", 25}
  },
  result = "programmable-combinator"
}

local item = {
  type = "item",
  name = "programmable-combinator",
  icon = "__programmable-devices__/graphics/icons/programmable-combinator.png",
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "circuit-network",
  place_result="programmable-combinator",
  order = "c[combinators]-bp[programmable-combinator]",
  stack_size= 20
}

local remnants_entity = table.deepcopy(data.raw["corpse"]["decider-combinator-remnants"])
remnants_entity.name = "programmable-combinator-remnants"
remnants_entity.icon = "__programmable-devices__/graphics/icons/programmable-combinator.png"
remnants_entity.animation.filename = "__programmable-devices__/graphics/entity/remnants/programmable-combinator-remnants.png"
remnants_entity.animation.hr_version.filename = "__programmable-devices__/graphics/entity/remnants/hr-programmable-combinator-remnants.png"

local technology = {
  type = "technology",
  name = "programmable-combinator",
  icon_size = 192,
  icon = "__programmable-devices__/graphics/technology/programmable-combinator.png",
  prerequisites = {"circuit-network", "advanced-electronics"},
  effects = {
    { type = "unlock-recipe", recipe = "programmable-combinator", },
  },
  unit =
  {
    count = 100,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1}
    },
    time = 15
  },
  order = "a-d-bp"
}

data:extend({programmable_combinator_entity,recipe,remnants_entity,item,technology})
