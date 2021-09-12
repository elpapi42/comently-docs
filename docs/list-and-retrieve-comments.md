We already used the endpoint for list comments a few times, but now lets go deeper.

## List comments by `reference_id`

```bash
curl --request GET \
--url 'https://comently.p.rapidapi.com/comments?reference_id=test-reference-id' \
--header 'x-rapidapi-key: <your-token>'
```

You can pass the query parameter `reference_id` to fetch all the comments that are related/grouped.

In the future we will support filtering by other params, like `user_id` or `created_at`, even text search on the comments `body` is planned.

## Get a single comment by `id`

```bash
curl --request GET \
--url 'https://comently.p.rapidapi.com/comments/<comment-id>' \
--header 'x-rapidapi-key: <your-token>'
```

Replace the path parameter <comment-id> with the comment id you want to retrieve. The response of this request will not include the sub-comments/replies.
