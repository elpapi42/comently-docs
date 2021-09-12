For delete a comment it is very similar to update a comment, lets first create the comment we want to delete:

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
  "id": "47003b9e-679e-412b-a070-bc3e82f8f890",
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

Then we just call the following endpoint to delete the comment, iserting the comment id as the path paramater:

```bash
curl --request DELETE \
--url 'https://headless-comments-management-system.p.rapidapi.com/comments/47003b9e-679e-412b-a070-bc3e82f8f890' \
--header 'x-rapidapi-key: <your-token>' \
```

The permissions strategy for deleting comments is the same as described in [Update a comment](update-a-comment.md)
