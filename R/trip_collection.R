install.packages("mongolite")

library(mongolite)
# This is the connection_string. You can get the exact url from your MongoDB cluster screen
connection_string = 'mongodb+srv://hytan:1234@MyCluster1.ihzso.mongodb.net/sample_training'
trips_collection = mongo(collection="trips", db="sample_training", url=connection_str)