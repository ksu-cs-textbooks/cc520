---
title: "Multi-value Correlated Subqueries Part 1"
weight: 25
pre: "5. "
---

{{< youtube JqJcrIG3IP4 >}}

## Video Transcription

Welcome back, everyone. So let's continue our discussion on correlated sub queries. So previously, I showed some examples of a correlated sub queries primarily, though with scalar value return, so correlated subqueries, that only had one value as a result. However, the distinction between that and a self contained valued a self contained single valued sub query is that the correlated version has to be executed for every single row four, the outer query, versus the self contained query is only executed once. But without further ado, let's take a look at some more examples of this. So usually queries solved with multivalued sub queries takes one of two forms. So we've already seen the first form which is shown here on the screen. So this is the self contained form, where we have in this case, give me all of the customers who have placed an order between or in 2015. So in, and so this is, these are all the customers and 25th, the all the orders in 2015. So if I run that, there's all of our customers who placed orders in 2015. And then to get their customer name, I linked that to the outer query. Or I embed that in a sub query and link and have the outer query pulled the customer name, as I talked about last time, write the self contained version here is easily rewritten using a join as we shown before, but we can do a another version of this using the exists predicate. 

And so let's go ahead and see the difference there. So if you see here, right, self contained, I have no linkage to the outer query here. But in this query, very similar, very similar. But now instead of in I have exists, and I don't actually have a check here for a column, right? So where before I had, where customer ID in, but now I just have where exists, okay, but that customer ID is now checked in the where clause in the inner sub query. So or sorry, in the sub query. So I have Oh, customer ID equal c dot customer ID, C being the outer reference. And order date is between, you know, 20 in 2015. So, both of these queries are 100% identical, as far as output goes, logically, they're just executed a little bit different. Both of these, of course, I can actually rewrite using a join. So this query, and this query here, right, I can rewrite using joins. So inner join between customers and orders on customer ID. Remember that Oh, customer ID equals see customer ID that was my correlated sub query before, where order date is between one 120 15 and 1231 2015. But simple example, just showing you an easier one that can be rewritten fairly easily. But again, logically, all three of these queries are have the same result. Each one is just executed just a little bit different. 

How did we see all customers who did not place an order in 2015? Well, remember the remember what we did before is that instead of an enter, join, we did a left join. Right. So from sales customers see left join on orders. Oh, customer ID equals customer ID. And we also have, we also want to actually put this I'm going to move this up one. I'm going to add this my predicate for my join. And so similar same query as I had before, I just have a left join now, and I'm replacing my WHERE clause here to be. Oh dot order ID is No. So this is what we did previously to find all of the customers who did not place an order and 2015. So how do I use a sub query to get all of the customers who did not place an order in 2015? Well, an easy way to do that is just to include the knot here. So where not exists. So records that don't return a row here will not be included or will be included. Whereas exists rows, when the sub query does return a record, then that is included as a result. So differences between where exists and where not exists. The primary primary difference here, right is that the exist predicate uses to value Boolean logic, right? True, true to Boolean valued logic. So true or false, right, there is no undefined. Unlike the in operator which has, which is three valued Boolean logic, true, false and undefined. So that's one big difference here that we have to consider using these operators, these predicates, they exist is only two valued two valued Boolean logic. 

But let's take a look at some more examples here. So do I have this query here, this is a pulling from a table that we haven't pulled from before delivery methods not used by suppliers. So delivery methods not used by suppliers. So all I have here is a left join between delivery methods and supplier. So this gives me all of the delivery methods. And then I want to pull only the records where supplier ID is null. So the ones that did not match. So let's go ahead and give this a run. So I have five delivery methods that were not used by supplier, so chill band, customer collect customer, Curie delivered van and post. So let's take a look at a couple other potential ways that we can answer the question for, you know, finding delivery methods that are not used by suppliers, delivery methods that are not used. So at face value, this particular query looks like it may potentially work. But if we execute this, we find that the results are empty, right, we actually have nothing as a result, right, we have nothing as a result. So delivery method, if we just actually highlight this, around that. So here are all of our delivery methods here. So we have 10 different delivery methods. 

And then if we run this query here, here are all of the delivery method IDs. So n starts to operate a little bit weird in this situation, right? Because two is definitely in this right, in this result, because we have deliver method ID here. But this query is not going to end up working. And some of this has to deal with issues with how no works. And remember, n is going to be a three valued Boolean logic here. So we can kind of get some weird results when our sub query returns any null values. So let's take a look, stick another attempt at this. But instead of doing a, a, not N, let's change this to do exists. Let's execute this query here real quick. And there we go. We actually get the correct results here. So the delivery methods that are not used by a supplier so what essentially we're doing here is very similar in spirit, the same idea here, but we're not quite leveraging that relationship between the two. That's the big reason here we're not leveraging the relationship between the two. So select the delivery delivery method where not exist select star from purchasing dot suppliers S where S delivery method ID equals DM delivery method ID so here is our correlation between the inner query and the outer query. So if there is no supplier For the delivery method that I'm for the delivery method from the outer query, then exclude that row and then exclude that row. But with the correlated sub query, we can actually leverage the relationship between the two tables, instead of trying to use the set operation not in but I'll stop this video there, because this video is running a little bit long. But in the following video, we'll take a look at a couple more more complicated examples of correlated sub queries.