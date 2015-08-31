set.seed(1)
tree <- rcoal(n=100)
tree <- geiger::rescale(tree, 'lambda', lambda = 0.8)
x <- fastBM(tree,sig2=0.5) # Brownian motion
phylosig(tree, x, method='lambda', test = TRUE)
mod.ml <- gls(x ~ 1, correlation = corPagel(0.5, tree, fixed=F), method = "ML")
mod.reml <- gls(x ~ 1, correlation = corPagel(0.5, tree, fixed=F), method = "REML")
summary(mod.ml)
summary(mod.reml)
