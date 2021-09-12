We support @mentions feature, if inside a comment body a user is @mentioned, we will account for it and return to you a list of the users that where mentioned, lets see how this works:

First of all, for a @mention to be recognized it is requried that the mentioned users is registered in out API, so lets do that first:

```bash
curl --request POST \
--url 'https://comently.p.rapidapi.com/users' \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "user_id": "987654321",
    "name": "olbert"
}'
```

Now we have our user registered, lets create the comment:

```bash
curl --request POST \
--url 'https://comently.p.rapidapi.com/comments' \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Hello @olbert!",
    "reference_id": "test-reference-id"
}'
```

We will scan the comment body for @mentions and try to find those users. The response of the above request is the following:

```json
{
  "id": "16a41746-ddde-4254-8534-69ddad945623",
  "body": "Hello @olbert!",
  "parent_id": null,
  "reference_id": "test-reference-id",
  "created_at": "2021-09-12T20:48:58.451501",
  "user": null,
  "mentions": [
    {
      "user_id": "987654321",
      "name": "olbert"
    }
  ]
}
```

So now you have a clear picture of who was mentioned in the comment, so then you for example trigger a notifications system from your backend, or do whatever you want with that information!

The problem with this implementation is that now we do not support cases of duplicated names, so if you have two users with the same name, we will return all of them on the list of mentioned users. A possible mitigation for this is to give you the opportunity to provide a "hint" to our api about which users where mentioned, but that is not implemented yet.
