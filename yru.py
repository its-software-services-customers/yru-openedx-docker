"""
YRUOpenIdConnect:
    https://python-social-auth.readthedocs.io/en/latest/backends/google.html
"""
from .open_id_connect import OpenIdConnectAuth
from .google import GoogleOAuth2

class YRUOpenIdConnect(OpenIdConnectAuth):
    name = 'yru-openidconnect'
    OIDC_ENDPOINT = 'https://passport.yru.ac.th/'
