source("load_data.R")
d <- load_data()

png(filename = "plot1.png")
hist(d$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
)
dev.off()