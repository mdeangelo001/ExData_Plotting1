load_data <- function() {
    columns <- c(
        "Date", "Time",
        "Global_active_power", "Global_reactive_power",
        "Voltage", "Global_intensity",
        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
    )
    
    # I obtained the offset used in skip with the command
    # grep  -n "^[12]/2/2007" household_power_consumption.txt | head -n 1
    # I obtained the value for nrows with
    # grep  -c "^[12]/2/2007" household_power_consumption.txt

    d <- read.table(
        "household_power_consumption.txt",
        header = FALSE,
        sep = ";",
        col.names = columns,
        stringsAsFactors = FALSE,
        na.strings = "?",
        colClasses = "character",
        skip = 66637,
        nrows = 2880
    )
    t <- strptime(paste(d$Date,d$Time),
        format = "%d/%m/%Y %H:%M:%S",
        tz = "GMT"
    )
    d <- cbind(Timestamp = t, d)
    d$Global_active_power <- as.numeric(d$Global_active_power)
    d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
    d$Voltage <- as.numeric(d$Voltage)
    d$Global_intensity <- as.numeric(d$Global_intensity)
    d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
    d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
    d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)
    d
}