This API has a couple of endpoints dedicated to users, where you can for example register an user. The porpouse is to be able to stablish a relationship between comments and their creators, the users of your platform. This will let you know who created a comment, also will enable our @mentions feature, we will talk about that later.

First of all, you need to register an user!

```bash
curl --request POST \
--url https://headless-comments-management-system.p.rapidapi.com/users \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "user_id": "123456789",
    "name": "whitman"
}'
```

The `user_id` represent an unique identifier for the user inside your platform, this is a plain string, so you can use any format of string you already support in your own platform (uuid, MongoDb objectid, integers, etc) parsed as string. If inside your platform the unique identifier of your users is their nicknames, you can use them too. 

On the other side, we use the name parameter for look out for mentions of the user inside the comments, so when someone @mentions an user, we can know who is the user that was mentioned. This has some drawbacks, for example if you want to support users who have deplicated names, our mentions listener will not work properly on its own, we will talk about how to solve this situation later, now lets focus on the basics!

Let go to the [create comment with user](create-comment-with-user.md) section!
