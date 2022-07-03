library(ggplot2)
args = commandArgs(trailingOnly=TRUE)


dataset = read.csv(args[1])

model = lm(formula = y ~ x,
               data = dataset)
             
summary(model)

ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
    ggtitle('Y vs X') +
  xlab('X') +
  ylab('Y')
ggsave("dataset.png")
dev.off()

ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Y vs X') +
  xlab('X') +
  ylab('Y')
ggsave("linear_model.png")
dev.off()