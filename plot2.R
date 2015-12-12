source("load_data.R")
d <- load_data()

png(filename = "plot2.png")
plot(d$Timestamp,
    d$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)
dev.off()