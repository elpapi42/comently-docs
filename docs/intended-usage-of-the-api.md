In this section we will explain the usage of this service in a near real-life scenario, so you will be able to understand the design principles of the service!

## Context

You are a Engineer working on a platform that distributes MOOCs (Like Coursera, Platzi, Udemy, etc.), you have a lot of technology in place for the different parts of the platform like payments, analytics, streaming of the contents, autheticantion, content management systems for your courses, etc.

Suddenly one morning a product folk presented to the whole company a new feature that he wants to add to the platform, it is a comment box for each video of each course in the platform, that way the students will be able to interact beetween them and with the teachers!

So, now is your reponsability to solve this problem.

## Exploring the solutions

You start your research, and as you are a lazy bastard, the first thing you look for is a service that already do all this stuff for you, that way you will only integrate the solution and thats it! Probably the first one you will find is Disqus, it is the biggest platform for this kind of service right now, so what can go bad? You take a look to the ddocs and you realize that for integrate with them, it is requried to setup a few bit on the frontend and you will be ready to go! The problem is that now for create comments, your users will need to create a new account on Disqus, so you piss off, because for your company is alrady hard to convince an user to register on your own platform! This solution adds a lot of friction, this will never work for you.

Now you are resignated after finding a couple of other services that offer the same as Disqus. You start thinking about a in-house solution for this feature, and you realize this will take a lot of work to implement, but you dont have the time, product team requires this feature asap, otherwise your platform will be left behind by the competition.

After hours of research you find this obscure documentation in the middle of nowhere, and you realize it offers a balance beetween the two scenarios described above, it is a managed service, you you dont need care about the implementation, and at the same time you can integrate it with your existing platform, reusing you authentication and keeping your users happy because they only need to create on single account for everything in your platform, so lets explore this solution!

## Dive deeper into the solution

After 30 minutes of reading the documentation you wrap your head aroudn how to implement this, the key points are the following:

* You will need to create a couple of endpoints in your API for normal CRUD operations for comments.
* It will be required that each time a new user is registered in your platform, you also register it on this comments service only using the basic information (user_id and name).
* You will take care of the permissions for each user.

Thats it! you are ready to go!

PD: Im a lazy bastard too, i faced the same problems described above, so i decided to create this API as a side project.
