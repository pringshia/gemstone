gemstone
========

A framework for crowd-sourcing moderation

# Methods

    content_for(user)
Lists all the content designated for `user`

    unauthorized_content_for(user)
Lists all the unauthorized content designated for `user`

    authorized_content_for(user)
Lists all the authorized content designated for `user`

    request_content(user)
Requests access to new content for `user`

    deliver_content(user, content)
Delivers `content` on behalf of `user`

    curate_content(user, content, rating)
Allows `user` to give `content` a rating of `rating`
