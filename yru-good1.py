from .oauth import BaseOAuth2


class YRUOpenIdConnect(BaseOAuth2):
    """GitLab OAuth authentication backend"""
    name = 'yru-openidconnect'
    API_URL = 'https://passport.yru.ac.th/'
    AUTHORIZATION_URL = 'https://passport.yru.ac.th/oauth/authorize'
    ACCESS_TOKEN_URL = 'https://passport.yru.ac.th/oauth/token'
    ACCESS_TOKEN_METHOD = 'POST'
    REDIRECT_STATE = False
    DEFAULT_SCOPE = ['read_user']
    EXTRA_DATA = [
        ('id', 'id'),
        ('expires_in', 'expires'),
        ('refresh_token', 'refresh_token')
    ]

    def api_url(self, path):
        api_url = self.setting('API_URL') or self.API_URL
        return '{0}{1}'.format(api_url.rstrip('/'), path)

    #def authorization_url(self):
    #    return self.api_url('/oauth/authorize')

    #def access_token_url(self):
    #    return self.api_url('/oauth/token')

    def get_user_details(self, response):
        """Return user details from GitLab account"""
        fullname, first_name, last_name = self.get_user_names(
            response.get('name')
        )
        return {'username': response.get('username'),
                'email': response.get('email') or '',
                'fullname': fullname,
                'first_name': first_name,
                'last_name': last_name}

    def user_data(self, access_token, *args, **kwargs):
        """Loads user data from service"""
        return self.get_json(self.api_url('/api/v4/user'), params={
            'access_token': access_token
        })
