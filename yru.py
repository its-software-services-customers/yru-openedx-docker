"""
Google OpenIdConnect:
    https://python-social-auth.readthedocs.io/en/latest/backends/google.html
"""
from .open_id_connect import OpenIdConnectAuth
from .google import GoogleOAuth2


class YRUOpenIdConnect(GoogleOAuth2, OpenIdConnectAuth):
    name = 'yru-openidconnect'
    OIDC_ENDPOINT = 'https://passport.yru.ac.th/'
    ID_TOKEN_ISSUER = 'https://passport.yru.ac.th/'

    def user_data(self, access_token, *args, **kwargs):
        """Return user data from Google API"""
        return self.get_json(
            'https://passport.yru.ac.th/api/identity/userinfo',
            params={'access_token': access_token, 'alt': 'json'}
        )
