#Title:Draw Scatter(标题：绘制散点图)

##散点图是一种基础的可视化图表，用于揭示两个变量之间的关系。

##依赖
###- 系统：全平台（Linux/MacOS/Windows）
###- 编程语言：#R
###- 依赖包：#ggplot2

###ggplot2的安装和载入
install.packages("ggplot2")
library(ggplot2)
install.packages("ggpmisc")  #ggplot2的功能扩展包,下文使用了里面stat_poly_eq函数
library(ggpmisc)
install.packages("ggpubr")
library(ggpubr)
##数据：iris数据集包含3种鸢尾属植物的萼片长度和宽度以及花瓣长度和宽度的测量值

data=iris     #这里选取萼片的长度和宽度数据
#data=iris[iris$Species=="setosa",]    #这里选取setosa植物的萼片的长度和宽度数据

##基本绘图
p=ggplot(data,aes(x=Sepal.Width,y=Sepal.Length))+
  geom_point(shape=16,size=1.5,color="blue")+
  labs(x="Width",y="Length")+
  geom_smooth(method = "lm",formula = y~x,se=T, color = "red")       #绘制线性回归曲线
p
p+stat_poly_eq(use_label("eq","R2","P"),formula = y~x,size = 4,method = "lm")   #显示回归曲线方程和R方以及P值
p+stat_cor(method = "pearson",label.sep = ',',
           p.accuracy = 0.00001,r.digits = 5,size = 4)    #显示相关系数及P值

##多类数据绘图
p_multi=ggplot(data,aes(x=Sepal.Width,y=Sepal.Length,group=Species,color=Species))+
  geom_point(shape=16,size=1.5)+
  scale_colour_manual(values=c("setosa"="purple","versicolor"="blue","virginica"="pink"))+
  theme(legend.position = "inside",legend.position.inside = c(0.87, 0.8))      #设置图例位置
p_multi
p_multi+geom_smooth(method = "lm",formula = y~x,se=T)+
  stat_poly_eq(use_label("eq","R2","P"),formula = y~x,size = 3,method = "lm",color="black")






