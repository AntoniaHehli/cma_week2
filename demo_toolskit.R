
now <- Sys.time()

now

later <- now + 10000

## demonstrate difftime

later

later- now

# remember that this difference is now in minutes
difference <- as.numeric(difftime(later, now, units = "mins"))

## demonstrate lead and lag

mynumbers <- 1:10

# new vector, offset by 1, the value 1 is removed
# it appends and NA at the end to make the output the same size as the input vector
lead(mynumbers)

# default for n is 1
lead(mynumbers, n = 2)

# lag is the opposite of the lead function
lag(mynumbers)

wildschwein <- tibble(
  TierID = c(rep("Hans", 5), rep("Klara", 5)),
  DatetimeUTC = rep(as.POSIXct("2015-01-01 00:00:00", tz = "UTC") + 0:4 * 15 * 60, 2)
)

wildschwein$diff <- as.numeric(difftime(lead(wildschwein$DatetimeUTC), wildschwein$DatetimeUTC))

wildschwein <- group_by(wildschwein, TierID)

wildschwein <- mutate(wildschwein, diff = as.numeric(difftime(lead(DatetimeUTC),DatetimeUTC)))

wildschwein <- wildschwein |>
  group_by(TierID) |> 
  mutate(diff = as.numeric(difftime(lead(DatetimeUTC),DatetimeUTC)))

wildschwein <- wildschwein %>%
  group_by(TierID) %>%
  mutate(diff = as.numeric(difftime(lead(DatetimeUTC),DatetimeUTC)))

