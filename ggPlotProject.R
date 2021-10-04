# library(ggplot2)
# library(data.table)
# library(ggthemes)

# df <- fread("Economist_assignment_Data.csv", drop=1)
# print(head(df))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl <- ggplot(df,
             aes(x=CPI, y=HDI))
pl2 <- pl +
  geom_point(aes(color=Region),
             size=5, shape=1)
pl3 <- pl2 +
  geom_smooth(aes(group=1),
              method="lm",
              formula=y~log(x),
              se=F,
              color="red")
pl4 <- pl3 + 
  geom_text(aes(label=Country),
            color="gray20",
            data=subset(df, Country %in% pointsToLabel),
            check_overlap=T)
pl5 <- pl4 + 
  theme_bw() + 
  scale_x_continuous(name="Corruption Perception Index, 2011 (10=least corrupt)", 
                     limits=c(.9, 10.5),
                     breaks=1:10) +
  scale_y_continuous(name="Human Development Index, 2011 (1=Best)",
                     limits=c(.19, 1.1))
pl6 <- pl5 +
  ggtitle("Corruption and Human development")
pl7 <- pl6 +
  theme_economist_white()

print(pl7)
