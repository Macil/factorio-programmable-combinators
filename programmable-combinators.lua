local programmableCombinator = table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
programmableCombinator.name = "programmable-combinator"
programmableCombinator.icon = "__programmable-combinators__/graphics/icons/programmable-combinator.png"
programmableCombinator.corpse = "programmable-combinator-remnants"
programmableCombinator.active_energy_usage = "500KW"
programmableCombinator.sprites =
  make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__programmable-combinators__/graphics/entity/programmable-combinator.png",
        width = 78,
        height = 66,
        frame_count = 1,
        shift = util.by_pixel(0, 7),
        hr_version =
        {
          scale = 0.5,
          filename = "__programmable-combinators__/graphics/entity/hr-programmable-combinator.png",
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

local recipe = table.deepcopy(data.raw["recipe"]["decider-combinator"])
recipe.name = "programmable-combinator"
recipe.ingredients = {
  {"copper-cable", 5},
  {"advanced-circuit", 25}
}
recipe.result = "programmable-combinator"

local item = {
  type = "item",
  name = "programmable-combinator",
  icon = "__programmable-combinators__/graphics/icons/programmable-combinator.png",
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "circuit-network",
  place_result="programmable-combinator",
  order = "c[combinators]-bp[programmable-combinator]",
  stack_size= 20
}

local remnants = table.deepcopy(data.raw["corpse"]["decider-combinator-remnants"])
remnants.name = "programmable-combinator-remnants"
remnants.icon = "__programmable-combinators__/graphics/icons/programmable-combinator.png"
remnants.animation.filename = "__programmable-combinators__/graphics/entity/remnants/programmable-combinator-remnants.png"
remnants.animation.hr_version.filename = "__programmable-combinators__/graphics/entity/remnants/hr-programmable-combinator-remnants.png"

local technology = {
  type = "technology",
  name = "programmable-combinator",
  icon_size = 192,
  icon = "__programmable-combinators__/graphics/technology/programmable-combinator.png",
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

data:extend({programmableCombinator,recipe,remnants,item,technology})
