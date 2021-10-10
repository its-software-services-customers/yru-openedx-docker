"""
YRU OpenIdConnect
"""
from .open_id_connect import OpenIdConnectAuth
from jose import jwk, jwt
from jose.utils import base64url_decode
from social_core.backends.oauth import BaseOAuth2

class YRUOpenIdConnect(OpenIdConnectAuth):
    name = 'yru-openidconnect'
    OIDC_ENDPOINT = 'https://passport.yru.ac.th/'
