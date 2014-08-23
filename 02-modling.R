#TEMPLETE 
#fit <- ergm(net ~ edges + mutual
#            ,
#            seed=1,
#            maxit=10,
#            burnin=15000,
#            MCMCsamplesize=50000,        
#            MCMLE.density.guard.min= 1000, 
#            MCMLE.density.guard= 20.08554,
#            verbose=FALSE,
#            calc.mcmc.se = TRUE,
#            parallel=4,
#)

#Diagnosis and Summary Templete
#mcmc.diagnostics(m1)
#summary(m1)

#Graphic Export Templete
#pdf("m1.pdf")
#mcmc.diagnostics(m1)
#dev.off()

# network commands to convert this to a matrix.
#test<-edges["value">1,]
#test2<-merge(nodes[,1:2], test, by.x = "au_id", by.y="Target")
#names(test2)[1]<-"alter_id"
#names(test2)[2]<-"alter_R_id"
#test3<- merge(nodes[,1:2], test2, by.x = "au_id", by.y="Source")
#names(test3)[1]<-"ego_id"
#names(test3)[2]<-"ego_R_id"
#net1<-network(test3[,c("ego_R_id", "alter_R_id")])
#A<-as.matrix(net1)
#B<-t(as.matrix(net1)) #B = A transpose
#mut_mat <- A + B
#lag_mut<-as.network(mut_mat) # relies on dichotomous

#Simulation
#m2.sim<-simulate(m2,nsim=100);
#simnet1<-m2.sim$networks[[1]]
#summary(simnet1)
#pdf("8.4_lab8_m2_simulation.pdf")
#plot(m2.sim$networks[[1]],vertex.col="WHITE")
#dev.off()



#1 Base model
m1<-ergm(net ~ edges + mutual ,
                ,
                     seed=1,
                     maxit=10,
                     burnin=15000,
                     MCMCsamplesize=50000,        
                     MCMLE.density.guard.min= 1000, 
                     MCMLE.density.guard= 20.08554,
                     verbose=FALSE,
                     calc.mcmc.se = TRUE,
                     parallel=4,
         )
# Model Estimation
summary(m1)
#Goodness of FIt
mcmc.diagnostics(m1)
m1_1.gof <- gof(m1~idegree)
m1_2.gof <- gof(m1~odegree)
#exp() for the ERGM coefficients
lapply(m1[1],exp)
#Simulation
m1.sim<-simulate(m1,nsim=100);
simnet1<-m1.sim$networks[[1]]
summary(simnet1)






pdf("m1.pdf")
mcmc.diagnostics(m1)
dev.off()