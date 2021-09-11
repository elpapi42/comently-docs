This Headless Comments Management System (Headless CMS for the friends, what a coincidence!) is basically a platform that provides you with reddit-like commenting system as a service, just like Disqus, but without a Frontend, just the API, that can be integrated seamlessly with your existing Backend.

## Key features

* **Zero friction for your users**: Your users will never need to create an extra account just for commenting, they will be able to comment on your website using the same account they use for your website, or without account if you want to allow that.
* **Zero friction for the developers**: You can orchestrate all the commenting logic from your Backend, using a simple API that you can learn to use in 30 minutes.
* **No setup required**: You don't need to install anything, just use the API and you are ready to go.
* **Support for mentions**:  We scan the comments for @mentions and automatically link them to your users.

Our API is available in RapidAPI, you can subscribe to the free limited plan for play around with it.

## Quickstart

1. Register in [RapidAPI](https://rapidapi.com/hub)
2. Go to the [API home page](https://rapidapi.com/elpapi42/api/headless-comments-management-system/)
3. Subscribe to the free plan
4. Get your access token
    * From the [Developers Dashboard](https://rapidapi.com/developer/dashboard), select the default aplication (or you desired one) and go to security tab, then create or reveal the key.
5. Use the key to make a request to the API
    ```bash
    curl --request GET \
    --url 'https://headless-comments-management-system.p.rapidapi.com/comments?reference_id=ref' \
    --header 'x-rapidapi-key: <insert-your-token-here>'
    ```
    If you copy paste the curl request, remember to insert the access token.

Congratulations, you are ready to use the API!

## URL of the API

The current URL of the API is a subdomain the RapidAPI service:

```
https://headless-comments-management-system.p.rapidapi.com/
```

All the API routes are exposed on that subdomain.
