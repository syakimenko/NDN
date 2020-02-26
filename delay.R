library(ggplot2)
data = read.table("app-delays-trace2.txt", header=T)
#определяем категориальные переменные
data$Type=factor(data$Type) 
data$Node=factor(data$Node)
#выделяем необходимый сабсет из таблицы
data = subset(data, Type == 'LastDelay')
#строим график
graph = ggplot(data, aes(x=Time, y=DelayS, color=Node))+geom_line(size=0.4)+
  ylab('Delay, s')+
  xlab('Time observed, s')+
  theme_bw()
print(graph)
png("delay-rates.png", width=800, height=600)
print(graph)
retval=dev.off()
