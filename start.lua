----------------------------------
-- Author:      Zineddine SAIBI
-- Software:    Pomaria-Side
-- Type:        Conky Theme
-- License:     GPL-3.0
-- repository:  https://www.github.com/SZinedine/pomaria-side
----------------------------------

local main_x      = 710
local main_thickness = 1
S = {
    line = {
        thickness   = 1,
        width1      = 310,
        width2      = 465,
        width3      = 620,
    },
    mem  = {
        ram  = { 
            x = main_x, y = 340, width = 620,
            text = { x = 0, y = 0 },
        },
        swap = { 
            x = main_x, y = 380, width = 310,
            text = { x = 0, y = 0 },
        },
    },
    disk = {
        first = {
            x = main_x, y = 440, width = 310,
            title = { x = 510, y = 430 },
            indic = { x = 370, y = 440 },
        },
        second = {
            x = main_x, y = 480, width = 310,
            title = { x = 510, y = 470 },
            indic = { x = 370, y = 480 },
        },
    },
    net  = {
        down = {
            x = main_x, y = 530, width = 310,
            title = { x = 580, y = 520 },
            indic = { x = 370, y = 530 },
        },
        up = {
            x = main_x, y = 570, width = 310,
            title = { x = 580, y = 560 },
            indic = { x = 370, y = 570 },
        },
        list = {
            x = 90, y = 520
        }
    },
    cpu = {
        x = main_x, y = 100, width = 310,
        processes = { x = 90, y = 100, interval = 20, number = 7, },
        cores = {
            _2cores = {
                temperature = { 
                    number = -1,   y = 60,   width = 620, max_value = 100,
                    title = { name = "temperature", x = 620, y = 50, size = 12, },
                    indic = { x = 60, y = 63, suffix = "°C", size = 12 },
                },
                core1 = {  
                    number = 1,   y = 130,   width = 310, max_value = 100,
                    title = { name = "cpu1", x = 670, y = 120, size = 12, },
                    indic = { x = 380, y = 135, suffix = "%", size = 12 },
                },
                core2 = {
                    number = 2,   y = 200,   width = 310, max_value = 100,
                    title = { name = "cpu2", x = 670, y = 190, size = 12, },
                    indic = { x = 380, y = 205, suffix = "%", size = 12 },
                },
                total = {
                    number = 0,   y = 270,   width = 620, max_value = 100,
                    title = { name = "total", x = 670, y = 260, size = 12, },
                    indic = { x = 61, y = 275, suffix = "%", size = 12 },
                },
            },
            _4cores = {
                temperature = {
                    number = -1,   y = 60,   width = 620, max_value = 100,
                    title = { name = "temperature", x = 620, y = 50, size = 12, },
                    indic = { x = 60, y = 63, suffix = "°C", size = 12 },
                },
                core1 = {
                    number = 1,   y = 100,   width = 310, max_value = 100,
                    title = { name = "cpu1", x = 670, y = 90, size = 12, },
                    indic = { x = 380, y = 105, suffix = "%", size = 12 },
                },
                core2 = {
                    number = 2,   y = 140,   width = 310, max_value = 100,
                    title = { name = "cpu2", x = 670, y = 130,  },
                    indic = { x = 380, y = 145, suffix = "%" },
                },
                core3 = {
                    number = 3,   y = 180,   width = 310, max_value = 100,
                    title = { name = "cpu3", x = 670, y = 170,  },
                    indic = { x = 380, y = 185, suffix = "%" },
                },
                core4 = {
                    number = 4,   y = 220,   width = 310, max_value = 100,
                    title = { name = "cpu4", x = 670, y = 210,  },
                    indic = { x = 380, y = 225, suffix = "%" },
                },
                total = {
                    number = 0,   y = 270,   width = 620, max_value = 100,
                    title = { name = "total", x = 670, y = 260,  },
                    indic = { x = 61, y = 275, suffix = "%" },
                },
            },
            _8cores = {
                temperature = {
                    number = -1,   y = 40,   width = 620, max_value = 100,
                    title = { name = "temperature", x = 620, y = 30,  },
                    indic = { x = 60, y = 43, suffix = "°C" },
                },
                core1 = { 
                    number = 1,   y = 67,   width = 310, max_value = 100,
                    title = { name = "cpu1", x = 670, y = 60,  },
                    indic = { x = 380, y = 75, suffix = "%" },
                },
                core2 = { 
                    number = 2,   y = 97,   width = 310, max_value = 100,
                    title = { name = "cpu2", x = 670, y = 90,  },
                    indic = { x = 380, y = 105, suffix = "%" },
                },
                core3 = { 
                    number = 3,   y = 127,   width = 310, max_value = 100,
                    title = { name = "cpu3", x = 670, y = 120,  },
                    indic = { x = 380, y = 135, suffix = "%" },
                },
                core4 = { 
                    number = 4,   y = 157,   width = 310, max_value = 100,
                    title = { name = "cpu4", x = 670, y = 150,  },
                    indic = { x = 380, y = 165, suffix = "%" },
                },
                core5 = {
                    number = 5,   y = 187,   width = 310, max_value = 100,
                    title = { name = "cpu5", x = 670, y = 180,  },
                    indic = { x = 380, y = 195, suffix = "%" },
                },
                core6 = {
                    number = 6,   y = 217,   width = 310, max_value = 100,
                    title = { name = "cpu6", x = 670, y = 210,  },
                    indic = { x = 380, y = 225, suffix = "%" },
                },
                core7 = {
                    number = 7,   y = 247,   width = 310, max_value = 100,
                    title = { name = "cpu7", x = 670, y = 240,  },
                    indic = { x = 380, y = 255, suffix = "%" },
                },
                core8 = {
                    number = 8,   y = 275,   width = 310, max_value = 100,
                    title = { name = "cpu8", x = 670, y = 270,  },
                    indic = { x = 380, y = 280, suffix = "%" },
                },
                total = { 
                    number = 0,   y = 300,   width = 620, max_value = 100,
                    title = { name = "total", x = 670, y = 295,  },
                    indic = { x = 61, y = 305, suffix = "%" },
                },
            },
        }
    }
}


-- set the appropriate cpu object according to the chosen value for `cpu_cores`
local ncores = nil
if cpu_cores == 2      then ncores = S.cpu.cores._2cores
elseif cpu_cores == 4  then ncores = S.cpu.cores._4cores
elseif cpu_cores == 8  then ncores = S.cpu.cores._8cores
else
    print("ERROR. the provided value of cpu_cores is not valid. Defaulting to 4 cores")
    ncores = S.cpu.cores._4cores
end


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


function draw_single_cpu_core(core)
    local val = nil
    if core.number >= 0 then val = cpu_percent(core.number)
    else val = cpu_temperature()
    end
    rectangle_rightleft(main_x, core.y , core.width, main_thickness, val, core.max_value, color_frompercent(tonumber(val)))
    write(core.indic.x, core.indic.y, val .. core.indic.suffix, 12 , main_text_color)
    write(core.title.x, core.title.y, core.title.name, 12, main_text_color)
end

function draw_cpu()
    for i in pairs(ncores) do
        draw_single_cpu_core(ncores[i])
    end
    write_list_proccesses_cpu(S.cpu.processes.x, S.cpu.processes.y, S.cpu.processes.interval, S.cpu.processes.number, 12, main_text_color)
end


function draw_memory()
    local memperc  = memory_percent()
    local swapperc = swap_percent()
    local mem      = string.format("RAM: %s / %s", memory(), memory_max())
    local swp      = string.format("Swap: %s / %s", swap(), swap_max())

    rectangle_rightleft(S.mem.ram.x, S.mem.ram.y, S.mem.ram.width, main_thickness, memperc, 100, color_frompercent(tonumber(memperc)))
    rectangle_rightleft(S.mem.swap.x, S.mem.swap.y, S.mem.swap.width, main_thickness, swapperc, 100, color_frompercent(tonumber(swapperc)))

    write(530, 330, mem, 12, main_text_color)
    write(530, 370, swp, 12, main_text_color)
    write(60,  340, memperc .. "%", 12, main_text_color)
    write(370, 380, swapperc .. "%", 12, main_text_color)

    write_list_proccesses_mem(90, 370, 20, 6, 12, main_text_color)
end


function draw_disks()
    local rt     = string.format("root:  %s / %s", fs_used("/"), fs_size("/"))
    local hm     = string.format("/home:  %s / %s", fs_used("/home"), fs_size("/home"))
    local rtperc = fs_used_perc("/")
    local hmperc = fs_used_perc("/home")

    rectangle_rightleft(S.disk.first.x, S.disk.first.y, S.disk.first.width, main_thickness, rtperc, 100, color_frompercent(tonumber(rtperc)))
    rectangle_rightleft(S.disk.second.x, S.disk.second.y, S.disk.second.width, main_thickness, hmperc, 100, color_frompercent(tonumber(hmperc)))

    write(S.disk.first.title.x,  S.disk.first.title.y, rt, 12, main_text_color)
    write(S.disk.second.title.x, S.disk.second.title.y, hm, 12, main_text_color)
    write(S.disk.first.indic.x, S.disk.first.indic.y, rtperc .. "%", 12, main_text_color)
    write(S.disk.second.indic.x, S.disk.second.indic.y, hmperc .. "%", 12, main_text_color)
end


function draw_net()
    rectangle_rightleft(S.net.down.x, S.net.down.y, S.net.down.width, main_thickness, download_speed_kb(), download_rate_maximum, main_fg)
    rectangle_rightleft(S.net.up.x, S.net.up.y, S.net.up.width, main_thickness, upload_speed_kb(), upload_rate_maximum, main_fg)

    write(S.net.down.title.x, S.net.down.title.y, "download: ".. download_total(), 12, main_text_color)
    write(S.net.up.title.x, S.net.up.title.y, "upload: " .. upload_total(), 12, main_text_color)
    write(S.net.down.indic.x, S.net.down.indic.y, download_speed(), 12, main_text_color)
    write(S.net.up.indic.x, S.net.up.indic.y, upload_speed(), 12, main_text_color)

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

    write_line_by_line(S.net.list.x, S.net.list.y, 20, netinfo, main_text_color, 12, false)
end


function draw_battery()
    if not has_battery then return end
    local batperc = battery_percent()
    local bat_color = color_frompercent_reverse(tonumber(batperc))
    rectangle_bottomup(30, 700, 670, main_thickness, batperc, 100, bat_color)
    rectangle_bottomup(30, 700, 670, main_thickness, batperc, 100, bat_color)
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
    write_line_by_line(90, 630, 20, vals, main_text_color, 12, false)
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
