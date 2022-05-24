def on_log_full():
    global logging
    logging = False
    basic.show_icon(IconNames.NO)
datalogger.on_log_full(on_log_full)

def on_button_pressed_a():
    global logging
    logging = not (logging)
    if logging:
        basic.show_icon(IconNames.HEART)
    else:
        basic.clear_screen()
input.on_button_pressed(Button.A, on_button_pressed_a)

def on_button_pressed_ab():
    datalogger.delete_log(datalogger.DeleteType.FAST)
    basic.show_icon(IconNames.SQUARE)
    basic.pause(500)
    basic.show_icon(IconNames.SMALL_SQUARE)
    basic.pause(500)
    basic.show_icon(IconNames.SMALL_DIAMOND)
    basic.pause(500)
    basic.clear_screen()
input.on_button_pressed(Button.AB, on_button_pressed_ab)

logging = False
input.set_accelerometer_range(AcceleratorRange.ONE_G)
logging = False
datalogger.set_columns(["x", "y", "z"])

def on_every_interval():
    if logging:
        datalogger.log_data([datalogger.create_cv("x", input.acceleration(Dimension.X)),
                datalogger.create_cv("y", input.acceleration(Dimension.Y)),
                datalogger.create_cv("z", input.acceleration(Dimension.Z))])

loops.every_interval(100, on_every_interval)