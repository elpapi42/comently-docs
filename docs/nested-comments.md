During the introduction of the API we mentioned that we support "reddit-like commenting system", so if you visited reddit before, you already know that reddit supports nested comments, that means you can comment on comments!

Lets do it! it is really easy! it is the same request for create a comment, but we need to add a new field to the json body, the parent_id, the id of the comment that we want to reply to, but first lets create a comment, so we can reply to it.

```bash
curl --request POST \
--url https://headless-comments-management-system.p.rapidapi.com/comments \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Test comment!!",
    "reference_id": "test-reference-id"
}'
```

The response for that request was:

```json
{
  "id": "71e2360a-0db4-4d69-a7f2-0f20484387d1",
  "body": "Test comment!!",
  "parent_id": null,
  "reference_id": "test-reference-id",
  "created_at": "2021-09-11T22:23:03.629850",
  "user": null,
  "mentions": []
}
```

So, we extract the comment id from the response, in this case it is `71e2360a-0db4-4d69-a7f2-0f20484387d1`, so lets write a reply to that comment!

```bash
curl --request POST \
--url https://headless-comments-management-system.p.rapidapi.com/comments \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Nested comment!!",
    "reference_id": "test-reference-id",
    "parent_id": "71e2360a-0db4-4d69-a7f2-0f20484387d1",
}'
```

Now if we fetch by `reference_id`:

```bash
curl --request GET \
curl --request GET \
--url 'https://headless-comments-management-system.p.rapidapi.com/comments?reference_id=test-reference-id' \
--header 'x-rapidapi-key: <your-token>'
```

We get the following response:

```json
[
  {
    "id": "71e2360a-0db4-4d69-a7f2-0f20484387d1",
    "body": "Test comment!!",
    "parent_id": null,
    "reference_id": "test-reference-id",
    "created_at": "2021-09-11T22:53:08.152283",
    "user": null,
    "mentions": [],
    "replies": [
      {
        "id": "5e6b7896-481f-46be-8a64-cc8df95ea035",
        "body": "Nested comment!!",
        "parent_id": "71e2360a-0db4-4d69-a7f2-0f20484387d1",
        "reference_id": "test-reference-id",
        "created_at": "2021-09-11T22:53:23.303679",
        "user": null,
        "mentions": [],
        "replies": []
      }
    ]
  }
]
```

Both comments are nested! We can repeat this process for get deeper comments on the tree. The maximum depth of the comments tree is 10 for now, but you can use less depth than the supported, in fact the nesting is optional, you can have an application that only supports zero levels of nesting.
