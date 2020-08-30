--[[
    State to render the stats after level up
]]

LevelUpStatsState = Class{__includes = BaseState}

function LevelUpStatsState:init(pokemon, x, y, def, onFinish)
    self.pokemon = pokemon
    self.x = x
    self.y = y

    self.HpIncrease = def.HpIncrease
    self.attackIncrease = def.AttackIncrease
    self.defenseIncrease = def.DefenseIncrease
    self.speedIncrease = def.SpeedIncrease

    self.HpBeforeIncrease = pokemon.HP - self.HpIncrease
    self.attackBeforeIncrease = pokemon.attack - self.attackIncrease
    self.defenseBeforeIncrease = pokemon.defense - self.defenseIncrease
    self.speedBeforeIncrease = pokemon.speed - self.speedIncrease

    self.onFinish = onFinish
    self.menu = Menu {
        x = self.x,
        y = self.y,
        width = 250,
        height = 150,
        renderCursor = false,
        items = {
            {
            text = tostring("HP : " .. self.HpBeforeIncrease) .. " + " .. tostring(self.HpIncrease) .. " = " .. tostring(self.pokemon.HP),
            onSelect = function () end
            },
            {
                text = tostring("Attack : " .. self.attackBeforeIncrease) .. " + " .. tostring(self.attackIncrease) .. " = " .. tostring(self.pokemon.attack),
                onSelect = function () end
            },
            {
                text = tostring("Defense : " .. self.defenseBeforeIncrease) .. " + " .. tostring(self.defenseIncrease) .. " = " .. tostring(self.pokemon.defense),
                onSelect = function () end
            },
            {
                text = tostring("Speed : " .. self.speedBeforeIncrease) .. " + " .. tostring(self.speedIncrease) .. " = " .. tostring(self.pokemon.speed),
                onSelect = function () end
            }

        }
    }
end

function LevelUpStatsState:update(dt)
    self.menu:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        self.onFinish()
    end
end

function LevelUpStatsState:render()
    self.menu:render()
end