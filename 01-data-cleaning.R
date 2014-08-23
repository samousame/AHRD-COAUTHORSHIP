require(statnet)
require(ergm)
require(igraph)
require(intergraph)

edges <- read.csv("DATA/edges.csv")
nodes <- read.csv("DATA/nodes.csv")
id <- seq(1,593,1)
nodes<-cbind(id, nodes)
head(nodes)

edges2<-merge(nodes[,1:2], edges, by.x = "au_id", by.y="Target")
names(edges2)[1]<-"alter_id"
names(edges2)[2]<-"alter_R_id"

edges3<- merge(nodes[,1:2], edges2, by.x = "au_id", by.y="Source")
names(edges3)[1]<-"ego_id"
names(edges3)[2]<-"ego_R_id"

net<-network(edges3[,c("ego_R_id", "alter_R_id")])
set.edge.attribute(net, "ego_R_id", edges[,2])
set.edge.attribute(net, "alter_R_id", edges[,4])

# Assign node-level attributes to actors in "net"
net %v% "ARTICLE" <- nodes[,3]
net %v% "DURATION" <- nodes[,4]
net %v% "ARTIPERYEAR" <- nodes[,5]
net %v% "DEGREE.I" <- nodes[,6]
net %v% "DEGREE.O" <- nodes[,7]
net %v% "CLOSS.I" <- nodes[,8]
net %v% "CLOSS.O" <- nodes[,9]
net %v% "BETT" <- nodes[,10]
net %v% "HITS.HUB" <- nodes[,11]
net %v% "HITS.AUT" <- nodes[,12]
net %v% "SH.EFF" <- nodes[,13]
net %v% "SH.ES" <- nodes[,14]
net %v% "SH.CONSTR" <- nodes[,15]
net %v% "SH.HIERARCHY" <- nodes[,16]



summary(net)
plot(net)

inet<-asIgraph(net)
plot(inet)

vcount(inet)
BT<-betweenness(inet)



plot(inet, vertex.label=NA, vertex.size=0.8, edge.width=0.5, edge.arrow.size=0.05, main="regular graph")
network.layout.degree <- function(d, layout.par){
        id <- degree(d, cmode = "indegree")
        od <- degree(d, cmode = "outdegree")
        cbind(id, od)
}
