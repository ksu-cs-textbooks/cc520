---
title: "Obtaining Good Database Design"
weight: 15
pre: "3. "
---

{{< youtube QfL7vrvnZL8 >}}

## Video Transcription

Welcome back everyone. And in this video, we're going to start taking a look at some of the fundamental database design theory, that makes a good design better. So we've already covered some things that centers are on, on what not to do with a database design, right? primarily centered around inconsistency with data and redundant information. We saw this with the university course example as well. But data redundancy can be a problem with you know, with redundant data, which record is the consistent one, which one is the truth, right? If we have the department name for computer science listed more than once, which spelling is the correct one, this becomes even more of an issue with misspellings of people people's names or emails or things like that. Um, so data consistency is a huge issue there with data that is copied in into multiple places, especially when we deal with things like deletes or updates to information as well. So if we have to update things in multiple locations, some may get missed. And so that data record is no longer consistent with the original. And so that introduces this idea of data anomalies, behind data, redundancy, data consistency, and all sorts of other issues, including an the worst case scenario losing information. And so bad database design isn't just about an efficiency or performance issue. It really highlights issues with keeping our data safe, secure, and true or consistent with how we actually store it. 

That brings a good question to how do we actually achieve a good database design? Well, we've already showcased some of the issues that we encountered in representing a course as part of a university, and trying to reduce the amount of redundant data that we're actually storing. But it's much more than just redundant data. So overall, a lot of the underlying theory that we're going to be focusing on is this idea of normal forms, which have been developed over the course of many years through a lot of different database researchers, a normal form is going to typically guarantee for a database if a database design follows a one of the normal forms, it's going to have this guarantee the sets have guaranteed different properties associated with it. And we'll talk about some of those properties here and a little bit, the most common normal forms that you'll see are third normal form, and Boyce Codd Normal Form. And we will cover both of these and a little bit. But they aren't going to be the core focus of what we're talking about today. But third normal form and Boyce Codd Normal Form do guarantee certain types of data redundancy. And there's quite a few different types of data redundancy overall. But as far as normal form normal forms go, there's actually five Normal forms in addition to Boyce Codd Normal Form. And the higher you go here, and number. So the more you go down into the center, the more consistent your data is going to be. 

But the sweet spot is typically going to be there around Boyce Codd, or third normal form. So these are going to be the most common goals behind the database designs is what you're trying to shoot for. But what is a normal form? Well, overall, normal forms are going to be defined using two primary things, keys and functional dependencies. We've talked about keys in the past and the idea of a primary key which uniquely identifies a row. And we haven't really hit on functional dependencies quite yet. But generally speaking, normal forms are going to have a lot of restrictions on these two things, particularly around keys and functional dependencies in order to guarantee certain types of data integrity and data consistency. But we'll talk about those in a following video.