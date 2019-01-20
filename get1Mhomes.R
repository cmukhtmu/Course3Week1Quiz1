library(httr)

CreateTime <- function() {
    # 1. Find OAuth settings for github:
    #    http://developer.github.com/v3/oauth/
    oauth_endpoints("github")
    
    # 2. To make your own application, register at
    #    https://github.com/settings/developers. Use any URL for the homepage URL
    #    (http://github.com is fine) and  http://localhost:1410 as the callback url
    #
    #    Replace your key and secret below.
    myapp <- oauth_app("github",
                       key = "de22dd32d7935f3097c5",
                       secret = "603c425bcdb9db4d55145d0cceec87518f5e42b3"
    )
    
    # 3. Get OAuth credentials
    github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
    
    # 4. Use API
    gtoken <- config(token = github_token)
    req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
    stop_for_status(req)
    content(req)
}