datalogger.onLogFull(function () {
    logging = false
    basic.showIcon(IconNames.No)
})
input.onButtonPressed(Button.A, function () {
    logging = !(logging)
    if (logging) {
        basic.showIcon(IconNames.Heart)
    } else {
        basic.clearScreen()
    }
})
input.onButtonPressed(Button.AB, function () {
    datalogger.deleteLog(datalogger.DeleteType.Fast)
    basic.showIcon(IconNames.Square)
    basic.pause(500)
    basic.showIcon(IconNames.SmallSquare)
    basic.pause(500)
    basic.showIcon(IconNames.SmallDiamond)
    basic.pause(500)
    basic.clearScreen()
})
let logging = false
input.setAccelerometerRange(AcceleratorRange.OneG)
logging = false
datalogger.setColumns(["x", "y", "z"])
loops.everyInterval(100, function () {
    if (logging) {
        datalogger.logData([
        datalogger.createCV("x", input.acceleration(Dimension.X)),
        datalogger.createCV("y", input.acceleration(Dimension.Y)),
        datalogger.createCV("z", input.acceleration(Dimension.Z))
        ])
    }
})