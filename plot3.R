source("load_data.R")
d <- load_data()

png(filename = "plot3.png")
with(d, {
    plot(Timestamp,
        pmax(Sub_metering_1,Sub_metering_2, Sub_metering_3),
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
    )
    points(Timestamp, Sub_metering_1, type = "l")
    points(Timestamp, Sub_metering_2, type = "l", col = "red")
    points(Timestamp, Sub_metering_3, type = "l", col = "blue")
    legend("topright",
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"),
        lty = 1
    )
}
)
dev.off()