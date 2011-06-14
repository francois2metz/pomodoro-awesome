Pomodoro Widget
===============

Usage
-----

    cd .config/awesome
    git clone git://github.com/francois2metz/pomodoro-awesome.git pomodoro

In you rc.lua:


   // insert after require("beautiful")
   require("pomodoro")

   -- widget is now available via:
   pomodoro()

Add it to your wibox:

    mywibox[s].widgets = {
        pomodoro(),
        mytextclock,
    }

Customization
-------------

If you want change the default icon, you can use beautiful:

beautiful.pomodoro_icon = '/your/path/to/pomodoro/icon'