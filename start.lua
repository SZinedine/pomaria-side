----------------------------------
-- Author:      Zineddine SAIBI
-- Software:    Pomaria-Side
-- Type:        Conky Theme
-- License:     GPL-3.0
-- repository:  https://www.github.com/SZinedine/pomaria-side
----------------------------------


S = {
    line = {
        thickness        = 1,
        width1           = 310,
        width2           = 465,
        width3           = 620,
        interval         = 40,
        section_interval = 60,
    },
    cpu  = {
        x                 = 710,
        y                 = 100,
        width             = 310,
        y_interval        = 40,
        y1                = 100,
        y2                = 140,
        y3                = 180,
        y4                = 240,
        y_total           = 280,
        width_temp        = 620,
        y_temp            = 60,
        x_values          = 100 - 310 - 30,
    },
    mem  = {
        x                 = 710,
        y_ram             = 340,
        y_swap            = 380,
    },
    disk = {
        x                = 710,
        y1               = 440,
        y2               = 480,
    },
    net  = {
        down_x            = 710,
        down_y            = 530,
        up_y              = 570,
        text_x            = 710 - 620,
        text_y            = 520,
    },
}


-- replace the content of the following function to create your own conky theme
function start()
    draw_cpu()
    draw_memory()
    draw_disks()
    draw_clock()
    draw_info()
    draw_battery()
    draw_net()
end


function draw_cpu()
    local acpitemp = cpu_temperature()
    local cpu      = cpu_percent()
    local cpu1     = cpu_percent(1)
    local cpu2     = cpu_percent(2)
    local cpu3     = cpu_percent(3)
    local cpu4     = cpu_percent(4)

    rectangle_rightleft(S.cpu.x, S.cpu.y_temp, S.cpu.width_temp, S.line.thickness, acpitemp, 100, color_frompercent(tonumber(acpitemp)))
    rectangle_rightleft(S.cpu.x, S.cpu.y1, S.cpu.width, S.line.thickness, cpu1, 100, color_frompercent(tonumber(cpu1)))
    rectangle_rightleft(S.cpu.x, S.cpu.y2, S.cpu.width, S.line.thickness, cpu2, 100, color_frompercent(tonumber(cpu2)))
    rectangle_rightleft(S.cpu.x, S.cpu.y3, S.cpu.width, S.line.thickness, cpu3, 100, color_frompercent(tonumber(cpu3)))
    rectangle_rightleft(S.cpu.x, S.cpu.y4, S.cpu.width, S.line.thickness, cpu4, 100, color_frompercent(tonumber(cpu4)))
    rectangle_rightleft(S.cpu.x, S.cpu.y_total, S.cpu.width_temp, S.line.thickness, cpu, 100, color_frompercent(tonumber(cpu)))

    -- cpu values
    write(S.cpu.x-S.cpu.width_temp-35, S.cpu.y-S.cpu.y_interval+3, acpitemp .. "°C", 12, main_text_color)
    write(S.cpu.x-S.cpu.width_temp-30, S.cpu.y_total, cpu .. "%", 12, main_text_color)
    write(S.cpu.x_values, S.cpu.y1+5, cpu1 .. "%", 12, main_text_color)
    write(S.cpu.x_values, S.cpu.y2+5, cpu2 .. "%", 12, main_text_color)
    write(S.cpu.x_values, S.cpu.y3+5, cpu3 .. "%", 12, main_text_color)
    write(S.cpu.x_values, S.cpu.y4+5, cpu4 .. "%", 12, main_text_color)

    -- cpu titles
    write(S.cpu.x-90, S.cpu.y_temp-10, "temperature", 12, main_text_color)
    write(S.cpu.x-70, S.cpu.y_total-10, "total cpu", 12, main_text_color)
    write(670, 90, "cpu1", 12, main_text_color)
    write(670, 130, "cpu2", 12, main_text_color)
    write(670, 170, "cpu3", 12, main_text_color)
    write(670, 210, "cpu4", 12, main_text_color)

    -- processes list by cpu consemption
    write_list_proccesses_cpu(S.cpu.x-S.cpu.width*2, S.cpu.y, 20, 7, 12, main_text_color)
end


function draw_memory()
    local memperc  = memory_percent()
    local swapperc = swap_percent()
    local mem      = string.format("RAM: %s / %s", memory(), memory_max())
    local swp      = string.format("Swap: %s / %s", swap(), swap_max())

    rectangle_rightleft(S.mem.x, S.mem.y_ram, S.line.width3, S.line.thickness, memperc, 100, color_frompercent(tonumber(memperc)))
    rectangle_rightleft(S.mem.x, S.mem.y_swap, S.line.width1, S.line.thickness, swapperc, 100, color_frompercent(tonumber(swapperc)))

    write(S.cpu.x-180, S.cpu.y_total+50, mem, 12, main_text_color)
    write(S.cpu.x-180, S.cpu.y_total+90, swp, 12, main_text_color)

    write(S.cpu.x-S.line.width3-30, S.cpu.y_total+60, memperc .. "%", 12, main_text_color)
    write(S.cpu.x-S.line.width1-30, S.cpu.y_total+100, swapperc .. "%", 12, main_text_color)

    write_list_proccesses_mem(S.cpu.x-S.cpu.width*2, S.mem.y_swap-10, 20, 6, 12, main_text_color)
end


function draw_disks()
    local rt     = string.format("root:  %s / %s", fs_used("/"), fs_size("/"))
    local hm     = string.format("/home:  %s / %s", fs_used("/home"), fs_size("/home"))
    local rtperc = fs_used_perc("/")
    local hmperc = fs_used_perc("/home")

    rectangle_rightleft(S.disk.x, S.disk.y1, S.line.width1, S.line.thickness, rtperc, 100, color_frompercent(tonumber(rtperc)))
    rectangle_rightleft(S.disk.x, S.disk.y2, S.line.width1, S.line.thickness, hmperc, 100, color_frompercent(tonumber(hmperc)))

    write(S.disk.x-200, S.disk.y1-10, rt, 12, main_text_color)
    write(S.disk.x-200, S.disk.y2-10, hm, 12, main_text_color)
    write(S.disk.x-S.line.width1-30, S.disk.y1, rtperc .. "%", 12, main_text_color)
    write(S.disk.x-S.line.width1-30, S.disk.y2, hmperc .. "%", 12, main_text_color)
end


function draw_net()
    rectangle_rightleft(S.net.down_x, S.net.down_y, S.line.width1, S.line.thickness, download_speed_kb(), download_rate_maximum, main_fg)
    rectangle_rightleft(S.net.down_x, S.net.up_y, S.line.width1, S.line.thickness, upload_speed_kb(), upload_rate_maximum, main_fg)

    write(S.net.down_x - 150, S.net.down_y-10, "download: ".. download_total(), 12, main_text_color)
    write(S.net.down_x - 150, S.net.up_y-10, "upload: " .. upload_total(), 12, main_text_color)
    write(S.net.down_x - S.line.width1-30, S.net.down_y, download_speed(), 12, main_text_color)
    write(S.net.down_x - S.line.width1-30, S.net.up_y, upload_speed(), 12, main_text_color)

    local netinfo = {}
    table.insert(netinfo, "SSID:        " .. ssid())
    table.insert(netinfo, "Wifi Signal: " .. wifi_signal() .. "%")


    if use_public_ip then
        if public_ip == nil or (updates()%public_ip_refresh_rate) == 0 then
            update_public_ip()
        end
        table.insert(netinfo, "Public IP:   " .. get_public_ip())
    end
    table.insert(netinfo, "Local IP:    " .. local_ip())

    write_line_by_line(S.net.text_x, S.net.text_y, 20, netinfo, main_text_color, 12, false)
end


function draw_battery()
    if not has_battery then return end
    local batperc = battery_percent()
    local bat_color = color_frompercent_reverse(tonumber(batperc))
    rectangle_bottomup(30, 700, 670, S.line.thickness, batperc, 100, bat_color)
    rectangle_bottomup(30, 700, 670, S.line.thickness, batperc, 100, bat_color)
    write(20, 20, batperc .. "%", 12, main_text_color)
    write(10, 720, "battery", 12, main_text_color)
end


function draw_clock()
    write(400, 670, time_hrmin(), 85, main_text_color)
    write(425, 700, string.format("%s, %s %s, %s", time_day_short(), time_month_short(), time_day_number(), time_year()), 20, main_text_color)
end


function draw_info()
    local vals = {
        "Uptime:    " .. uptime(),
        string.format("Desktop:   %s/%s", desktop(), desktops()),
        "Disk I/O:  " .. diskio(""),
        "    Read:  " .. diskio_read(""),
        "    Write: " .. diskio_write(""),
    }
    write_line_by_line(S.net.text_x, 630, 20, vals, main_text_color, 12, false)
end



function conky_main()
    if conky_window == nil then
        return
    elseif colors_defined == false then
        io.stderr:write("Fatal Error. Please define a theme")
    end

    local updates_ = tonumber(updates())
    if updates_ <= startup_delay then return end
    if initialized_battery == false and updates_ > startup_delay + 6  then
        init_battery()
    end


    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable,
                                         conky_window.visual, conky_window.width,
                                         conky_window.height)
    cr = cairo_create(cs)

    start()

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end
