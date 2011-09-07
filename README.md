# Pomodoro Widget

## Usage

    cd ~/.config/awesome
    git clone git://github.com/francois2metz/pomodoro-awesome.git pomodoro

In you rc.lua:


    // insert after beautiful.init("...")
    require("pomodoro")

    -- widget is now available via:
    pomodoro()

Add it to your wibox:

    mywibox[s].widgets = {
        pomodoro(),
        mytextclock,
    }

## Customization

If you want change the default icon, you can use beautiful:

    beautiful.pomodoro_icon = '/your/path/to/pomodoro/icon'

## License

Copyright 2010-2011 François de Metz

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

    0. You just DO WHAT THE FUCK YOU WANT TO.
