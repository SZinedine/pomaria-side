----------------------------------
-- Author:      Zineddine SAIBI
-- Software:    Auzia-conky
-- Type:        Conky Theme
-- License:     GPL-3.0
-- repository:  https://www.github.com/SZinedine/pomaria-side
----------------------------------

require 'abstract'

settings = {
    line = {},
    cpu  = {},
    mem  = {},
    disk = {},
    net  = {},
}

settings.line.thickness        = 1
settings.line.width1           = 310
settings.line.width2           = settings.line.width1 * 1.5
settings.line.width3           = settings.line.width1 * 2
settings.line.interval         = 40
settings.line.section_interval = settings.line.interval * 1.5
settings.cpu.x                 = 710
settings.cpu.y                 = 100
settings.cpu.width             = settings.line.width1
settings.cpu.y_interval        = 40
settings.cpu.y1                = settings.cpu.y
settings.cpu.y2                = settings.cpu.y1 + settings.cpu.y_interval
settings.cpu.y3                = settings.cpu.y2 + settings.cpu.y_interval
settings.cpu.y4                = settings.cpu.y3 + settings.cpu.y_interval
settings.cpu.y_total           = settings.cpu.y4 + settings.cpu.y_interval
settings.cpu.width_temp        = settings.line.width3
settings.cpu.y_temp            = settings.cpu.y1 - settings.cpu.y_interval
settings.cpu.x_values          = settings.cpu.y1 - settings.cpu.width - 30
settings.mem.x                 = settings.cpu.x
settings.mem.y_ram             = settings.cpu.y_total + settings.line.section_interval
settings.mem.y_swap            = settings.mem.y_ram + settings.line.interval
settings.disk.x                = settings.mem.x
settings.disk.y1               = settings.mem.y_swap + settings.line.section_interval
settings.disk.y2               = settings.disk.y1 + settings.line.interval
settings.net.down_x            = settings.disk.x
settings.net.down_y            = settings.disk.y2 + settings.line.section_interval
settings.net.up_y              = settings.net.down_y + settings.line.interval
settings.net.text_x            = settings.net.down_x - settings.line.width1 * 2
settings.net.text_y            = settings.net.down_y - 10


-- replace the content of the following function to create your own conky theme
function start()
    draw_cpu()
    draw_memory()
    draw_disks()
    draw_net()
    draw_clock()
    draw_info()
    if has_battery then draw_battery() end
end


function draw_cpu()
    local acpitemp = cpu_temperature()
    local cpu = cpu_percent()
    local cpu1 = cpu_percent(1)
    local cpu2 = cpu_percent(2)
    local cpu3 = cpu_percent(3)
    local cpu4 = cpu_percent(4)

    rectangle_rightleft(settings.cpu.x, settings.cpu.y_temp, settings.cpu.width_temp, settings.line.thickness, acpitemp, 100, color_frompercent(tonumber(acpitemp)))
    rectangle_rightleft(settings.cpu.x, settings.cpu.y1, settings.cpu.width, settings.line.thickness, cpu1, 100, color_frompercent(tonumber(cpu1)))
    rectangle_rightleft(settings.cpu.x, settings.cpu.y2, settings.cpu.width, settings.line.thickness, cpu2, 100, color_frompercent(tonumber(cpu2)))
    rectangle_rightleft(settings.cpu.x, settings.cpu.y3, settings.cpu.width, settings.line.thickness, cpu3, 100, color_frompercent(tonumber(cpu3)))
    rectangle_rightleft(settings.cpu.x, settings.cpu.y4, settings.cpu.width, settings.line.thickness, cpu4, 100, color_frompercent(tonumber(cpu4)))
    rectangle_rightleft(settings.cpu.x, settings.cpu.y_total, settings.cpu.width_temp, settings.line.thickness, cpu, 100, color_frompercent(tonumber(cpu)))

    -- cpu values
    write(settings.cpu.x-settings.cpu.width_temp-35, settings.cpu.y-settings.cpu.y_interval+3, acpitemp .. "°C", 12, main_text_color)
    write(settings.cpu.x-settings.cpu.width_temp-30, settings.cpu.y_total, cpu .. "%", 12, main_text_color)
    write(settings.cpu.x_values, settings.cpu.y1+5, cpu1.. "%", 12, main_text_color)
    write(settings.cpu.x_values, settings.cpu.y2+5, cpu2.. "%", 12, main_text_color)
    write(settings.cpu.x_values, settings.cpu.y3+5, cpu3.. "%", 12, main_text_color)
    write(settings.cpu.x_values, settings.cpu.y4+5, cpu4.. "%", 12, main_text_color)

    -- cpu titles
    write(settings.cpu.x-90, settings.cpu.y_temp-10, "temperature", 12, main_text_color)
    write(settings.cpu.x-70, settings.cpu.y_total-10, "total cpu", 12, main_text_color)
    write(670, 90, "cpu1", 12, main_text_color)
    write(670, 130, "cpu2", 12, main_text_color)
    write(670, 170, "cpu3", 12, main_text_color)
    write(670, 210, "cpu4", 12, main_text_color)

    -- if not display_text then return end
    -- processes list by cpu consemption
    local yy = settings.cpu.y
    for i = 1, 7 do
        write(settings.cpu.x-settings.cpu.width*2, yy, getProcessN(i), 12, main_text_color)
        yy = yy +20
    end
end


function draw_memory()
    local memperc = memory_percent()
    local swapperc = swap_percent()

    rectangle_rightleft(settings.mem.x, settings.mem.y_ram, settings.line.width3, settings.line.thickness, memperc, 100, color_frompercent(tonumber(memperc)))
    rectangle_rightleft(settings.mem.x, settings.mem.y_swap, settings.line.width1, settings.line.thickness, swapperc, 100, color_frompercent(tonumber(swapperc)))
    local mem  = string.format("RAM: %s / %s", memory(), memory_max())
    local swp = string.format("Swap: %s / %s", swap(), swap_max())
    write(settings.cpu.x-180, settings.cpu.y_total+50, mem, 12, main_text_color)
    write(settings.cpu.x-180, settings.cpu.y_total+90, swp, 12, main_text_color)

    write(settings.cpu.x-settings.line.width3-30, settings.cpu.y_total+60, memperc .. "%", 12, main_text_color)
    write(settings.cpu.x-settings.line.width1-30, settings.cpu.y_total+100, swapperc .. "%", 12, main_text_color)

    write_list_proccesses_mem(settings.cpu.x-settings.cpu.width*2, settings.mem.y_swap-10, 20, 6, 12, main_text_color)

end


function draw_disks()
    local rt = string.format("root:  %s / %s", fs_used("/"), fs_size("/"))
    local hm = string.format("/home:  %s / %s", fs_used("/home"), fs_size("/home"))
    local rtperc = fs_used_perc("/")
    local hmperc = fs_used_perc("/home")

    rectangle_rightleft(settings.disk.x, settings.disk.y1, settings.line.width1, settings.line.thickness, rtperc, 100, color_frompercent(tonumber(rtperc)))
    rectangle_rightleft(settings.disk.x, settings.disk.y2, settings.line.width1, settings.line.thickness, hmperc, 100, color_frompercent(tonumber(hmperc)))

    write(settings.disk.x-200, settings.disk.y1-10, rt, 12, main_text_color)
    write(settings.disk.x-200, settings.disk.y2-10, hm, 12, main_text_color)
    write(settings.disk.x-settings.line.width1-30, settings.disk.y1, rtperc .. "%", 12, main_text_color)
    write(settings.disk.x-settings.line.width1-30, settings.disk.y2, hmperc .. "%", 12, main_text_color)
end


function draw_net()
    local dspd = download_speed_kb()
    local uspd = upload_speed_kb()
    local dtotal = download_total()
    local utotal = upload_total()

    rectangle_rightleft(settings.net.down_x, settings.net.down_y, settings.line.width1, settings.line.thickness, dspd, download_rate_maximum, main_fg)
    rectangle_rightleft(settings.net.down_x, settings.net.up_y, settings.line.width1, settings.line.thickness, uspd, upload_rate_maximum, main_fg)

    write(settings.net.down_x - 150, settings.net.down_y-10, "download: ".. dtotal, 12, main_text_color)
    write(settings.net.down_x - 150, settings.net.up_y-10, "upload: " .. utotal, 12, main_text_color)
    write(settings.net.down_x - settings.line.width1-30, settings.net.down_y, download_speed(), 12, main_text_color)
    write(settings.net.down_x - settings.line.width1-30, settings.net.up_y, upload_speed(), 12, main_text_color)

    -- if not display_text then return end
    local netinfo = {}
    table.insert(netinfo, "SSID:        " .. ssid())
    table.insert(netinfo, "Wifi Signal: " .. wifi_signal() .. "%")
    if use_public_ip then
        table.insert(netinfo, "Public IP:   " .. public_ip)
    end
    table.insert(netinfo, "Local IP:    " .. local_ip())

    local yy = settings.net.text_y
    for i in pairs(netinfo) do
        write(settings.net.text_x, yy, netinfo[i], 12, main_text_color)
        yy = yy + 20
    end
end


function draw_battery()
    local batperc = battery_percent()
    local bat_color = color_frompercent_reverse(tonumber(batperc))
    rectangle_bottomup(30, 700, 670, settings.line.thickness, batperc, 100, bat_color)
    rectangle_bottomup(30, 700, 670, settings.line.thickness, batperc, 100, bat_color)
    write(20, 20, batperc .. "%", 12, main_text_color)
    write(10, 720, "battery", 12, main_text_color)
end


function draw_clock()
    write(400, 670, time_hrmin(), 85, main_text_color)
    write(425, 700, string.format("%s, %s %s, %s", time_day_short(), time_month_short(), time_day_number(), time_year()), 20, main_text_color)
end


function draw_info()
    -- if not display_text then return end
    infotext_x = settings.net.text_x
    infotext_y = 630

    local vals = {
        "Uptime:    " .. uptime(),
        string.format("Desktop:   %s/%s", desktop(), desktops()),
        "Disk I/O:  " .. diskio(""),
        "    Read:  " .. diskio_read(""),
        "    Write: " .. diskio_write(""),
    }

    local yy = infotext_y
    for i in pairs(vals) do
        write(infotext_x, yy, vals[i], 12, main_text_color)
        yy = yy + 20
    end
end



function conky_main()
    if conky_window == nil then
        return
    elseif colors_defined == false then
        io.stderr:write("Fatal Error. Please define a theme")
    end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable,
                                         conky_window.visual, conky_window.width,
                                         conky_window.height)
    cr = cairo_create(cs)

    local number_updates = tonumber(updates())
    if number_updates > 0 then
        if use_public_ip then
            -- check the ip adress every x seconds (check the variable public_ip_refresh_rate, default: 60 seconde)
            if public_ip == nil or public_ip == "None" or (number_updates%public_ip_refresh_rate) == 0 then
                public_ip = fetch_public_ip()
            end
        end

        start()
    end

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end
