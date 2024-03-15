toggleNoCarrySpeedPenalty = not toggleNoCarrySpeedPenalty

if toggleNoCarrySpeedPenalty then
    local carry_data = {'being', 'mega_heavy', 'heavy', 'medium', 'light', 'coke_light'}

    for _, name in ipairs(carry_data) do
        tweak_data.carry.types[name].throw_distance_multiplier = 1
        tweak_data.carry.types[name].move_speed_modifier = 1
        tweak_data.carry.types[name].jump_modifier = 1
        tweak_data.carry.types[name].can_run = true
    end

    managers.mission._fading_debug_output:script().log('No Carry Speed Penalty - Activated',
        Color.green)
else
    local carry_data = {{
        name = 'being',
        throw = 0.5,
        move_speed = 0.5,
        jump = 0.5,
        can_run = false
    }, {
        name = 'mega_heavy',
        throw = 0.5,
        move_speed = 0.5,
        jump = 0.5,
        can_run = false
    }, {
        name = 'heavy',
        throw = 0.8,
        move_speed = 0.75,
        jump = 1,
        can_run = false
    }, {
        name = 'medium',
        throw = 1,
        move_speed = 0.6,
        jump = 1,
        can_run = false
    }, {
        name = 'light',
        throw = 1,
        move_speed = 1,
        jump = 1,
        can_run = true
    }, {
        name = 'coke_light',
        throw = 1,
        move_speed = 1,
        jump = 1,
        can_run = true
    }}

    for _, data in ipairs(carry_data) do
        local name = data.name
        tweak_data.carry.types[name].throw_distance_multiplier = data.throw
        tweak_data.carry.types[name].move_speed_modifier = data.move_speed
        tweak_data.carry.types[name].jump_modifier = data.jump
        tweak_data.carry.types[name].can_run = data.can_run
    end

    managers.mission._fading_debug_output:script().log('No Carry Speed Penalty - Deactivated',
        Color.red)
end
