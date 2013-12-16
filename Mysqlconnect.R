

install.packages("RMySQL")

library(RMySQL)

####create an ODBC connection
con <- dbConnect(MySQL(), user="dmanager", password="dmanager", 
                     dbname="kidms", host="Keklf-mysqluat")
                     
####list the number of tables
dbListTables(con)  

####list the number of fields
dbListFields(con, "lab_specimen")
dbListFields(con, "ward_adult_admission") 

####Read the adult admissions table
admin <- dbReadTable(con, "ward_adult_admission")
admin1<-dbReadTable(con,"ward_status")


#####run a simple query and extract data from a given dataset
vx<-dbGetQuery(con,"select * from ward_adult_admission where fk_status=13")
vw<-subset(vx, select=c(pk_serial, date_admn, fk_res))

vw$date<-as.Date(vw$date_admn)
vw$date<-format(vw$date,"%d-%b-%Y")

library(lubridate)

vw$mon<-month(vw$date, label=T)


##close connection
  dbDisconnect(con)
  dbDisconnect(con)  
  
  
  
##unzip files in data

                       
