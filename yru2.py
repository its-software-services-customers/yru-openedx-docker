"""
Amazon OAuth2 backend, docs at:
    https://python-social-auth.readthedocs.io/en/latest/backends/amazon.html
"""
import ssl

from .oauth import BaseOAuth2

class YRUOpenIdConnect2(BaseOAuth2):
    name = 'yru-openidconnect2'
    ID_KEY = 'user_id'
    AUTHORIZATION_URL = 'https://passport.yru.ac.th/oauth/authorize'
    ACCESS_TOKEN_URL = 'https://passport.yru.ac.th/oauth/token'
    DEFAULT_SCOPE = ['openid', 'profile', 'email']
    REDIRECT_STATE = True
    ACCESS_TOKEN_METHOD = 'POST'

    EXTRA_DATA = [
        ('refresh_token', 'refresh_token', True)
    ]

    def get_user_details(self, response):
        """Return user details from Yru account"""
        return {'username': response.get('username'),
                'email': response.get('email') or '',
                'first_name': response.get('name'),
                'last_name': ''}


    def user_data(self, access_token, *args, **kwargs):
        response = self.get_json('https://passport.yru.ac.th/api/identity/userinfo',
            headers={ 'Authorization': 'Bearer {}'.format(access_token) } )

        response = {
            'user_id': response['id'],
            'name': response['name'],
            'email': response['email']
        }

        return response
