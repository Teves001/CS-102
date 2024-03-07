#install.packages("DBI")
#install.packages("odbc")
#install.packages("RMariaDB")
library(DBI)
library(dplyr)
connection<-dbConnect(RMariaDB::MariaDB(),
                      dsn="RMaria-connection",
                      dbname="sample_dbt",
                      Server="localhost",
                      user="root")

#Checking the connect
dbListTables(connection)
dbListFields(connection,"movies")

#1
query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('The Meg'
,'JoBloTheMovieCritic','20 July 2019','7/10','Phantom Thread','210  couldnt enjoy it...so boring...I mean SO BORING the two stars are purely for the costumes')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Schlinders List','Moah-505q','10 February 2022','10/10',' fabulous, should save in movies history','The List Is Life I am speechless I am speechless.....The greatest one-part movie of my life1000000010soooo deeply touchingall human beings must see this masterpiece.')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Maleficient','cesbanbelubo21','22 December 2020','9/10','I love it','This movie is magnific. Elle fanning and Angelina Jolie are awesome')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Spirited Away','orialon24','25 April 2020','4/10','Not for me I guess','Heard from a lot of people I should watch this movie and thought Id like it but just couldnt get into it... forced myself to finish it and thought its pretty boring')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Parasite','ajikude','26 February 2020','4/10','totally overrated','Good but definitely not worth an Oscar for best movie or best director.')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Grave of the Fireflies','thejhuy-85386','17 October 2019','10/10','Just a small tip for people intending to watch','Right after you end watching the movie, watch the beginning once again and cry a river of tears.
Im so sad now that Im crying while typing.')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Coco','andreachaparra','8 May 20180','1/10','Love it','As a Mexican born child I cried when I saw this movie and my son who is American born with Mexican parents loves it too.. love to teach him about our roots')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Phantom Thread','sheyda22','26 January 2019','10/10','Daniel Day-Lewis BEST act to date','This is a movie for old souls. This is not a slow movie as some has written. I believe that it´s intention was to let you be a guest there in real time and feel all the natural pauses that happens in life, bathing in Daniel Day-Lewis beautiful rhythm. And how well the older Daniel meshed with the younger Vicky in a poetic tango.Daniel Day-Lewis has said that this would be His last film, and if that is so, then He leaved after laying down His ACE.Someone compared this to Bitter Moon. I don´t agree. The couples had different obstacles, and the other movie was as the title: bitter.
This movie is art and one should see it with only one expectation
  Daniel Day-Lewis will deliver GOLD.')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Saltburn','aboalhyjaa','23 December 2023','8/10','Peak parody, or is it','Saltburn is a captivating movie to watch and its a fun ride, the mixture of you thinking you have figured it out and then knowing that you didnt make the experience a whole lot better!Watching this movie i thought Its a social commentary on the British royal life, or thats what I thought. After the first half of the movie went by I started to notice where this movie was gonna go. And to be honest i wasnt thrilled about my prediction because if it were true then its just a basic story with an amazing cast to do it. Well, as it turns out it was a mix of both.The writing was great, the acting was even greater, the filming provided a whole other thing to the plate as it was also amazing, and the saltburn castle alone is just an amazing place.The ending did not in fact pleased me, it felt a bit rushed. But as always what saved the day wad the great performance of Barry Keoghan')"

query<-"INSERT INTO movies(title, reviewer, date_of_review, rating, title_of_review, review)VALUES('Puss in Boots','gaheheg','21 March 2023','10/10','A Dreamworks Masterpiece','Do you like anime, because I do, and by god is this the most anime-like American animated movie Ive seen. The way it does smooth action and atmosphere as well as intricate character moments reminds me a lot of series Ive watched with a lot more detail and time. Not only do the messages and themes resonate, but the portrayals are done surprisingly well of things like anxiety, fear of death, etc etc. I know that animated childrens movies can execute these well, but this takes it to another level for me while having exhilarating animelike fight scenes. Theyre on another level for something out of dreamworks, compare it to the Shrek scene where hes fighting some of Farquads goons and its like night and day. Anyways, give this a watch, one of the best animated films in a fat minute.')"


query_result <- dbSendQuery(connection, query)#send values to table
movies_dta <- dbGetQuery(connection, "SELECT * FROM sample_dbt.movies")#use to glimpse
glimpse(movies_dta)
View(movies_dta)

write.csv(movies_dta, file = "LAB5_MOVIES_1-10_TEVES.csv")

dbDisconnect(connection)











