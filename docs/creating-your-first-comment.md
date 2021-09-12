The principal entity of this API is the Comment, a comment is asociated with a kind of parent depending on what your bussiness does. For example, if you have a blog where users can comment on posts, the parent of the comment will be the post. We reference this parent from each comment using the `reference_id` that is some kind of unique identifier for the parents, in the blog example, the post id or the slug are natural candidates.

With the last explanation we have enought knowledge to create our first comment!

```bash
curl --request POST \
--url https://headless-comments-management-system.p.rapidapi.com/comments \
--header 'x-rapidapi-key: <your-token>' \
--data '{
    "body": "Test comment!!",
    "reference_id": "test-reference-id"
}'
```

The `reference_id` allows you to organize and group the comments of your platform more efficiently. They are just plain strings, so this can flexible enough for a lot of uses cases, for example if your blogs are identified using and UUID, you can convert it to string and use it as `reference_id`, or if you use the post slug, that is already a string.

The response of the last request will be something like this:

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

If you want to see the comment you just created, you can make this request:

```bash
curl --request GET \
--url 'https://headless-comments-management-system.p.rapidapi.com/comments?reference_id=test-reference-id' \
--header 'x-rapidapi-key: <your-token>'
```

That endpoint lets you fetch all the comments related to a specific `reference_id`.

Awesome, you know how to create basic comments, now lets check something better, how to create [nested comments](nested-comments.md)!
