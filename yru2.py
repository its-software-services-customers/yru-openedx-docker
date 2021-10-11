"""
YRU OpenIdConnect
"""

from .open_id_connect import OpenIdConnectAuth

class YRUOpenIdConnect2(OpenIdConnectAuth):
    name = 'yru-openidconnect'
    OIDC_ENDPOINT = 'https://passport.yru.ac.th/'

    def get_user_details(self, response):
        return {'username': response.get('preferred_username'),
                'email': response.get('email') or '',
                'first_name': response.get('given_name'),
                'last_name': response.get('family_name')}

    def user_data(self, access_token, *args, **kwargs):
        return self.get_json(
            'https://passport.yru.ac.th/api/identity/userinfo',
            headers={
                'Authorization': 'Bearer {}'.format(access_token),
            }
        )
