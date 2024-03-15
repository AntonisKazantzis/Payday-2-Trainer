toggleInfiniteDrawingPoints = not toggleInfiniteDrawingPoints

if toggleInfiniteDrawingPoints then
    tweak_data.preplanning.gui.MAX_DRAW_POINTS = math.huge

    managers.mission._fading_debug_output:script().log("Infinite Drawing Points - Activated", Color.green)
else
    tweak_data.preplanning.gui.MAX_DRAW_POINTS = 1000

    managers.mission._fading_debug_output:script().log("Infinite Drawing Points - Deactivated", Color.red)
end
