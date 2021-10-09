"""
YRU OpenIdConnect
"""
from .open_id_connect import OpenIdConnectAuth

class YRUOpenIdConnect(OpenIdConnectAuth):
    name = 'yru-openidconnect'
    OIDC_ENDPOINT = 'https://passport.yru.ac.th/'