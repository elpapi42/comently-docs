Now we will create a comment that was writen by an user, in the previous chapter we registered a user called `whitman` with an id `123456789`, lets create a comment with the user whitman:

```bash
curl --request POST \
--url https://headless-comments-management-system.p.rapidapi.com/comments \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Test comment!!",
    "reference_id": "test-reference-id",
    "user_id": "123456789"
}'
```

Notice the new parameter "user_id" that we added, this is the id of the user that wrote the comment, this is the same id that we registered in the previous chapter. The response will be the following:

```json
{
  "id": "d34a8e8c-fc1d-46a3-8873-6230f28c80c6",
  "body": "Test comment!!",
  "parent_id": null,
  "reference_id": "test-reference-id",
  "created_at": "2021-09-12T18:33:29.260283",
  "user": {
    "user_id": "123456789",
    "name": "whitman"
  },
  "mentions": []
}
```

Now the user key is not null.