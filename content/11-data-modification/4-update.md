---
title: "Update"
weight: 20
pre: "4. "
---

{{< youtube iR6cGxDj_kE >}}

## Video Transcription

Welcome back everyone. In this video, we're going to be taking a look at data modification again, but in particular, how we might update data that exists already inside of our database, updating data is going to be achieved using the update statements. And again, this is an atomic operation, meaning that either all rows are updated, or none of them are updated. So it's an all or nothing statement, it cannot be interrupted there. And but again, we'll talk more about transactions anatomist at another video. Up update does allow some non standard SQL statements. So very similar to our delete, we can also have the full FROM clause supports inside of T SQL, but not as part of ancy standard. And so we can also include variable assignments as part of this as well. But this, again, is non standard. When compared to other database languages or data database implementations like Postgres, or MySQL, they will have some slightly different syntax. So the syntax that we'll be covering in this video includes the standard updates, which is listed here up at the top, so update, and then no FROM clause, right, or no from that update, and then the table name, and then set and then the columns that we want to set and then the value that we want to set those columns to, then we can also include an optional WHERE clause as as well. So if we want to update a specific row or set of rows, we can specify that using our search condition as part of the where non standard allows the use of a From clause in addition to that, so that's going to be the additional item here. And we can also do variable assignments as part of this as well. So update and then set up here, I can't actually use in standard SQL I can't use I can't set variable names or variable values as part of it. But we can do this inside of the non standard update in T SQL. And the table source here down here for the non standard update. 

Again, we have the full well, you have the full functionality of the from clause. And so we can, that means we can use table expressions. And we can also use joins. But let's take a look at an example of a few updates. So before you if you're following along, running these SQL commands, as you're watching the video, please make sure you rerun the setup SQL scripts along with this. So we have the starting data in our original demo tables. So first thing that I am going to do is a basic standard update. So here, I'm just going to showcase what the person address looks like now, and then what it looks like after. So what I'm going to update is the person address table set. And then the column which is line two, two big bird's nest where person I do ID where Person ID is two and address type is two. And so if we run that, you see Person ID to address type two, which is row four. And so I'm setting line to line two is no currently. And then if I see here's scoot this up a little bit, if I go down here and look at this row here, you can see now, instead of being No, it is Big Bird's Nest. So simple update, right simple update, we have the table that we're up to the table that we're updating, and then the values that we're setting what the associated columns, and then the where clause specifies which rows we are actually updating. Of course, we can update more than one row at a time. So if I do something like this, so update person address set. And now I can also set multiple columns, right, so the columns are separated by commas. So line two is going to be no city is going to be the little apple and then I'm also updating the updated on column where a person ID is one. And so if we run that, so Person ID one, those are these two rows here. And so if you look here, the city is now the little apple and The updated en is also updated to the current timestamp. 

So, again, very simple update syntax as far as that goes. But you do want to be careful just like what the Delete clause, right? You don't want to accidentally you know, for one, you don't want to accidentally delete things that you don't want to delete. And conversely, we also don't want to delete or sorry, we also don't want to update rows that we don't want to update, because that removes data from our database, because we're replacing it with something else. And so we want to be careful when we execute these commands, we can. History tables are a technique that we can use to undo updates and deletes. But traditionally, there is no way to there is no undo function. Standard, right. So if you delete something, it's gone. If it's updated, the data that was there is now replaced permanently with the new data. Now, like I said, Well, we'll have a video later on in this course, that talks about how to implement history tables that can help undo some of those actions. But let's look at some more examples of our updates. We can also update using sub queries. So just like what we have, with our delete clause, we can use sub queries in Update clause as well. That includes sub queries as part of the set, and where, so here, I am setting the address type to whatever the ID is of home, and the updated on and then we're setting where the rows that we're actually updating are going to be person three, where it's work. So we're actually we actually changed person ID three. And the address is work, we flipped those are, we're going to flip that one, this one here, we're going to flip this to be the home address. So if we run this SQL, now that is ID one, which happens to be the type of home. So sub queries are a powerful way to get some more flexibility out of our standard update sequence or our standard update. If we exclude by the way, if we exclude a where clause, it updates all rows. So it said Be very, very careful when executing updates or deletes because you can accidentally either update all rows or delete all rows, if you don't write your where clause very carefully. So it is good practice to try out your queries on a demo or test database before you roll that out and do it on real data. Because of course, you can accidentally destroy information and not process and testing out your queries. 

So just keep that in mind when you are running these updates. So I do want to showcase some non standard updates. So everything that I've showcased so far is anti standard. But now let's do something that is a little bit more specific to SQL Server, I'm going to go ahead and run our startup script to get us back to what our original data was. And here I'm going to update all of our people are, sir are the records were? The first name is Fred Rogers. And the type is work. So this was identical, if you remember to, so this is person three here, person three is Fred Rogers. So that's this this person, yes, the third person that was inserted, and the query that we had was this here. So if we split this and showcase these two, so the query on the right is identical to the query here on the left with the query on the left is not standard SQL. This is because I'm using a From clause and using a join. So the full from the from clause is not supported in the standard update that is supported in T SQL. So I can do joins, which allow me to not have to use sub queries as part of it as part of my update. So both of these queries here do the exact same Same thing, they both update the exact same record. But this one over here is a little bit more compact. Because I can take out one of the sub queries, which is this one down here inside of my WHERE clause because the full FROM clause is supported, I still have to use a sub sub query as part of the address type ID because I have to pull whatever address type the ID of whatever home is. But nonetheless, it does simplify our query a little bit by introducing the ability to do joins, I can also use variables inside of the nonstandard update. So in particular variable assignment. And so here is a variable I have declared up here, and I am setting it as sorry. About, I'm setting it as part inside of my set clause. So at updated on equals updated on, which is, this is the column name, this is the variable. So don't confuse the variable with the column. And this is the current time. So what I'm doing here is I'm getting the current timestamp. Setting the column equal to that, and I'm also storing that value in the variable here. That is very, very nice if I want to recall that value as a result of the updates. So I can actually pull that value back out and and see what was actually set as part of the query result, instead of having to run a full select on the database, or on the on the original table itself. So just an example of a useful feature of the non standard updates in T SQL, being able to set do variable assignments as part of the set to clause in the updates. But that will conclude most of our work that we are going to focus on utilizing the update clause. Remember, just as a short recap, we covered the the standard syntax for updating, so update table and then set and then the list of columns and the values associated with those. And then we also covered the non standard update, where the non standard update allows the ability to use a full FROM clause so that includes things like joins and table expressions as well. 
