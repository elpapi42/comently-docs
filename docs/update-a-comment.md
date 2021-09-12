Usually users wants to update the comments they write, lets do that with out API, first lets create a comment:

```bash
curl --request POST \
--url 'https://headless-comments-management-system.p.rapidapi.com/comments' \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Test comment!!",
    "reference_id": "test-reference-id",
    "user_id": "123456789"
}'
```

The resposne from that request is the following:

```json
{
  "id": "30503b9e-679e-412b-a070-bc3e82f8f36c",
  "body": "Test comment!!",
  "parent_id": null,
  "reference_id": "test-reference-id",
  "created_at": "2021-09-12T18:54:45.618530",
  "user": {
    "user_id": "123456789",
    "name": "whitman"
  },
  "mentions": []
}
```

Now lets update the comment, we take the id of the comment we created and use it in the following request:

```bash
curl --request PATCH \
--url 'https://headless-comments-management-system.p.rapidapi.com/comments/30503b9e-679e-412b-a070-bc3e82f8f36c' \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Updated comment!!"
}'
```

You only need to send the new body for the comment! Now our comment is updated:

```json
{
  "id": "30503b9e-679e-412b-a070-bc3e82f8f36c",
  "body": "Updated comment!!",
  "parent_id": null,
  "reference_id": "test-reference-id",
  "created_at": "2021-09-12T18:54:45.618530",
  "user": {
    "user_id": "123456789",
    "name": "whitman"
  },
  "mentions": []
}
```

## Update permissions

It is probable that you want to ensure only creators of the comments can update them, our API does not support managing permissions, you are at charge of that. But you it is easy to do from your Backend:

1. When an user request to update a comment, you fetch the comment from our API using the endpoint described in [List and retrieve comments](list-and-retrieve-comments.md)
2. You check if the user requesting the change is user in the comment retrieved in the previous step
3. If the user is the creator of the comment, you can update the comment
4. If the user is not the creator of the comment, you return back a permissions error
